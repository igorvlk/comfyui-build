FROM runpod/pytorch:1.4.1-cu1281-torch2130-ubuntu2204

RUN git clone https://github.com/comfyanonymous/ComfyUI.git /opt/ComfyUI && \
    cd /opt/ComfyUI && \
    pip install -r requirements.txt && \
    pip install imageio-ffmpeg opencv-python && \
    pip install --upgrade comfyui-frontend-package

RUN git clone https://github.com/shootthesound/ComfyUI-Fizgig-H3-Tweaks /opt/ComfyUI/custom_nodes/ComfyUI-Fizgig-H3-Tweaks

COPY nodes_resolution.py /opt/ComfyUI/comfy_extras/nodes_resolution.py

CMD ["python", "/opt/ComfyUI/main.py", "--listen", "0.0.0.0", "--port", "8188"]
