view: dim_tenants {
  sql_table_name: `SCO_Poc.Dim_Tenants`
    ;;

  dimension: tenant_id {
    label: "Tenant"
    type: string
    sql: ${TABLE}.tenant_id ;;

  }

  measure: count {
    type: count
    drill_fields: []
  }
}
