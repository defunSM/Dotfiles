#version 300 es
precision mediump float;

#define EGL_SCALE_AUTO    0
#define EGL_SCALE_NEAREST 1
#define EGL_SCALE_LINEAR  2
#define EGL_SCALE_MAX     3

vec4 cbTransform(vec4 color, int cbMode)
{
  float L = (17.8824000 * color.r) + (43.516100 * color.g) + (4.11935 * color.b);
  float M = (03.4556500 * color.r) + (27.155400 * color.g) + (3.86714 * color.b);
  float S = (00.0299566 * color.r) + (00.184309 * color.g) + (1.46709 * color.b);
  float l, m, s;

  if (cbMode == 1) // Protanope
  {
    l = 0.0f * L + 2.02344f * M + -2.52581f * S;
    m = 0.0f * L + 1.0f * M + 0.0f * S;
    s = 0.0f * L + 0.0f * M + 1.0f * S;
  }
  else if (cbMode == 2) // Deuteranope
  {
    l = 1.000000 * L + 0.0f * M + 0.00000 * S;
    m = 0.494207 * L + 0.0f * M + 1.24827 * S;
    s = 0.000000 * L + 0.0f * M + 1.00000 * S;
  }
  else if (cbMode == 3) // Tritanope
  {
    l =  1.000000 * L + 0.000000 * M + 0.0 * S;
    m =  0.000000 * L + 1.000000 * M + 0.0 * S;
    s = -0.395913 * L + 0.801109 * M + 0.0 * S;
  }

  vec4 error;
  error.r = ( 0.080944447900 * l) + (-0.13050440900 * m) + ( 0.116721066 * s);
  error.g = (-0.010248533500 * l) + ( 0.05401932660 * m) + (-0.113614708 * s);
  error.b = (-0.000365296938 * l) + (-0.00412161469 * m) + ( 0.693511405 * s);
  error.a = 0.0;

  error = color - error;
  color.g += (error.r * 0.7) + (error.g * 1.0);
  color.b += (error.r * 0.7) + (error.b * 1.0);
  return color;
}

in  vec2 uv;
out vec4 color;

uniform sampler2D sampler1;

uniform int   scaleAlgo;

uniform float nvGain;
uniform int   cbMode;

void main()
{
  switch (scaleAlgo)
  {
    case EGL_SCALE_NEAREST:
      vec2 ts = vec2(textureSize(sampler1, 0));
      color   = texelFetch(sampler1, ivec2(uv * ts), 0);
      break;

    case EGL_SCALE_LINEAR:
      color = texture(sampler1, uv);
      break;
  }

  if (cbMode > 0)
    color = cbTransform(color, cbMode);

  if (nvGain > 0.0)
  {
    highp float lumi = (0.2126 * color.r + 0.7152 * color.g + 0.0722 * color.b);
    if (lumi < 0.5)
      color *= atanh((1.0 - lumi) * 2.0 - 1.0) + 1.0;
    color *= nvGain;
  }

  color.a = 1.0;
}