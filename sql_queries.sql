with ranked_things as (
SELECT date_format(from_unixtime(transaction_ts), '%Y-%m-%dT%H:00:00Z') AS hour_date, *,
DENSE_RANK() OVER (PARTITION BY date_format(from_unixtime(transaction_ts), '%Y-%m-%dT%H:00:00Z'), symbol, type ORDER BY dollar_amount DESC) AS rank
from datalake_raw_174674824861_ps_1202064.crawler_stockdata
)
 
select * from ranked_things
where rank = 1
order by hour_date, symbol, type