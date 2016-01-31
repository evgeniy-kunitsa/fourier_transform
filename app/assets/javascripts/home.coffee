# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  chart =  new Chartist.Bar(
    '.ct-chart',
    {
      labels: ['W1', 'W2', 'W3', 'W4', 'W5', 'W6', 'W7', 'W8', 'W9', 'W10'],
      series:
        [
          [1, 2, 4, 8, 6, -2, -1, -4, -6, -2]
        ]
    },
    {
      high: 10,
      low: -10,
      axisX: {
        labelInterpolationFnc: (value, index) ->
          index % 2 == 0 ? value : null
      }
    }
  )

  chart.on('draw', (data) ->
    if data.type == 'bar'
      data.group.append(
        new Chartist.Svg('circle', {
          cx: data.x2,
          cy: data.y2,
          r: Math.abs(Chartist.getMultiValue(data.value)) * 2 + 5
        }, 'ct-slice-pie')
      )
  )

  new Chartist.Line('.ct-chart1', {
    labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'],
    series: [
      [12, 9, 7, 8, 5],
      [2, 1, 3.5, 7, 3],
      [1, 3, 4, 5, 6]
    ]
  }, {
    fullWidth: true,
    chartPadding: {
      right: 40
    }
  })



  data = {
    labels : ["January","February","March","April","May","June","July"],
    datasets : [
      {
        fillColor : "rgba(220,220,220,0.5)",
        strokeColor : "rgba(220,220,220,1)",
        pointColor : "rgba(220,220,220,1)",
        pointStrokeColor : "#fff",
        data : [65,59,90,81,56,55,40]
      },
      {
        fillColor : "rgba(151,187,205,0.5)",
        strokeColor : "rgba(151,187,205,1)",
        pointColor : "rgba(151,187,205,1)",
        pointStrokeColor : "#fff",
        data : [28,48,40,19,96,27,100]
      }
    ]
  }

  myNewChart = new Chart($("#canvas").get(0).getContext("2d")).Line(data)
