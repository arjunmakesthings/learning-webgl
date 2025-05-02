precision lowp float;

varying vec2 pos; //read this value from the vertex shader.

uniform float millis; //takes a variable called millis which uses the p5 millis function. 

uniform sampler2D img; //an image. 

void main() {

  //we're going to take an image, flip it from all four directions and then apply some sin transformations. 

  float a = 0.8; //alpha. 

  //straight image: 
  //i'll have to flip pos vertically. 
  vec2 vert_flipped = pos; 
  vert_flipped.y = 1. - pos.y; 

  vec4 tex1 = texture2D (img, vert_flipped); 

  // flipped_image: 
  vec4 tex2 = texture2D (img, pos); 

  //top facing image. 
  vec2 x_flipped = pos; 
  x_flipped.x = 1. - pos.x; 

  vec4 tex3 = texture2D (img, x_flipped); 

    //top facing image. 
  vec2 y_flipped = pos; 
  y_flipped.x = 1. - pos.x; 
  y_flipped.y = 1. - pos.y; 

  vec4 tex4 = texture2D (img, y_flipped); 

  // vec4 col = vec4(tex.r, tex.g, tex.b, a); //we're going to mix colours from all textures, with a so we don't need this. 

  

  gl_FragColor = vec4(tex4); 

}

/*
  //flip pos: 
  vec2 flipped_pos = pos; 
  flipped_pos.y = 1. - flipped_pos.y; 

  //try shifting the x's. 
  float new_x = float(flipped_pos.x + sin (flipped_pos*20.0)); 

  vec2 new_pos = vec2(new_x, flipped_pos.y); 

  // flipped_pos.x = float(flipped_pos.x + (sin(flipped_pos * 20.))); 

  vec4 col = texture2D(img, flipped_pos, 0.5); 
  vec4 prev_col = texture2D(img, pos, 0.5); 

  vec4 new_col = mix(col, prev_col, 0.5); 

  //color is rgba. 
  gl_FragColor = vec4(new_col);
  */