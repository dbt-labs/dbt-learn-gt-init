sources:
  - name: stripe
    database: raw
    schema: stripe
    tables:
      - name: payment
        config:
          loaded_at_field: _batched_at
          freshness:
            warn_after: {count: 12, period: hour}
            error_after: {count: 24, period: hour}