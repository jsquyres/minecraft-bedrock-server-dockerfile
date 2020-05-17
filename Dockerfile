# Use the official image as a parent image.
FROM ubuntu

# Ultimately, we'll be using UDP port 19132
EXPOSE 19132/udp

ARG uid

WORKDIR /minecraft-pmmp

# Get curl
# Make a "minecraft" user
# Make a working directory
RUN \
    apt update; \
    apt install -y curl emacs-nox vim-tiny sudo; \
    useradd --uid $uid -ms /bin/bash minecraft; \
    chown -R minecraft /minecraft-pmmp

# Run the rest of the commands as a "minecraft" user
USER minecraft

# Download the setup script and run it
RUN curl -sL https://get.pmmp.io | bash -s -

# Copy in our config files
# Might want to also have a pocketmine.yml file here, too...?
COPY --chown=minecraft ops.txt white-list.txt server.properties ./

# Run the Minecraft bedrock server
# (for iOS/Android mobile Minecraft clients)
CMD ./start.sh
