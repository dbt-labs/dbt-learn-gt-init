{% docs order_status %}

A doc block via a mark down (.md) file allows you to write verbose documentation.

A doc block can be referred to within a source yaml file by using: description: "{{ doc('order_status') }}" for example#

Important to use the doc block name and not the file name since there might be multiple doc blocks within a single mark down file

Explanation of the status column in the orders table and what each of the different values mean.

One of the following values: 

| status         | definition                                       |
|----------------|--------------------------------------------------|
| placed         | Order placed, not yet shipped                    |
| shipped        | Order has been shipped, not yet been delivered   |
| completed      | Order has been received by customers             |
| return pending | Customer indicated they want to return this item |
| returned       | Item has been returned                           |

{% enddocs %}