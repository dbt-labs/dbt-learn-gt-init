{% docs stripe_payment_status %}

Current state of the Stripe payment record.

| status    | definition                                                    |
|-----------|---------------------------------------------------------------|
| success   | Payment was processed successfully.                           |
| fail      | Payment failed during processing.                             |
| pending   | Payment is created but not finalized yet.                     |

{% enddocs %}

{% docs stripe_payment_method %}

Payment method used for the transaction.

| payment_method | definition                                   |
|----------------|----------------------------------------------|
| credit_card    | Charged through a card network.              |
| coupon         | Fully or partially covered by coupon credit. |
| bank_transfer  | Paid by direct bank transfer.                |
| gift_card      | Covered using gift card balance.             |

{% enddocs %}

