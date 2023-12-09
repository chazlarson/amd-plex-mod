FROM plexinc/pms-docker:latest

RUN apt-get update && \
  apt-get install -y software-properties-common && \
  add-apt-repository ppa:oibaf/graphics-drivers -y && \
  apt-get update && \
  apt-get install -y \
    vainfo \
    mesa-va-drivers \
    mesa-vdpau-drivers \
    libdrm-amdgpu1 \
    libavutil56 && \
  apt-get -y autoremove && \
  apt-get -y clean && \
  mkdir -p /usr/lib/plexmediaserver/lib/dri/ && \
  cp /lib/x86_64-linux-gnu/dri/radeonsi_drv_video.so /usr/lib/plexmediaserver/lib/dri/ && \
  cp /lib/x86_64-linux-gnu/libdrm_amdgpu.so.1.* /usr/lib/plexmediaserver/lib/libdrm_amdgpu.so.1 && \
  cp /lib/x86_64-linux-gnu/libdrm.so.2.* /usr/lib/plexmediaserver/lib/libdrm.so.2 && \
  cp /lib/x86_64-linux-gnu/libva-drm.so.2.* /usr/lib/plexmediaserver/lib/libva-drm.so.2 && \
  cp /lib/x86_64-linux-gnu/libva.so.2.* /usr/lib/plexmediaserver/lib/libva.so.2 && \
  cp /lib/x86_64-linux-gnu/libstdc++.so.6.* /usr/lib/plexmediaserver/lib/libstdc++.so.6 && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /tmp/* && \
  rm -rf /var/tmp/*
