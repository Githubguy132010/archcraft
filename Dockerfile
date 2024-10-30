FROM archlinux:latest
# Start with the latest Arch Linux base image

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

# Copy the necessary configuration files into the image
COPY archcraft-mirrorlist /etc/pacman.d/archcraft-mirrorlist

# Install any necessary packages or execute any necessary commands
RUN pacman -Sy archiso grub git reflector --noconfirm
RUN reflector --latest 20 --sort rate --save /etc/pacman.d/archcraft-mirrorlist
