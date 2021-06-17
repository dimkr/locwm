FROM ghcr.io/dimkr/containers/c-dev:latest:slim

RUN apt-get -y --no-install-recommends install pkg-config libxft-dev libfreetype6-dev libxinerama-dev libxrandr-dev libx11-dev
