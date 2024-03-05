# If necessary, uncomment the line below to include explore_source.
# include: "gowri_bq.model.lkml"

view: test_pdtt {
  derived_table: {
    explore_source: order_items {
      column: order_id { field: orders.order_id }
      column: status { field: orders.status }
    }
  }
  dimension: order_id {
    description: ""
    type: number
  }
  dimension: status {
    description: ""
  }
}
