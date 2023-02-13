# CoinPaid

Для задачи необходимо было создать ELT pipeline, который выгружал бы данные из таблицы transactions в аналитическую БД.


<img src="https://user-images.githubusercontent.com/86730222/218435246-e09caa21-20f7-4fbe-bd7c-58993092b843.png" width="500" />

Необхоидимо выполнить 3 tasks:

1) Подключиться к СУБД MySQL, выгрузить snapshot за сегодня и сразу отправил на staging СУБД Vertica
2) Отправить данные из слоя staging СУБД Vertica таблицы stg.transactions в детальный слой dds.transactions
3) Преобрадовать таблицу stg.transactions в ее историческую таблицу dds.hist_transactions для сохранения истории


<img src="https://user-images.githubusercontent.com/86730222/218465158-db0fc19b-03ff-4b8c-97bd-de91008041ac.png" width="500" />
