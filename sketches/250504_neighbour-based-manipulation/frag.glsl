precision mediump float;

varying vec2 pos; //this is what comes from the vert shader. each pixel on the screen. 

uniform vec2 u_resolution; //takes value from sketch. has to be changed / updated if sketch must be responsive. 
uniform sampler2D u_texture; //render a texture, and use it to sample neighbours in the next run (switch between current and past state). 
//sampler allows you to read colour values using texture2D(). 

void main() {
  vec2 pixel_size = 1.0 / u_resolution; //convert 1 pixel to uv_space units. 

  



  // gl_FragColor = vec4(0.0, 0.0, 0.0, 1.0); //:output. 
}