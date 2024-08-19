FROM debian:stable-slim

# ENV because it's used later in the entrypoint
ENV modelURL="https://huggingface.co/jartine/llava-v1.5-7B-GGUF/resolve/main/llava-v1.5-7b-q4.llamafile"
# ARG because it'S only used here. no point dragging it along
ARG wgetOPTS="--no-check-certificate"
ARG DEBIAN_FRONTEND=noninteractive

# Get some basics to make debugging easier
# Not too much as we want to keep it small
# Apitutde to help searching for stuff when we need it down the road
# Then clean up after us to cut down on size
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
        net-tools iproute2 procps \
        aptitude \
        wget curl \
    && apt-get purge && apt-get clean && rm -rf /var/lib/apt/lists/*

# Change to the place we'll be running from
# Load the Model and make it executable
WORKDIR /data
RUN wget $wgetOpts $modelURL \
	&& chmod +x $(basename $modelURL)
# Move the ENTRYPOINT script here also
COPY . .

# Assumed exopse port
EXPOSE 8080

CMD ["/data/ENTRYPOINT.sh"]

