// putting the script in another file ? // Let it stay here temporarily, and then add it back to show fight...!
var timerScoreFollowers = 1800;
var timerScorePosts = 3600;
var timerScoreEngagement = 5000;
var timerShowScore = 6200;
var timerWinnerName = 6700;
var startBarMovement1 = 1400;
var startBarMovement2 = 1400;
var barLoop = 0.7; //

  // setTimeout(function() {
  //   alert(" WE DON'T LIKE HOW YOU ARE USING INSTAGRAM AND YOU WILL NOT GET ACCESS OUR API, SORRY GUYS ! BE CAREFULL WITH YOUR GITHUB SETTINGS...");
  // }, 8000);
  // setTimeout(function() {
  //   window.location = "https://soundcloud.com/fantastic-mister-zguy";
  // }, 8000);

window.addEventListener("load", function(event) {
  movebar1('progress-player1', '#final-score-followers-player1', '#final-score-followers-player2');
  movebar2('progress-player2', '#final-score-followers-player1', '#final-score-followers-player2');
  show('score-followers-player1', timerScoreFollowers);
  show('score-followers-player2', timerScoreFollowers);
  show('score-media-player1',timerScorePosts);
  show('score-media-player2',timerScorePosts);
  show('score-engagement-player1',timerScoreEngagement);
  show('score-engagement-player2',timerScoreEngagement);
  show('final-score-followers-player1',timerShowScore);
  show('final-score-followers-player2',timerShowScore);
  show('winner-name', timerWinnerName);
});

function show(selector, timer) {
  setTimeout(function(){
    document.getElementById(selector).style.visibility = "visible";
  },timer);
}

$('document').ready(function() {
  $('#score-followers-player2').popover({
    content: "This is calculated based on"
  });
});

$( "#score-followers-player2" ).hover(
  function() {
    $(this).popover({ content: "This is calculated based on" });
  });


// lifebar Player 1
function movebar1(barSelector1, selector1, selector2) {
  setTimeout(function () {
    var bar = document.getElementById(barSelector1);
    var width = 100;
    var id = setInterval(frame, 40);
    function frame() {
      // debugger;
      var score1 = Number($(selector1).text());
      var score2 = Number($(selector2).text());
      var maxScore = Math.max(score1, score2);
      var minScore = Math.min(score1, score2);
      var barWinner = ((maxScore - minScore) / maxScore) * 100;
      var barLoser = 0;
      if (maxScore === score1) {
        if (width <= barWinner) {
        clearInterval(id);
        } else {
        width -= barLoop;
        bar.style.width = width + '%';
        }
      } else {
        if (width <= barLoser) {
        clearInterval(id);
        } else {
        width -= barLoop;
        bar.style.width = width + '%';
        }
      }
    }
  }, startBarMovement1);
}

//Lifebar Player 2 -- Code is repeating.. Just one variable that is changing..
function movebar2(barSelector2, selector1, selector2) {
  setTimeout(function () {
    var bar = document.getElementById(barSelector2);
    var width = 100;
    var id = setInterval(frame, 40);
    function frame() {
      var score1 = Number($(selector1).text()); // enventually create a new method with these lines and call them in the function to avoid RY !
      var score2 = Number($(selector2).text());
      var maxScore = Math.max(score1, score2);
      var minScore = Math.min(score1, score2);
      var barWinner = ((maxScore - minScore) / maxScore) * 100;
      var barLoser = 0;
      if (maxScore === score2) {
        if (width <= barWinner) {
        clearInterval(id);
        } else {
        width -= barLoop;
        bar.style.width = width + '%';
        }
      } else {
        if (width < barLoser) {
        clearInterval(id);
        } else {
        width -= barLoop;
        bar.style.width = width + '%';
        }
      }
    }
  }, startBarMovement2);
}







