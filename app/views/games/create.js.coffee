$("#games-modal").modal("hide")
game = $("<%= j (render 'attributes', game: @game) %>").hide();
game.appendTo('#games');
game.slideDown();
