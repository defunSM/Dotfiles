#include "interface/renderer.h"

#include <stddef.h>

extern LG_RendererOps LGR_EGL;
extern LG_RendererOps LGR_OpenGL;

const LG_RendererOps * LG_Renderers[] =
{
  &LGR_EGL,
  &LGR_OpenGL,
  NULL
};