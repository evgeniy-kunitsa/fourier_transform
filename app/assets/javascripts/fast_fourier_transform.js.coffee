# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

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
  options = {
    scaleBeginAtZero: false,
    responsive: true
  }

  fast_direct_chart_data = {
    labels : $('#fast_direct_conversion_data').data('indexes'),
    datasets : [
      {
        fillColor : "rgba(62,80,180,0.5)",
        strokeColor : "rgba(62,80,180,1)",
        pointColor : "rgba(62,80,180,1)",
        pointStrokeColor : "#fff",
        data : $('#fast_direct_conversion_data').data('values')
      },
    ]
  }
  $("#fast_direct_conversion_canvas").css('width', 900).css('height', 600)
  fast_direct_chart = new Chart($("#fast_direct_conversion_canvas").get(0).getContext("2d")).Bar(fast_direct_chart_data, options)

  fast_reverse_chart_data = {
    labels : $('#fast_reverse_conversion_data').data('indexes'),
    datasets : [
      {
        fillColor : "rgba(232,29,98,0.5)",
        strokeColor : "rgba(232,29,98,1)",
        pointColor : "rgba(232,29,98,1)",
        pointStrokeColor : "#fff",
        data : $('#fast_reverse_conversion_data').data('values')
      },
    ]
  }
  $("#fast_reverse_conversion_canvas").css('width', 900).css('height', 600)
  fast_reverse_chart = new Chart($("#fast_reverse_conversion_canvas").get(0).getContext("2d")).Line(fast_reverse_chart_data)


$ ->
  hide_tables()
  setup_variable_selection()
  build_charts()

  $('a').on 'shown.bs.tab', (event) ->
    build_charts()
