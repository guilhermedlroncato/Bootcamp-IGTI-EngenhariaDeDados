import prefect
from prefect import task, Flow

@task
def hello_world():
    logger = prefect.context.get('logger')
    logger.info('Hello World do Prefect em Cloud!!! Aeee Krai!!!')

with Flow('Hello World') as flow:
    hello_world()

flow.register(project_name = 'Hello World')
flow.run_agent()