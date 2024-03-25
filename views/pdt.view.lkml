
  view:pdt{
    derived_table: {
      explore_source: order_items {
        column: created_date { field: orders.created_date }
        column: count { field: orders.count }
        column: gender { field: users.gender }
      }
     datagroup_trigger:gowri_bq_default_datagroup

    }
    dimension: created_date {
      description: ""
      type: date
    }
    dimension: count {
      description: ""
      type: number
    }
    dimension: gender {
      description: ""
    }
  }
