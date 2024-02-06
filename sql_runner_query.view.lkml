
view: sql_runner_query {
  derived_table: {
    sql: SELECT
          order_items.status  AS order_items_status,
          order_items.sale_price  AS order_items_sale_price,
          users.gender  AS users_gender,
          ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE( order_items.sale_price  ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST( order_items.id   AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST( order_items.id   AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST( order_items.id   AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST( order_items.id   AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS NUMERIC), 0), 6) AS order_items_test3,
          ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE(CASE WHEN  users.city   !=  products.category   THEN  order_items.sale_price   ELSE NULL END
      ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(CASE WHEN  users.city   !=  products.category   THEN  order_items.id   ELSE NULL END
       AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(CASE WHEN  users.city   !=  products.category   THEN  order_items.id   ELSE NULL END
       AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(CASE WHEN  users.city   !=  products.category   THEN  order_items.id   ELSE NULL END
       AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(CASE WHEN  users.city   !=  products.category   THEN  order_items.id   ELSE NULL END
       AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS NUMERIC), 0), 6) AS gowri_testing,
          COUNT(*) AS order_items_count
      FROM `thelook_ecommerce_hc_eu.order_items`  AS order_items
      LEFT JOIN `thelook_ecommerce_hc_eu.users`  AS users ON order_items.user_id = users.id
      LEFT JOIN `thelook_ecommerce_hc_eu.products`  AS products ON order_items.product_id = products.id
      GROUP BY
          1,
          2,
          3
      ORDER BY
          4 DESC
      LIMIT 500 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: order_items_status {
    type: string
    sql: ${TABLE}.order_items_status ;;
  }

  dimension: order_items_sale_price {
    type: number
    sql: ${TABLE}.order_items_sale_price ;;
  }

  dimension: users_gender {
    type: string
    sql: ${TABLE}.users_gender ;;
  }

  dimension: order_items_test3 {
    type: number
    sql: ${TABLE}.order_items_test3 ;;
  }

  dimension: gowri_testing {
    type: number
    sql: ${TABLE}.gowri_testing ;;
  }

  dimension: order_items_count {
    type: number
    sql: ${TABLE}.order_items_count ;;
  }

  set: detail {
    fields: [
        order_items_status,
	order_items_sale_price,
	users_gender,
	order_items_test3,
	gowri_testing,
	order_items_count
    ]
  }
}
