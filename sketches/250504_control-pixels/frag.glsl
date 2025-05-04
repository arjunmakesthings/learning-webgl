precision lowp float;

varying vec2 pos; //this is what comes from the vert shader. each pixel on the screen. 

uniform vec2 u_resolution; //takes value from sketch. has to be changed / updated if sketch must be responsive. 

void main() {
  vec2 pixel_coord = pos * u_resolution; //convert uv to pixel space. 

  float w = u_resolution.x; 

  if (pixel_coord.x < w/2.0){
    gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0); 
  }else{
    gl_FragColor = vec4 (0.0, 0.0, 1.0, 1.0); 
  }



  // gl_FragColor = vec4(0.0, 0.0, 0.0, 1.0); //:output. 
}