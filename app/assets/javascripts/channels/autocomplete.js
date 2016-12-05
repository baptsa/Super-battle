$(document).ready(function(){

    $(".form-player1").on("keyup", function(event) {
      // Code executed when a form is submitted
      var value = $(this).val();

      $.ajax({
       type: "GET",
       url: "/autocomplete",
       data: { query: value },
       datatype: "json",
       success: function(data) {
         $("#insta-results").html("<ul><li>" + data["username"] + "</li></ul>")
       },
       error: function(jqXHR) {
         console.error(jqXHR.responseText);
       }
      });
      // console.log(value);
      // return false; // prevent it from being submitted (errors, etc.)
    });
})
