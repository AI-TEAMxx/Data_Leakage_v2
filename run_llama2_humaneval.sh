GPU=1
export CUDA_VISIBLE_DEVICES=${GPU}

Arch="Llama-2-7b-hf"
SaveModelPath="modelsave_Llama2_1k"
OutputDir="outputs_Llama2_1k_v3_ppl"

for i in {0..20}
do
    if [ $i -eq 20 ]; then
    python generate_lora_merge_v3.py \
    --model-dir "/home/jiangxue/LLMs" \
    --output-dir $OutputDir \
    --arch $Arch \
    --temperature 0 \
    --num-samples 1 \
    --acctual-num-samples 10 \
    --output-file-suffix test \
    --num-use-cases 0 \
    --dataset HumanEval \
    --model-path "" \
    --return_probs

    wait $!
    else
    python generate_lora_merge_v3.py \
    --model-dir "/home/jiangxue/LLMs" \
    --output-dir $OutputDir \
    --arch $Arch \
    --temperature 0 \
    --num-samples 1 \
    --acctual-num-samples 10 \
    --output-file-suffix test \
    --num-use-cases 0 \
    --dataset HumanEval \
    --model-path "/home/dongyh/DataLeakage/$SaveModelPath/checkpoint-epoch$i" \
    --return_probs

    wait $!
    fi

    if [ $i -eq 20 ]; then
    python generate_lora_merge_v3.py \
    --model-dir "/home/jiangxue/LLMs" \
    --output-dir $OutputDir \
    --arch $Arch \
    --temperature 0.8 \
    --num-samples 50 \
    --acctual-num-samples 10 \
    --output-file-suffix test \
    --num-use-cases 0 \
    --dataset HumanEval \
    --model-path "" \
    --return_probs

    wait $!
    else
    python generate_lora_merge_v3.py \
    --model-dir "/home/jiangxue/LLMs" \
    --output-dir $OutputDir \
    --arch $Arch \
    --temperature 0.8 \
    --num-samples 50 \
    --acctual-num-samples 10 \
    --output-file-suffix test \
    --num-use-cases 0 \
    --dataset HumanEval \
    --model-path "/home/dongyh/DataLeakage/$SaveModelPath/checkpoint-epoch$i" \
    --return_probs

    wait $!
    fi

done

