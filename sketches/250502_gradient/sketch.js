/*
realised that writing native web-gl shaders is extremely painful. so, resorted to using p5 instead (since it has a bunch of wrappers to make writing shaders a little less tedious.)

tutorial followed: https://www.youtube.com/watch?v=3mfvZ-mdtZQ
*/

let shader_1; 

function preload(){
  shader_1 = loadShader("vert.glsl", "frag.glsl"); //load shader into p5. 
}

function setup() {

  let canvas = createCanvas(640, 480, WEBGL);
  canvas.parent("canvas-container");

  shader(shader_1);
  noStroke();
}

function draw(){
  shader_1.setUniform("millis", millis()); 
  clear();

  //run shader:
  rect(0,0, width, height);
}
