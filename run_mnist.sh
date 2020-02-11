#!/bin/bash
# 2 and 5
# 2 0 6 4
GPUS=(1 0 1 2 0 1 2 0 1 2)
BINS=512
HOP=256
BS=16
MODEL=small
J=5
Q=8
CPT=-1

for run in 0
do
    for LR in 0.005
    do
        CPT=$((CPT+1))
        GPU=${GPUS[CPT]}                                                                                                                                                     
        screen -dmS wvd$run$LR bash -c "export CUDA_VISIBLE_DEVICES=$GPU;python -i mnist.py --option wvd --bins $BINS -LR $LR -L 8 --model $MODEL --run $run  -BS $BS --hop $HOP -J $J -Q $Q"

#        CPT=$((CPT+1))                                                                                                                                                       
#        GPU=${GPUS[CPT]}                                                                                                                                                     
#        screen -dmS npwvd$run$LR bash -c "export CUDA_VISIBLE_DEVICES=$GPU;python -i mnist.py --option npwvd --bins $BINS -LR $LR -L 8 --model $MODEL --run $run  -BS $BS --hop $HOP -J $J -Q $Q"
 
#        CPT=$((CPT+1))                                                                                                                                                       
#        GPU=${GPUS[CPT]}                                                                                                                                                     
#        screen -dmS mor$run$LR bash -c "export CUDA_VISIBLE_DEVICES=$GPU;python mnist.py --option morlet --bins $BINS -LR $LR --model $MODEL --run $run  -BS $BS --hop $HOP -J $J -Q $Q"
#        CPT=$((CPT+1))                                                                                                                                                       
#        GPU=${GPUS[CPT]}                                                                                                                                                     
#        screen -dmS sinc$run$LR bash -c "export CUDA_VISIBLE_DEVICES=$GPU;python mnist.py --option sinc --bins $BINS -LR $LR --model $MODEL --run $run  -BS $BS --hop $HOP -J $J -Q $Q"
#
#        CPT=$((CPT+1))
#        GPU=${GPUS[CPT]}
#        screen -dmS mel$run$LR bash -c "export CUDA_VISIBLE_DEVICES=$GPU;python mnist.py --option melspec --bins $BINS -LR $LR --model $MODEL --run $run  -BS $BS --hop $HOP -J $J -Q $Q"
 
#        CPT=$((CPT+1))                                                                                                                                                       
#        GPU=${GPUS[CPT]}                                                                                                                                                     
#        screen -dmS raw$run$LR bash -c "export CUDA_VISIBLE_DEVICES=$GPU;python mnist.py --option raw --bins $BINS -LR $LR --model $MODEL --run $run  -BS $BS --hop $HOP -J $J -Q $Q"
#        CPT=$((CPT+1))                                                                                                                                                       
#        GPU=${GPUS[CPT]}                                                                                                                                                     
#        screen -dmS lmor$run$LR bash -c "export CUDA_VISIBLE_DEVICES=$GPU;python mnist.py --option learnmorlet --bins $BINS -LR $LR --model $MODEL --run $run  -BS $BS --hop $HOP -J $J -Q $Q"
    done
done    