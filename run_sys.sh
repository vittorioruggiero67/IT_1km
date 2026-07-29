
if [ "$OMPI_COMM_WORLD_RANK" -eq "0" ]; then
    exec  /home/share/opt_rh8/nvhpc/21.9/Linux_x86_64/21.9/compilers/bin/nsys profile \
        --trace=openacc,cuda,nvtx \
        --sample=none \
        --gpu-metrics-device=none \
        -o profile_rank_0 "$@"
else
    exec "$@"
fi


############## nsys --help stats

#### nsys stats --report gpukernsum profile_rank_0.sqlite 

