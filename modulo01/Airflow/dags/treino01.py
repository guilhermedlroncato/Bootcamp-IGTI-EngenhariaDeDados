# primeira DAG com airflow

from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from airflow.operators.python_operator import PythonOperator
from datetime import datetime, timedelta

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
    'treino-01',
    description = 'Basico de Bash Operators e Python Operators',
    default_args = default_args,
    schedule_interval = timedelta(minutes = 2)
)

# Vamos começar a adicionar tasks
def say_hello():
    print('Hello AirFlow from Python')

hello_bash = BashOperator(
    task_id = 'hello_bash',
    bash_command = 'echo "Hello AirFlow from Bash"',
    dag = dag
)

hello_python = PythonOperator(
    task_id = 'Hello_Python',
    python_callable = say_hello,
    dag = dag
)

# Definindo as etapas de execução da DAG
hello_bash >> hello_python