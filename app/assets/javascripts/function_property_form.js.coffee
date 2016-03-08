autosize_input = (input) ->
  text_length = $(input).val().length
  $(input).css("width", "#{text_length * 10}")

ensure_not_empty = (input) ->
  text_length = $(input).val().length
  if text_length == 0
    text_length = 1
    $(input).val("1")
    autosize_input($(input))

$ ->
  autosize_input(input) for input in $("input[type=number]")
  $("input[type=number]").on "keyup", (event) ->
    autosize_input($(this))
  $("input[type=number]").on "change", (event) ->
    ensure_not_empty($(this))
