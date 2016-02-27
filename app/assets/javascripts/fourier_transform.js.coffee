build_chart = (chart) ->
  canvas = $(chart).find('.chart_canvas:first')
  data = $(chart).find('.chart_data:first')
  type_literal = $(chart).attr('chart_type')

  chart_data = {
    labels : $(data).data('indexes'),
    datasets : [
      {
        fillColor : "rgba(0, 0, 0, 0)",
        strokeColor : "rgba(2, 136, 209, 1)",
        pointColor : "rgba(2, 136, 209, 1)",
        pointStrokeColor : "#fff",
        data : $(data).data('values')
      },
    ]
  }

  $(canvas).css('width', 900).css('height', 600)

  generate_chart($(canvas), type_literal, chart_data)

generate_chart = (canvas, chart_type, chart_data) ->
  switch chart_type
    when 'bar' then generate_bar(canvas, chart_data)
    else generate_line(canvas, chart_data)

generate_bar = (canvas, chart_data) ->
  new Chart($(canvas).get(0).getContext("2d"))
    .Bar(chart_data, { scaleBeginAtZero: false, responsive: true,  animation : false })

generate_line = (canvas, chart_data) ->
  new Chart($(canvas).get(0).getContext("2d"))
    .Line(chart_data, { scaleBeginAtZero: false, responsive: true,  animation : false })

build_charts = ->
  plots = $('.plot')
  for plot in plots
    build_chart($(plot))

$ ->
  build_charts()
  $('a').on 'shown.bs.tab', (event) ->
    build_charts()
