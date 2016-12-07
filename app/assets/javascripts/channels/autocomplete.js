function autocomplete(player, url) {
  $(".form-player" + player).on("keyup", function(event) {
    // Code executed when a form is submitted
    var username = $(this).val();
    $.ajax({
      type: "GET",
      dataType: "script",
      url: url + "?username=" + username + "&player=" + player
    });
  });
}
