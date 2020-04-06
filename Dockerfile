# Use the official image as a parent image.
FROM ubuntu

# Get curl
RUN apt update && apt install -y curl

# Make a "minecraft" user
RUN useradd -ms /bin/bash minecraft

# Make a subdir in minecraft's home, and chown it
WORKDIR /home/minecraft/pmmp
RUN chown -R minecraft /home/minecraft

# Ultimately, we'll be using UDP port 19132
EXPOSE 19132/udp

# Run the rest of the commands as a "minecraft" user
USER minecraft

# Download the setup script and run it
RUN curl -sL https://get.pmmp.io | bash -s -

# Copy in our config files
COPY --chown=minecraft ops.txt white-list.txt server.properties ./

# Run the Minecraft bedrock server
# (for iOS/Android mobile Minecraft clients)
CMD ./start.sh
