project_name: "gowri_bq"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }


constant: AMAZON_NON_ATTRIBUTABLE_CASE {
  value: "@{AMAZON_NON_ATTRIBUTABLE_LOGIC}
  CASE WHEN ${TABLE}.status = 'complete' THEN 'Not Attributable' ELSE {{case_var}} END
  {% else %}
  {{case_var}}
  {% endif %}"
}

constant: AMAZON_NON_ATTRIBUTABLE_LOGIC {
  value: "{% if orders.total_num_of_item._in_query
  or orders.count._in_query
  %}"
}

new_lookml_runtime: yes
