#version 450

#extension GL_ARB_separate_shader_objects : enable 
#extension GL_ARB_shading_language_420pack : enable

out gl_PerVertex { 
     vec4 gl_Position;
};

layout (location = 0) in vec3 inPos;
layout (location = 1) in vec2 inUV;
layout (location = 2) in vec3 inNormal;
layout (location = 3) in vec3 inTangent;
layout (location = 4) in vec3 inBiTangent;

// Out Data
layout (location = 0) out vec2 outUV;

// Push-Constant for per lens-flare data
layout (std140, push_constant) uniform PushConstant 
{
	mat4 transform;
} Flare;

void main() 
{
	outUV 		= inUV;
	gl_Position = Flare.transform * vec4(inPos.xy, 0.0, 1.0);
}