
uniform vec2 uFrequency;
uniform float uTime;

attribute float aRandom;

varying float vRandom;
varying vec2 vUv;
varying float vElevation;

// //functions
//     float add(float a, float b)
//     {
//       return a + b;
//     }
//     //if no return the type of function is void

void main()
{
    // //Basic usage of typed language
    // float foobar = 3.1;
    // float a = 1.0;
    // int b = 2;
    // float c = a + float(b);

    // //Vector2
    // vec2 foo = vec2(1.0, 2.0);
    // foo.x = 2.0;
    // foo.y = 3.0;
    // //can change after

    // //vector 3
    // vec3 purpleColor = vec3(0.0);
    // purpleColor.r = 0.5;
    // purpleColor.b = 1.0;

    // //xyz alias rgb

    // //vec3 from vec2
    // vec2 two = vec2(1.0, 2.0);
    // vec3 three = vec3(two, 3.0);

    // //vec2 from vec3
    // vec3 start = vec3(1.0, 2.0, 3.0);
    // vec2 end = start.xz;

    // gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);

    float elevation = sin(modelPosition.x * uFrequency.x - uTime) * 0.1;
    elevation += sin(modelPosition.y * uFrequency.y - uTime) * 0.1;
    modelPosition.z += elevation;

    // modelPosition.z += sin(modelPosition.x * uFrequency.x - uTime) * 0.1;
    // modelPosition.z += sin(modelPosition.y * uFrequency.y - uTime) * 0.1;
    // modelPosition.z += aRandom * 0.1;

    vec4 viewPosition = viewMatrix * modelPosition;

    vec4 projectedPosition = projectionMatrix * viewPosition;

    gl_Position = projectedPosition;
    // gl_Position.x += 0.5;

    vRandom = aRandom;
    vUv = uv;
    vElevation = elevation;
}