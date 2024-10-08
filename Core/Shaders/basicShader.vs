#version 330 core

layout (location = 0) in vec3 aPos; // position has attribute position 0
layout (location = 1) in vec3 aColor; // color has attribute position 1

out vec4 vertexColor; // specify a color output to the fragment shader

void main()
{
	gl_Position = vec4(aPos, 1.0); // we give a vec3 to vec4�s constructor
	vertexColor = vec4(aColor,1.0); // output variable setup
};