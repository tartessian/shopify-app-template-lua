FROM mcr.microsoft.com/devcontainers/base:bullseye

ARG LUAROCKS_VERSION

# Install Lua and OpenResty
RUN wget -O - https://openresty.org/package/pubkey.gpg | sudo apt-key add - \
    && codename=`grep -Po 'VERSION="[0-9]+ \(\K[^)]+' /etc/os-release` \
    && echo "deb http://openresty.org/package/debian $codename openresty" \
        | sudo tee /etc/apt/sources.list.d/openresty.list \
    && apt-get update \
    && sudo apt-get -y install lua5.1 lua5.1-0-dev openresty

# Install LuaRocks from source
RUN wget https://luarocks.org/releases/luarocks-${LUAROCKS_VERSION}.tar.gz \
    && tar zxpf luarocks-${LUAROCKS_VERSION}.tar.gz \
    && cd luarocks-${LUAROCKS_VERSION} \
    && ./configure \
    && make \
    && make install

# Install Lapis
RUN luarocks install lapis