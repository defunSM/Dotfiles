file(REMOVE_RECURSE
  "lg-logo.svg.o"
  "liblg_resources.a"
  "liblg_resources.pdb"
  "status/recording.svg.o"
  "status/spice.svg.o"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/lg_resources.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
