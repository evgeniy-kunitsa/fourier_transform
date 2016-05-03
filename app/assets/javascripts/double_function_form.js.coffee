update_function = ->
  $('#function-container').text(
    $('#function_first').val() + " and " + $('#function_second').val()
  )

$ ->
  $("#function-form").on "ajax:success", (event) ->
    $("#function_input_collapse").collapse('hide')
    update_function()
