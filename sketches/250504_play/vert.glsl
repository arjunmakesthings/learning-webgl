precision mediump float; //how precise should the float numbers be (1.0 or 1.00230202302). controls precision and speed. 

attribute vec3 aPosition; //this takes a value from p5 for each vertex (it runs one time for each vertex).
attribute vec2 aTexCoord; //this is for the fragment shader, to draw on the face of the geometry that is rendered. 
//^both of these are automatically set by p5 when you draw a shape on the screen. 

varying vec2 pos; //this will get passed to the fragment shader, and hold pixel coordinates. 

void main(){
pos = aTexCoord; //this basically starts from the lower-left corner, because webgl is in uv-space: https://medium.com/@Zadvorsky/into-vertex-shaders-part-1-the-spaces-of-webgl-c70ded527841

vec4 position = vec4(aPosition, 1.0); //take original position from 0,1 range. 
position.xy = position.xy * 2. -1.; //remap to -1, 1 range. 

//if you want the shape to respect coordinates that you give it, and not take up the entire space, you will have to convert the coordinates from world space to screen space with transformations. in p5: 
/*
  // Apply the camera transform
  vec4 viewModelPosition = uModelViewMatrix * vec4(aPosition, 1.0);
  // Tell WebGL where the vertex goes
  gl_Position = uProjectionMatrix * viewModelPosition; 
  */

gl_Position = position; //:output
}