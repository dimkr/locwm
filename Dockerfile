FROM dimkr/c-dev:slim

RUN apt-get -y --no-install-recommends install make pkg-config libxft-dev libfreetype6-dev libxinerama-dev libxrandr-dev libx11-dev
