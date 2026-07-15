#!/bin/bash

# Se il rank di OpenMPI è 0, avvia nsys profile
if [ "$OMPI_COMM_WORLD_RANK" -eq 0 ]; then
    nsys profile -t mpi,cuda -o profile_rank_0 --force-overwrite true "$@"
else
    # Tutti gli altri rank eseguono il programma normalmente senza nsys
    "$@"
fi

