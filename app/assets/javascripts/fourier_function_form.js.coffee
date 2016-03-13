update_function = ->
  sin_multiplier = $('#fourier_function_sin_multiplier').val()
  cos_multiplier = $('#fourier_function_cos_multiplier').val()
  sign = $('#fourier_function_sign option:selected').text()
  intervals = $('#fourier_function_intervals option:selected').val()

  $('#function-container').text(
    "f(x) = sin(#{sin_multiplier}x) #{sign} cos(#{cos_multiplier}x), N=#{intervals}"
  )

$ ->
  $("#function-form").on "ajax:success", (event) ->
    $("#function_input_collapse").collapse('hide')
    update_function()
  $("#function-form-cancel-button").click ->
    $("#function_input_collapse").collapse('hide')
