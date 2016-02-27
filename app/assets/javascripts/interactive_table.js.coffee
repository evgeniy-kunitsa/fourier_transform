hide_tables = () ->
  for data_table_holder in $('.data-table-holder')
    $(data_table_holder).hide()


hide_previous_table = () ->
  previous_table_id = $('#variable-selector').text().trim().substr(1)
  $("#data-table-#{previous_table_id}").hide()

show_selected_table = (selected_table_toggle) ->
  table_id = $(selected_table_toggle).text().trim().substr(1)
  $("#data-table-#{table_id}").show()
  $('#variable-selector').text("x#{table_id} ")

setup_variable_selection = () ->
  for index_toggle_button in $('.conversion-table-toggle')
    $(index_toggle_button).on "click", (event) ->
      hide_previous_table()
      show_selected_table($(this))
      event.preventDefault()

$ ->
  hide_tables()
  setup_variable_selection()
