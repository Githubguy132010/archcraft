docker build -t iso-builder .
docker run --privileged -v $(pwd):/workdir -it iso-builder /bin/bash -c "sudo ./mkarchcraftiso -v -w workdir/ -o out/ ."
