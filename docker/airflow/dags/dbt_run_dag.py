from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

with DAG(
    dag_id='dbt_run_example',
    schedule_interval='@daily',
    start_date=datetime(2026, 1, 1),
    catchup=False,
    tags=['dbt', 'bash_operator']
) as dag:

    # The paths map to where the volume is literally mapped inside the Docker container
    run_dbt_model = BashOperator(
        task_id='run_dbt_models',
        bash_command='''
        python3 -m venv /tmp/dbt_venv
        source /tmp/dbt_venv/bin/activate
        pip install dbt-core dbt-postgres
        dbt run --project-dir /opt/airflow/dbt_project --profiles-dir /opt/airflow/dbt_project
        '''
    )
