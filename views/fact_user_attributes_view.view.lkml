view: fact_user_attributes_view {
  sql_table_name: `SCO_Poc.Fact_UserAttributes_view`
    ;;
  drill_fields: [id]
label: "Activity & Attributes"
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: attributes {
    hidden: yes
    sql: ${TABLE}.Attributes ;;
  }

  dimension_group: crreated {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.CrreatedDate ;;
  }

  dimension: customer_source {
    type: string
    sql: ${TABLE}.CustomerSource ;;
  }

  dimension: days_since_last_log_in {
    type: number
    sql: ${TABLE}.DaysSinceLastLogIn ;;
  }

  dimension: display_name {
    type: string
    sql: ${TABLE}.display_name ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}.groupId ;;
  }

  dimension_group: last_log_in {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.LastLogIn ;;
  }

  dimension: role_id {
    type: number
    sql: ${TABLE}.roleId ;;
  }



  measure: count {
    type: count
    drill_fields: [id, display_name]
  }

  dimension: name {
    label: "Attribute Name"
    type: string
    sql: ${TABLE}.Attributes.name ;;
  }

  dimension: source {
    label: "Attribute Source"
    type: string
    sql: ${TABLE}.Attributes.source ;;
  }

  dimension: value {
    label: "Attribute Value"
    type: string
    sql: ${TABLE}.Attributes.value ;;
  }

  dimension: role_names {
    label: "User Roles"
    type: string
    sql: ${TABLE}.role_names ;;
  }
  dimension: updateddate {
    label: "Updated Date"
    type: date_time
    sql: ${TABLE}.updateddate ;;
  }
  dimension: account {
    label: "Account"
    type: string
    sql: ${TABLE}.account ;;
  }

  dimension: tenant_id {
    label: "Tenant"
    type: string
    sql: ${TABLE}.tenant_id ;;
    action: {
      label: "Update tenant"
      url: "https://us-central1-com-loyalpro-global-dev.cloudfunctions.net/Chang_UserTenant"
      param: {
        name:"tenant_id"
        value: "{{value}}"
      }
      user_attribute_param: {
        user_attribute: id
        name: "user_id"
      }
      form_param: {
        name: "changetenant"
        type: string
        label: "Tenant"
        description: "Enter new tenant."
        required: yes
      }
    }
 }
}
