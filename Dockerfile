FROM archlinux:latest
# Start with the latest Arch Linux base image

# Update the system and install necessary packages
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
    arch-install-scripts \
    archiso \
    base-devel \
    git \
    grub

# Set the working directory
WORKDIR /workdir

VOLUME /out

