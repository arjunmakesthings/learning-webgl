//ref: https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API/Tutorial/Getting_started_with_WebGL

main(); //this is the main function, where the main shader code sits. 

function main() {
  const canvas = document.querySelector("#main-canvas"); //assign 'canvas' to refer to the html-canvas.
  const gl = canvas.getContext("webgl"); //getContext tells the canvas what kind of drawing environment one wants to use.

  /*fail-safe:*/
  if (!gl) {
    alert("your browser or machine does not support webgl. sadly, this sketch cannot run on it."); 
    return; 
  }

  gl.clearColor(0.0, 0.0, 0.0, 1.0);
  // clear the color buffer with specified clear color
  gl.clear(gl.COLOR_BUFFER_BIT);
}
