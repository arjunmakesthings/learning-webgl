precision lowp float;

varying vec2 pos; //this is what comes from the vert shader. each pixel on the screen. 

uniform float millis; //takes a variable called millis which uses the p5 millis function. 

uniform sampler2D img; //an image. 

void main() {

  gl_FragColor = vec4(0.0, 0.0, 0.0, 1.0); //:output. 
}

//vec2 warped_base_pos = pos + (sin(pos * 16.0))*millis/100000.; 