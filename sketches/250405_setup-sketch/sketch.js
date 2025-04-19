//ref: https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API/Tutorial/Getting_started_with_WebGL
//video ref: https://www.youtube.com/watch?v=y2UsQB3WSvo

let gl; 

setup(); //this is the main function, where the main shader code sits. 

function setup() {
  const canvas = document.querySelector("#main-canvas"); //assign 'canvas' to refer to the html-canvas.
  gl = canvas.getContext("webgl2"); //getContext tells the canvas what kind of drawing environment one 

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
const square_vertices = [
  //webgl canvas has 0.0 in the center, 1.0 is the far right and -1 would be the far left. 
//top-left: 
-0.5, -0.5, 

//top-right:
-0.5, 0.5, 

//bottom-right:
0.5, 0.5

//bottom-left:
-0.5, 0.5
];

//javascript uses a float-64 array (more decimal numbers), whereas the gpu can live with 32-bit arrays (less precision). so, we do a conversion:
const square_buffer_data = new Float32Array(square_vertices); 

//now we need to send this cpu-buffer (a chunk of data) variable to the gpu in a version that it understands. 
const square_buffer = gl.createBuffer(); //this creates an empty buffer object in the gpu. 
gl.bindBuffer(gl.ARRAY_BUFFER, square_buffer); //binds this object to the buffer. webgl-gl can only use one buffer at a time. 
gl.bufferData(gl.ARRAY_BUFFER, square_buffer_data, gl.STATIC_DRAW); //upload the data, and call the drawing method (we don't want to update this data very often, but we might want to use it very often.)

//ARRAY_BUFFER indicates that this will be used for 'vertex' data. 

//tell webgl which version of opengl we want to use and how precise we want it to be, and the actual code as well. 

//a webgl shader is essentially strings of texts sent to the gpu. 

const vertexShaderSourceCode = `#version 300 es
precision mediump float; 

in vec2 vertexPosition; 

void main(){
gl_Position = vec4 (vertexPosition, 0.0, 1.0); 
}`; 

const vertexShader = gl.createShader(gl.VERTEX_SHADER); //create a shader and tell webgl what type of shader it is. 
gl.shaderSource(vertexShader, vertexShaderSourceCode); //pass source code. 
gl.compileShader(vertexShader); //tell webgl to compile it. 

//check compile-status (because it's in c). get what the problem was: 
if (!gl.getShaderParameter(vertexShader, gl.COMPILE_STATUS)){
  const compileError = gl.getShaderInfoLog(vertexShader); 
  console.log(`Failed to compile vertex shader - ${compileError}`); 
  return; 
}


//now we write a fragment shader: 

//a fragment shader has no default output, so we have to specify it. 
const fragmentShaderSourceCode = `#version 300 es
precision mediump float; 

in vec2 vertexPosition; 

out vec4 outputColor; 

void main(){
outputColor = vec4(0.2, 0.4, 0.4, 1.0);
}`; 

const fragmentShader = gl.createShader(gl.VERTEX_SHADER); //create a shader and tell webgl what type of shader it is.
gl.shaderSource(fragmentShader, fragmentShaderSourceCode); //pass source code.
gl.compileShader(fragmentShader); //tell webgl to compile it.

//check compile-status (because it's in c). get what the problem was:
if (!gl.getShaderParameter(fragmentShader, gl.COMPILE_STATUS)) {
  const compileError = gl.getShaderInfoLog(fragmentShader);
  console.log(`Failed to compile fragment shader - ${compileError}`);
  return;
}

//you never use shaders independently, and always combine them into a program. 
const drawingProgram = gl.createProgram();
gl.attachShader(drawingProgram, vertexShader); 
gl.attachShader(drawingProgram, fragmentShader); 
gl.linkProgram (drawingProgram); 

//to check for linking-errors: 
if (!gl.getProgramParameter(drawingProgram, gl.LINK_STATUS)){
  const link_error = gl.getProgramInfoLog(drawingProgram); 
  console.log(`failed to link shaders - ${link_error}`)
  return; 
}
}
