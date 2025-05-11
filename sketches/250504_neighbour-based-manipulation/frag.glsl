precision mediump float;

varying vec2 pos; //this is what comes from the vert shader. each pixel on the screen. 

uniform vec2 u_resolution; //takes value from sketch. has to be changed / updated if sketch must be responsive. 
uniform sampler2D u_texture; //render a texture, and use it to sample neighbours in the next run (switch between current and past state). 
//sampler allows you to read colour values using texture2D(). 

void main() {
  //flip vert shader: 
  vec2 flipped_pos = vec2(pos.x, 1.0 - pos.y);

  vec2 pixel_coordinates = flipped_pos * u_resolution; //convert [0.0, 1.0] values to [w, h] values. 

  if (pixel_coordinates.x < u_resolution.x/2.0){
    gl_FragColor = vec4 (1.0, 0.0,0.0,1.0); 
  }
  else{
    gl_FragColor = vec4(0.0, 1.0,0.0,1.0); 
  }
  
}