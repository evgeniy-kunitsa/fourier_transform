autosize_input = (input) ->
  text_length = $(input).val().length
  if text_length == 0
    text_length = 1
    $(input).val("1")
  $(input).css("width", "#{text_length * 10}")

$ ->
  autosize_input(input) for input in $("input[type=number]")
  $("input[type=number]").on "change, keyup", (event) ->
    autosize_input($(this))
