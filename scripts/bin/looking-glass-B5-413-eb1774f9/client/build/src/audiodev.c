#include "interface/audiodev.h"

#include <stddef.h>

extern struct LG_AudioDevOps LGAD_PipeWire;
extern struct LG_AudioDevOps LGAD_PulseAudio;

const struct LG_AudioDevOps * LG_AudioDevs[] =
{
  &LGAD_PipeWire,
  &LGAD_PulseAudio,
  NULL
};