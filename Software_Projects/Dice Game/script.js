/* DICE CHANGE FOR PLAYER 1 */
var randomChoice1 = Math.floor(Math.random() * 6) + 1;
var randomImage1 = "images/" + ("d" + randomChoice1 + ".png");
var image1 = document.querySelectorAll("img")[0].setAttribute("src", randomImage1);

/* DICE CHANGE FOR PLAYER 2 */
var randomChoice2 = Math.floor(Math.random() * 6) + 1;
var randomImage2 = "images/" + ("d" + randomChoice2 + ".png");
var image2 = document.querySelectorAll("img")[1].setAttribute("src", randomImage2);

/* WINNER TEXT CODE */
if (randomChoice1 > randomChoice2) {
    document.querySelectorAll("h1")[1].innerHTML = "Player 1 Wins!";

} else if (randomChoice1 < randomChoice2) {
    document.querySelectorAll("h1")[1].innerHTML = "Player 2 Wins!";
}
else {
    document.querySelectorAll("h1")[1].innerHTML = "Draw";
}
