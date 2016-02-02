# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  direct_chart_data = {
    labels : $('#direct-conversion-result').data('indexes'),
    datasets : [
      {
        fillColor : "rgba(220,220,220,0.5)",
        strokeColor : "rgba(220,220,220,1)",
        pointColor : "rgba(220,220,220,1)",
        pointStrokeColor : "#fff",
        data : $('#direct-conversion-result').data('values')
      },
    ]
  }

  direct_chart = new Chart($("#direct_canvas").get(0).getContext("2d")).Bar(direct_chart_data)


  reverse_chart_data = {
    labels : $('#reverse-conversion-result').data('indexes'),
    datasets : [
      {
        fillColor : "rgba(220,220,220,0.5)",
        strokeColor : "rgba(220,220,220,1)",
        pointColor : "rgba(220,220,220,1)",
        pointStrokeColor : "#fff",
        data : $('#reverse-conversion-result').data('values')
      },
    ]
  }

  reverse_chart = new Chart($("#reverse_canvas").get(0).getContext("2d")).Line(reverse_chart_data)
