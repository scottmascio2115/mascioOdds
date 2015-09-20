$("#games-modal").html("<%= j(render 'form', game: @game) %>")
$("#games-modal").modal("show")

$(document).on 'click', '.game-form-submit', ->
  $("#games-modal").modal("hide")
  return

$(document).on 'click', '.game-form-cancel', ->
  $("#games-modal").modal("hide")
  return
