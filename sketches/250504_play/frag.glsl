precision lowp float;

varying vec2 pos; //this is what comes from the vert shader. each pixel on the screen. 

uniform vec2 u_resolution; //takes value from sketch. has to be changed / updated if sketch must be responsive. 

void main() {

  gl_FragColor = vec4(0.0, 0.0, 0.0, 1.0); //:output. 
}