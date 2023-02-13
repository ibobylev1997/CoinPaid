from airflow.hooks.base import BaseHook
from airflow.hooks.mysql_hook import MySqlHook
from airflow.providers.vertica.hooks.vertica import VerticaHook
from airflow.models.baseoperator import BaseOperator
from airflow.utils.decorators import apply_defaults


class MySqlToVerticaOperator(BaseOperator):
    
    @apply_defaults
    def __init__(self,
                 sql=None,
                 target_table=None,
                 identifier=None,
                 mysql_conn_id=None, 
                 vertica_conn_id=None,
                 *args,
                 **kwargs):
        
        super().__init__(*args, **kwargs)
        self.sql = sql
        self.target_table = target_table
        self.identifier = identifier
        self.mysql_conn_id = mysql_conn_id
        self.vertica_conn_id = vertica_conn_id

    def execute(self, context):
        
        start_date = 
        
        #Подключение к БД
        source = MySqlHook(self.mysql_conn_id)
        target = VerticaHook(self.vertica_conn_id)
        
        self.sql = sql.format()
        
        conn = source.get_conn()
        cursor = conn.cursor()
        
        #Извлечение данных
        cursor.execute(self.sql)
        
        target_fields = [x[0] for x in cursor.description]
        rows = cursor.fetchall()
        
        target.insert_rows(self.target_table,
                           rows,
                           target_fields=target_fields,
                           replace_index=self.identifier,
                           replace=True)
        
        cursor.close()
        conn.close()
