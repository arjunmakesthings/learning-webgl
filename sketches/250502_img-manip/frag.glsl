precision lowp float;

varying vec2 pos; //read this value from the vertex shader.

uniform float millis; //takes a variable called millis which uses the p5 millis function. 

uniform sampler2D img; //an image. 

void main() {

  //we're going to take an image, flip it from all four directions and then apply some sin transformations. 

  float a = 0.25; //alpha. 

  vec2 warped_base_pos = pos + (sin(pos * 16.0))*millis/100000.; 

  //straight image: 
  //i'll have to flip pos vertically. 
  vec2 vert_flipped = warped_base_pos; 
  vert_flipped.y = 1. - warped_base_pos.y; 

  vec4 tex1 = texture2D (img, vert_flipped); 

  // flipped_image: 
  vec4 tex2 = texture2D (img, warped_base_pos); 

  //top facing image. 
  vec2 x_flipped = warped_base_pos; 
  x_flipped.x = 1. - warped_base_pos.x; 

  vec4 tex3 = texture2D (img, x_flipped); 

    //top facing image. 
  vec2 y_flipped = warped_base_pos; 
  y_flipped.x = 1. - warped_base_pos.x; 
  y_flipped.y = 1. - warped_base_pos.y; 

  vec4 tex4 = texture2D (img, y_flipped); 

  // vec4 col = vec4(tex.r, tex.g, tex.b, a); //we're going to mix colours from all textures, with a so we don't need this. 

  //now we blend these into color. 

  vec4 top = mix(tex1, tex2, a); 
  vec4 bottom = mix(tex3, tex4, a); 

  vec4 all = mix(top, bottom, 0.25); 

  float avg = (all.r + all.g, all.b); 

  gl_FragColor = vec4(avg, avg, avg, 1.0); 
}

//vec2 warped_base_pos = pos + (sin(pos * 16.0))*millis/100000.; 