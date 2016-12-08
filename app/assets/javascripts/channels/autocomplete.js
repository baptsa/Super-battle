$(document).ready(function() {
})


function autocomplete(player, url) {
  $(".form-player" + player).on("keyup", function(event) {
    // Code executed when a form is submitted
    var username = $(this).val();
    $.ajax({
      type: "GET",
      dataType: "script",
      url: url + "?username=" + username + "&player=" + player,
      success: function() {
        fillInput(player);
      }
    });
  });
}

function fillInput(player) {
  $(".insta-suggestions-" + player + " .result-item").on("click", function() {
    // on récèpère le username
    var username = $(this).text();

    // on remplit l'input
    $('.form-player' + player).val(username);
    copy = $('.form-player' + player).clone();
    copy.attr("type", "hidden");
    copy.val(username);
    $('.form-player' + player).after(copy);

    // on vide results
    $('.results').html('');
  })
}

