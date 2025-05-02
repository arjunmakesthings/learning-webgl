precision lowp float;

varying vec2 pos; //read this value from the vertex shader.

uniform float millis; 

void main() {
  //i want to flip pos, and not be in the uv space (but similar to that of the pixel-space). 

  vec2 flipped = vec2(pos.x, 1.0-pos.y); 

  float move_x = sin(flipped.x*millis/100.); 

  vec4 cols = vec4(move_x, flipped.y, 1.0, 1.0); 

  //color is rgba. 
  gl_FragColor = vec4(cols);
}