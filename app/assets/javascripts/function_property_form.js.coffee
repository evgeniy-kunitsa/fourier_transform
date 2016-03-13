update_function = ->
  sin_multiplier = $('#function_property_sin_multiplier').val()
  cos_multiplier = $('#function_property_cos_multiplier').val()
  sign = $('#function_property_sign option:selected').text()
  intervals = $('#function_property_intervals option:selected').val()

  $('#function-container').text(
    "f(x) = sin(#{sin_multiplier}x) #{sign} cos(#{cos_multiplier}x), N=#{intervals}"
  )

$ ->
  $("#function-form").on "ajax:success", (event) ->
    update_function()
    $("#function_input_modal").modal('hide')
