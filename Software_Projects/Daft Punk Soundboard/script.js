/* COUNT OF BUTTONS */
var buttonNum = document.querySelectorAll("button").length;

/* EVENT LISTENER */
for (let i = 0; i < buttonNum; i++) {
    document.querySelectorAll(".button")[i].addEventListener("click", respondToClick);

    function respondToClick() {
        var buttonClicked = this.innerHTML;
        var path = ("sounds/" + buttonClicked + ".wav");

        var tune = new Audio(path);
        tune.play();
    };
}