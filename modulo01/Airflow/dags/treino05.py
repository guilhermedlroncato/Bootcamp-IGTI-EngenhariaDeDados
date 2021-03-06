# Dag para dados do titanic
from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from airflow.operators.python_operator import PythonOperator, BranchPythonOperator
from datetime import datetime, timedelta
import pandas as pd
import random
import zipfile
import pymysql
from sqlalchemy import create_engine

# constantes
data_path = '/home/alunoigti/microdados_enade_2019/2019/3.DADOS/'
arquivo = data_path + 'microdados_enade_2019.txt'

# Argumentos Default
default_args = {
    'owner': 'Guilherme Roncato',
    'depends_on_past': False,
    'start_date': datetime(2020, 11, 25, 19),
    'email': ['guilhermeroncato@gmail.com'],
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes = 1)
}

# Vamos defirni a DAG - Fluxo
dag = DAG(
    'treino-05',
    description = 'Paralelismos',
    default_args = default_args,
    schedule_interval = '*/10 * * * *'
)

start_preprocessing = BashOperator(
    task_id = 'start_preprocessing',
    bash_command = 'echo "Start Preprocessing! Vai!"',
    dag = dag
)

get_data = BashOperator(
    task_id = 'get-data',
    bash_command = 'curl http://download.inep.gov.br/microdados/Enade_Microdados/microdados_enade_2019.zip -o ~/microdados_enade_2019.zip',
    dag = dag
)

def unzip_file():
    with zipfile.ZipFile('/home/alunoigti/microdados_enade_2019.zip', 'r') as zip:
        zip.extractall('/home/alunoigti/')

unzip_data = PythonOperator(
    task_id = 'unzip_data',
    python_callable = unzip_file,
    dag = dag
)

def aplica_filtros():
    cols = ['CO_GRUPO', 'TP_SEXO', 'NU_IDADE', 'NT_GER', 'NT_FG', 'NT_CE', 'QE_I01', 'QE_I02', 'QE_I04', 'QE_I05', 'QE_I08']
    enade = pd.read_csv(arquivo, sep = ';', decimal = ',', usecols = cols)
    enade = enade.loc[
        (enade.NU_IDADE > 20) &
        (enade.NU_IDADE < 40) &
        (enade.NT_GER > 0)
    ]
    enade.to_csv(data_path + 'enade_filtrado.csv', index = False)

task_aplica_filtro = PythonOperator(
    task_id = 'aplica_filtro',
    python_callable = aplica_filtros,
    dag = dag
)

# Idade centralizada na media
def constroi_idade_centralizada():
    idade = pd.read_csv(data_path + 'enade_filtrado.csv', usecols = ['NU_IDADE'])
    idade['idadecent'] = idade.NU_IDADE - idade.NU_IDADE.mean()
    idade[['idadecent']].to_csv(data_path + 'idadecent.csv', index = False)

# Idade centralizada ao quadrado
def constroi_idade_cent_quad():
    idadecent = pd.read_csv(data_path + 'idadecent.csv')
    idadecent['idade2'] = idadecent.idadecent ** 2
    idadecent[['idade2']].to_csv(data_path + 'idadequadrado.csv', index = False)

task_idade_cent = PythonOperator(
    task_id = 'constroi_idade_centralizada',
    python_callable = constroi_idade_centralizada,
    dag = dag
)

task_idade_quad = PythonOperator(
    task_id = 'constroi_idade_cent_quad',
    python_callable = constroi_idade_cent_quad,
    dag = dag
)

def constroi_est_civil():
    filtro = pd.read_csv(data_path + 'enade_filtrado.csv', usecols = ['QE_I01'])
    filtro['estcivil'] = filtro.QE_I01.replace({
        'A': 'Solteiro',
        'B': 'Casado',
        'C': 'Separado',
        'D': 'Viúvo',
        'E': 'OUtro'
    })
    filtro[['estcivil']].to_csv(data_path + 'estcivil.csv', index = False)

task_est_civil = PythonOperator(
    task_id = 'constroi_est_civil',
    python_callable = constroi_est_civil,
    dag = dag
)

def constroi_cor():
    filtro = pd.read_csv(data_path + 'enade_filtrado.csv', usecols = ['QE_I02'])
    filtro['cor'] = filtro.QE_I02.replace({
        'A': 'Branca',
        'B': 'Preta',
        'C': 'Amarela',
        'D': 'Parda',
        'E': 'Indígena',
        'F': '',
        ' ': ''
    })
    filtro[['cor']].to_csv(data_path + 'cor.csv', index = False)

task_cor = PythonOperator(
    task_id = 'constroi_cor',
    python_callable = constroi_cor,
    dag = dag
)

# Task de Join
def join_data():
    filtro = pd.read_csv(data_path + 'enade_filtrado.csv')
    idadecent = pd.read_csv(data_path + 'idadecent.csv')
    idadequadrado = pd.read_csv(data_path + 'idadequadrado.csv')
    estcivil = pd.read_csv(data_path + 'estcivil.csv')
    cor = pd.read_csv(data_path + 'cor.csv')

    final = pd.concat([
        filtro, idadecent, idadequadrado, estcivil, cor
    ],
    axis = 1)

    final.to_csv(data_path + 'enade_tratado.csv', index = False)
    print(final)

task_join = PythonOperator(
    task_id = 'join_data',
    python_callable = join_data,
    dag = dag
)

def escreve_dw():
    final = pd.read_csv(data_path + 'enade_tratado.csv')
    # conexão com MySql
    engine = create_engine('mysql+pymysql://root:root@localhost/DW')
    final.to_sql('tratado', con = engine, index = False, chunksize = 10000)

task_escreve_dw = PythonOperator(
    task_id = 'escreve_dw',
    python_callable = escreve_dw,
    dag = dag
)

start_preprocessing >> get_data >> unzip_data >> task_aplica_filtro >> [task_idade_cent, task_est_civil, task_cor]
task_idade_quad.set_upstream(task_idade_cent)
task_join.set_upstream([
    task_est_civil, task_cor, task_idade_quad
])
task_join >> task_escreve_dw