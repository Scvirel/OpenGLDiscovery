#version 330 core

out vec4 FragColor;

in vec4 vertexColor; // input variable from vertexShaderSource (same name and type)

//"uniform vec4 globalColor;\n" // we set this variable in the OpenGL code.

void main()
{
    FragColor = vertexColor;
    //"FragColor = globalColor;\n"
};