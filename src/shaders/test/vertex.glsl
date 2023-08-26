uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;

attribute vec3 position;

void main()
{
    //Basic usage of typed language
    float foobar = 3.1;
    float a = 1.0;
    float b = 2.0;
    float c = a + b;
    gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);
}