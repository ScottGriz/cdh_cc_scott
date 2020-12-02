connection: "okera_cdh_cesium"

# include all the views
include: "/views/**/*.view"

datagroup: cdh_cc_scott_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: cdh_cc_scott_default_datagroup

explore: transactions_cc {}
explore: transactions_amount_country {}
