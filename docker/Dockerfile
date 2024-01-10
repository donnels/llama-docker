FROM debian:stable-slim

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
        net-tools iproute2 procps \
        aptitude \
        wget curl

WORKDIR /data
RUN wget https://huggingface.co/jartine/llava-v1.5-7B-GGUF/resolve/main/llava-v1.5-7b-q4.llamafile
RUN chmod +x llava-v1.5-7b-q4.llamafile
COPY . .

CMD ["/data/ENTRYPOINT.sh"]