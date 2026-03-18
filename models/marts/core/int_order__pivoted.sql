{% set payment_methods = ['bank_transfer', 'gift_card', 'coupon', 'credit_card'] %}

WITH payments AS (
    SELECT
        *
    FROM {{ ref('stg_stripe__payments') }}
    WHERE payment_status = 'success'
)
, pivoted AS (
    SELECT
        order_id
        {% for method in payment_methods %}
        , SUM(CASE WHEN payment_method = '{{ method }}' THEN payment_amount ELSE 0 END) AS {{ method }}_total_amount
        {% endfor %}
    FROM payments
    GROUP BY order_id
)
SELECT *
FROM pivoted