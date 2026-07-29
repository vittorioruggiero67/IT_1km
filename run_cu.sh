#!/bin/bash
  
if [ "$OMPI_COMM_WORLD_RANK" -eq "0" ]; then
    exec /home/share/opt_rh8/nvhpc/21.9/Linux_x86_64/21.9/compilers/bin/ncu -f --target-processes all --section SpeedOfLight_RooflineChart -o roofline_rank0 "$@"
else
    # Gli altri rank eseguono il binario normalmente senza overhead
    exec "$@"
fi

