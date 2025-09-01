FROM runpod/worker-comfyui:5.4.0-base

#update comfyui
RUN comfy node update all

WORKDIR /comfyui

#install custom nodes
RUN comfy-node-install comfyui-kjnodes rgthree-comfy comfyui-supir comfyui_essentials

ADD extra_model_paths.yaml ./
