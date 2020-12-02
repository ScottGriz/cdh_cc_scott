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
view: transactions_cc {
  sql_table_name: creditcard.transactions_cc ;;
  suggestions: no

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: ccn {
    type: string
    sql: ${TABLE}.ccn ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: ip_address {
    type: string
    sql: ${TABLE}.ip_address ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: ssn {
    type: string
    sql: ${TABLE}.ssn ;;
  }

  dimension_group: tnxdate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.tnxdate ;;
  }

  dimension: tnxid {
    type: string
    sql: ${TABLE}.tnxid ;;
  }

  dimension: userid {
    type: string
    sql: ${TABLE}.userid ;;
  }

  measure: count {
    type: count
    drill_fields: [first_name, last_name]
  }
}
