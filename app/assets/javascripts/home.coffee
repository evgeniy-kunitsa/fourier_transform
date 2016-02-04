# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  hide_tables()
  setup_variable_selection()
  build_charts()

hide_tables = ()->
  for data_table_holder in $('.data-table-holder')
    $(data_table_holder).hide()

setup_variable_selection = () ->
  for index_toggle_button in $('.conversion-table-toggle')
    $(index_toggle_button).on "click", (event) ->
      hide_previous_table()
      show_selected_table($(this))
      event.preventDefault()

hide_previous_table = () ->
  previous_table_id = $('#variable-selector').text().trim().substr(1)
  $("#data-table-#{previous_table_id}").hide()

show_selected_table = (selected_table_toggle) ->
  table_id = $(selected_table_toggle).text().trim().substr(1)
  $("#data-table-#{table_id}").show()
  $('#variable-selector').text("x#{table_id}")

build_charts = () ->
  direct_chart_data = {
    labels : $('#direct_conversion_data').data('indexes'),
    datasets : [
      {
        fillColor : "rgba(220,220,220,0.5)",
        strokeColor : "rgba(220,220,220,1)",
        pointColor : "rgba(220,220,220,1)",
        pointStrokeColor : "#fff",
        data : $('#direct_conversion_data').data('values')
      },
    ]
  }
  direct_chart = new Chart($("#direct_conversion_canvas").get(0).getContext("2d")).Bar(direct_chart_data)

  reverse_chart_data = {
    labels : $('#reverse_conversion_data').data('indexes'),
    datasets : [
      {
        fillColor : "rgba(220,220,220,0.5)",
        strokeColor : "rgba(220,220,220,1)",
        pointColor : "rgba(220,220,220,1)",
        pointStrokeColor : "#fff",
        data : $('#reverse_conversion_data').data('values')
      },
    ]
  }
  reverse_chart = new Chart($("#reverse_conversion_canvas").get(0).getContext("2d")).Line(reverse_chart_data)

  original_function_data = {
    labels : $('#original_function_data').data('indexes'),
    datasets : [
      {
        fillColor : "rgba(220,220,220,0.5)",
        strokeColor : "rgba(220,220,220,1)",
        pointColor : "rgba(220,220,220,1)",
        pointStrokeColor : "#fff",
        data : $('#original_function_data').data('values')
      },
    ]
  }
  reverse_chart = new Chart($("#original_function_canvas").get(0).getContext("2d")).Line(original_function_data)
