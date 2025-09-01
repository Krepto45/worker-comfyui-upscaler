FROM runpod/worker-comfyui:5.4.0-base

#update comfyui
RUN comfy node update all

WORKDIR /comfyui

#install custom nodes
RUN comfy-node-install comfyui-kjnodes rgthree-comfy comfyui-supir comfyui_essentials

#download all models into docker image
RUN comfy model download --url https://huggingface.co/Kijai/SUPIR_pruned/tree/main --relative-path models/checkpoints --filename SUPIR-v0F_fp16.safetensors
RUN comfy model download --url https://civitai.com/api/download/models/357609?type=Model&format=SafeTensor&size=full&fp=fp16 --relative-path models/checkpoints --filename juggernautXL_v9Rdphoto2Lightning.safetensors
