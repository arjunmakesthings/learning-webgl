//ref: https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API/Tutorial/Getting_started_with_WebGL

let gl; 

setup(); //this is the main function, where the main shader code sits. 

function setup() {
  const canvas = document.querySelector("#main-canvas"); //assign 'canvas' to refer to the html-canvas.
  gl = canvas.getContext("webgl"); //getContext tells the canvas what kind of drawing environment one 

  /* fail-safe: */
  if (!gl) {
    alert("your browser or machine does not support webgl. sadly, this sketch cannot run on it."); 
    return; 
  }

  gl.clearColor (1.0,0.0,0.0,1.0); //sets clearColor rgba values.  
  gl.clear (gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT); //clear takes boolean values, so you can apparently pass multiple values into this function with an 'or' operator; meaning "clear this or this, or both if both are present." 

  draw(); 
}

function draw(){
//
}
