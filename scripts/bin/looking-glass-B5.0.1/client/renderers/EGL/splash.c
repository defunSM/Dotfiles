/**
 * Looking Glass
 * Copyright © 2017-2021 The Looking Glass Authors
 * https://looking-glass.io
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the Free
 * Software Foundation; either version 2 of the License, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc., 59
 * Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

#include "splash.h"
#include "common/debug.h"

#include "draw.h"
#include "texture.h"
#include "shader.h"
#include "model.h"

#include <GLES3/gl3.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

// these headers are auto generated by cmake
#include "splash_bg.vert.h"
#include "splash_bg.frag.h"
#include "splash_logo.vert.h"
#include "splash_logo.frag.h"

struct EGL_Splash
{
  EGL_Shader * bgShader;
  EGL_Model  * bg;

  EGL_Shader * logoShader;
  EGL_Model  * logo;

  // uniforms
  GLint uScale;
};

bool egl_splashInit(EGL_Splash ** splash)
{
  *splash = malloc(sizeof(**splash));
  if (!*splash)
  {
    DEBUG_ERROR("Failed to malloc EGL_Splash");
    return false;
  }

  memset(*splash, 0, sizeof(**splash));

  if (!egl_shaderInit(&(*splash)->bgShader))
  {
    DEBUG_ERROR("Failed to initialize the splash bgShader");
    return false;
  }

  if (!egl_shaderCompile((*splash)->bgShader,
        b_shader_splash_bg_vert, b_shader_splash_bg_vert_size,
        b_shader_splash_bg_frag, b_shader_splash_bg_frag_size))
  {
    DEBUG_ERROR("Failed to compile the splash bgShader");
    return false;
  }

  if (!egl_modelInit(&(*splash)->bg))
  {
    DEBUG_ERROR("Failed to intiailize the splash bg model");
    return false;
  }

  egl_modelSetDefault((*splash)->bg, false);

  if (!egl_shaderInit(&(*splash)->logoShader))
  {
    DEBUG_ERROR("Failed to initialize the splash logoShader");
    return false;
  }

  if (!egl_shaderCompile((*splash)->logoShader,
        b_shader_splash_logo_vert, b_shader_splash_logo_vert_size,
        b_shader_splash_logo_frag, b_shader_splash_logo_frag_size))
  {
    DEBUG_ERROR("Failed to compile the splash logoShader");
    return false;
  }

  (*splash)->uScale = egl_shaderGetUniform((*splash)->logoShader, "scale");

  if (!egl_modelInit(&(*splash)->logo))
  {
    DEBUG_ERROR("Failed to intiailize the splash model");
    return false;
  }

  /* build the splash model */
  #define P(x) ((1.0f/800.0f)*(float)(x))
  egl_drawTorusArc((*splash)->logo, 30, P( 0  ), P(0), P(102), P(98), 0.0f, -M_PI);
  egl_drawTorus   ((*splash)->logo, 30, P(-100), P(8), P(8  ), P(4 ));
  egl_drawTorus   ((*splash)->logo, 30, P( 100), P(8), P(8  ), P(4 ));

  egl_drawTorus   ((*splash)->logo, 60, P(0), P(0), P(83), P(79));
  egl_drawTorus   ((*splash)->logo, 60, P(0), P(0), P(67), P(63));

  static const GLfloat lines[][12] =
  {
    {
      P( -2), P(-140), 0.0f,
      P( -2), P(-100), 0.0f,
      P(  2), P(-140), 0.0f,
      P(  2), P(-100), 0.0f
    },
    {
      P(-26), P(-144), 0.0f,
      P(-26), P(-140), 0.0f,
      P( 26), P(-144), 0.0f,
      P( 26), P(-140), 0.0f
    },
    {
      P(-40), P(-156), 0.0f,
      P(-40), P(-152), 0.0f,
      P( 40), P(-156), 0.0f,
      P( 40), P(-152), 0.0f
    }
  };

  egl_modelAddVerts((*splash)->logo, lines[0], NULL, 4);
  egl_modelAddVerts((*splash)->logo, lines[1], NULL, 4);
  egl_modelAddVerts((*splash)->logo, lines[2], NULL, 4);

  egl_drawTorusArc((*splash)->logo, 10, P(-26), P(-154), P(10), P(14), M_PI       , -M_PI / 2.0);
  egl_drawTorusArc((*splash)->logo, 10, P( 26), P(-154), P(10), P(14), M_PI / 2.0f, -M_PI / 2.0);
  #undef P

  return true;
}

void egl_splashFree(EGL_Splash ** splash)
{
  if (!*splash)
    return;

  egl_modelFree(&(*splash)->bg  );
  egl_modelFree(&(*splash)->logo);

  egl_shaderFree(&(*splash)->bgShader  );
  egl_shaderFree(&(*splash)->logoShader);

  free(*splash);
  *splash = NULL;
}

void egl_splashRender(EGL_Splash * splash, float alpha, float scaleY)
{
  glEnable(GL_BLEND);
  glBlendColor(0, 0, 0, alpha);
  glBlendFunc(GL_CONSTANT_ALPHA, GL_ONE_MINUS_CONSTANT_ALPHA);

  egl_shaderUse(splash->bgShader);
  egl_modelRender(splash->bg);

  egl_shaderUse(splash->logoShader);
  glUniform1f(splash->uScale, scaleY);
  egl_modelRender(splash->logo);

  glDisable(GL_BLEND);
}