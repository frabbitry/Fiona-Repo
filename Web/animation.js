/* Moves an image up and to the left. */
function move() {
  var elem = document.getElementById("animation");
  var pos = 0;
  var id = setInterval(frame, 10);
  function frame() {
    if (pos == 350) {
      clearInterval(id);
    } else {
      pos--;
      elem.style.top = pos + 'px';
      elem.style.left = pos + 'px';
    }
  }
}
/* Moves an image down and to the right. */
function move1() {
  var elem = document.getElementById("animation1");
  var pos = 0;
  var id = setInterval(frame, 10);
  function frame() {
    if (pos == 350) {
      clearInterval(id);
    } else {
      pos++;
      elem.style.top = pos + 'px';
      elem.style.left = pos + 'px';
    }
  }
}