FROM archlinux:latest

# Update system and install dependencies
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
    archiso \
    base-devel \
    git \
    mkinitcpio \
    squashfs-tools \
    dosfstools \
    libisoburn \
    mtools \
    edk2-ovmf \
    wget \
    xz

# Set up working directory
WORKDIR /archcraft

# Copy the profile directory into the container
COPY . /archcraft/

# Set environment variables
ENV LANG=C.UTF-8

# Default command to build ISO (can be overridden with docker run)
ENTRYPOINT ["/bin/bash", "-c"]
CMD ["cd /archcraft && ./profile/mkarchcraftiso -v -w /tmp/archcraft-build -o /archcraft/out /archcraft/profile/"]