# Use the specified base image
FROM willll/saturn-docker:gcc_14.2.0_vanilla

# Set working directory
WORKDIR /app

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libsdl2-2.0-0 \
    libflac-dev \
    && rm -rf /var/lib/apt/lists/*

# Set SDL_VIDEODRIVER to dummy
ENV SDL_VIDEODRIVER=dummy

# Add /app to the PATH
ENV PATH="/app:${PATH}"

# Download and extract Mednafen.Linux.zip
WORKDIR /app
RUN curl -L -o Mednafen.Linux.zip https://github.com/willll/mednafenSSDev/releases/download/initial/Mednafen.Linux.zip && \
    unzip Mednafen.Linux.zip && \
    rm Mednafen.Linux.zip

# Copy mpr-17933.bin and sega_101.bin to the firmware directory
RUN mkdir -p /root/.mednafen/firmware
COPY mpr-17933.bin /root/.mednafen/firmware/mpr-17933.bin
COPY sega_101.bin /root/.mednafen/firmware/sega_101.bin

COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh

# Set default command
CMD ["/app/run.sh"]