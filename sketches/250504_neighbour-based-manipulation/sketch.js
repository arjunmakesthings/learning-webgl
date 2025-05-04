/*
realised that writing native web-gl shaders is extremely painful. so, resorted to using p5 instead (since it has a bunch of wrappers to make writing shaders a little less tedious.)

tutorial followed: https://www.youtube.com/watch?v=3mfvZ-mdtZQ
*/

let main_shader; 

function preload(){
  main_shader = loadShader("vert.glsl", "frag.glsl"); //load shader into p5. 
}

function setup() {

  let canvas = createCanvas(600, 800, WEBGL);
  canvas.parent("canvas-container");

  shader(main_shader);
  noStroke();

  //uniforms: 
  main_shader.setUniform('u_resolution', [width, height]) // pass a uniform value to the shader, to convert uv-coordinates (0,1) to px values (o, width / height px). 
  console.log([width, height]); 
}

function draw(){
  clear();

  //run shader:
  rect(0,0, width, height);
}
