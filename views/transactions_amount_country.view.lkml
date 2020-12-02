view: transactions_amount_country {
#   # Or, you could make this view a derived table, like this:
  derived_table: {
    sql: SELECT
         country as country
         , sum(amount) as amount
       FROM transactions_cc
       GROUP BY country
      ORDER BY country DESC
       ;;
  }
#
#   # Define your dimensions and measures here, like this:
  dimension: country {
    description: "Country"
    type: string
    sql: ${TABLE}.country ;;
  }
#
  dimension: amount {
    description: "The sum of amount "
    type: number
    sql: ${TABLE}.amount ;;
  }
}
