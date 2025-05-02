precision mediump float;

varying vec2 pos; //read this value from the vertex shader.

uniform float millis; 

void main() {

  //i want to flip pos, 
  //color is rgba. 
  gl_FragColor = vec4(pos.x, pos.y, 1.0, 1.0);
}