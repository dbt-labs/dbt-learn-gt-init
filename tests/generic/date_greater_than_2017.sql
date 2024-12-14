{% test date_greater_than_2017(model, column_name) %} 

select * from {{ model }} 
where {{ column_name }} < '2018-01-01' 

{% endtest %}