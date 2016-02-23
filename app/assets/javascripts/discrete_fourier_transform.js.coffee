# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

build_charts = () ->
  direct_chart_data = {
    labels : $('#direct_conversion_data').data('indexes'),
    datasets : [
      {
        fillColor : "rgba(62,80,180,0.5)",
        strokeColor : "rgba(62,80,180,1)",
        pointColor : "rgba(62,80,180,1)",
        pointStrokeColor : "#fff",
        data : $('#direct_conversion_data').data('values')
      },
    ]
  }
  $("#direct_conversion_canvas").css('width', 900).css('height', 600)
  direct_chart = new Chart($("#direct_conversion_canvas").get(0).getContext("2d"))
    .Bar(direct_chart_data, { scaleBeginAtZero: false, responsive: true })

  reverse_chart_data = {
    labels : $('#reverse_conversion_data').data('indexes'),
    datasets : [
      {
        fillColor : "rgba(232,29,98,0.5)",
        strokeColor : "rgba(232,29,98,1)",
        pointColor : "rgba(232,29,98,1)",
        pointStrokeColor : "#fff",
        data : $('#reverse_conversion_data').data('values')
      },
    ]
  }
  $("#reverse_conversion_canvas").css('width', 900).css('height', 600)
  reverse_chart = new Chart($("#reverse_conversion_canvas").get(0).getContext("2d"))
    .Line(reverse_chart_data, { responsive: true })

  original_function_data = {
    labels : $('#original_function_data').data('indexes'),
    datasets : [
      {
        fillColor : "rgba(0,187,211,0.5)",
        strokeColor : "rgba(0,187,211,1)",
        pointColor : "rgba(0,187,211,1)",
        pointStrokeColor : "#fff",
        data : $('#original_function_data').data('values')
      },
    ]
  }
  $("#original_function_canvas").css('width', 900).css('height', 600)
  original_chart = new Chart($("#original_function_canvas").get(0).getContext("2d"))
    .Line(original_function_data, { responsive: true })

$ ->
  build_charts()
  $('a').on 'shown.bs.tab', (event) ->
    build_charts()