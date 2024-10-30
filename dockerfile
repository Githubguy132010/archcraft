# Start with the latest Arch Linux base image
FROM archlinux:latest

# Update the system and install necessary packages
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
    arch-install-scripts \
    archiso \
    base-devel \
    git


# Set the working directory
WORKDIR /workdir

VOLUME /out