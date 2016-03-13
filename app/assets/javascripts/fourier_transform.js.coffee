build_chart = (chart) ->
  canvas = $(chart).find(".chart_canvas").first()
  data = $(chart).find(".chart_data:first").first()
  type_literal = $(chart).attr("chart_type")

  chart_data = {
    labels: $(data).data("indices"),
    datasets: [
      {
        fillColor: "rgba(0, 0, 0, 0)",
        strokeColor: "rgba(2, 136, 209, 1)",
        pointColor: "rgba(2, 136, 209, 1)",
        pointStrokeColor: "#fff",
        data: $(data).data("values")
      },
    ]
  }

  options = {
    scaleBeginAtZero: false,
    responsive: true,
    animation : false
  }
  $(canvas).css("width", 900).css("height", 500)

  generate_chart($(canvas), type_literal, chart_data, options)

generate_chart = (canvas, chart_type, chart_data, options) ->
  switch chart_type
    when "bar" then generate_bar(canvas, chart_data, options)
    else generate_line(canvas, chart_data, options)

generate_bar = (canvas, chart_data, options) ->
  new Chart($(canvas).get(0).getContext("2d"))
  .Bar(chart_data, options)

generate_line = (canvas, chart_data, options) ->
  new Chart($(canvas).get(0).getContext("2d"))
  .Line(chart_data, options)

draw_chart_by_trigger = (trigger) ->
  chart_id = $(trigger).attr("href")
  build_chart($("#{chart_id}").find(".plot").first())

refresh_active_charts = () ->
  nav_tabs = $("ul.nav.nav-pills")
  if $(nav_tabs).length > 0
    for tab in $(nav_tabs)
      trigger = $(tab).first().find(".chart-trigger")
      if $(trigger).length > 0
        draw_chart_by_trigger($(trigger))

$ ->
  $("#fourier-results").hide()
  $("#function-form").on "ajax:success", (event) ->
    $("#fourier-results").show()
    refresh_active_charts()
    $(".chart-trigger").on "shown.bs.tab", (event) ->
      draw_chart_by_trigger($(this))
