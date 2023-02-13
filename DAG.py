from datetime import datetime, timedelta
import airflow
from airflow import DAG
from airflow.providers.vertica.operators.vertica import VerticaOperator
from Task1 import MySqlToVerticaOperator

MySQL_conn_id = 'mysql_conn_id'
Vertica_conn_id = 'vertica_conn_id'

dag = DAG(
    dag_id="from_mysql_to_vertica",
    schedule_interval="0 0 * * *",
    concurrency=100
)

Task1 = MySqlToVerticaOperator(
    task_id="Getting data from Mysql",
    sql="sql/select_from_mysql.sql",
    target_table='stg.transactions',
    identifier='id',
    mysql_conn_id=MySQL_conn_id,
    vertica_conn_id=Vertica_conn_id,
    dag=dag,
)

Task2 = VerticaOperator(
    task_id='from_stg_to_dds_transactions',
    vertica_conn_id=Vertica_conn_id,
    sql='sql/dds/transactions.sql',
    dag=dag
)

Task3 = VerticaOperator(
    task_id='creating_history_of_transactions',
    vertica_conn_id=Vertica_conn_id,
    sql='sql/dds/hist_transactions.sql',
    dag=dag
)

Task1 >> Task2
Task1 >> Task3