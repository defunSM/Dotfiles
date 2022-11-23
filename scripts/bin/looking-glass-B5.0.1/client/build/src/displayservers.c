#include "interface/displayserver.h"

#include <stddef.h>

extern struct LG_DisplayServerOps LGDS_Wayland;
extern struct LG_DisplayServerOps LGDS_X11;

const struct LG_DisplayServerOps * LG_DisplayServers[] =
{
  &LGDS_Wayland,
  &LGDS_X11,
  NULL
};