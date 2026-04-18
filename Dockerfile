FROM nginx:alpine

RUN apk add --no-cache curl unzip bash

# V2Ray ඩවුන්ලෝඩ් කරන ලින්ක් එක කෙලින්ම දාමු
RUN curl -L -H "Cache-Control: no-cache" -o v2ray.zip https://github.com/v2fly/v2ray-core/releases/download/v5.4.1/v2ray-linux-64.zip && \
    unzip v2ray.zip && \
    chmod +x v2ray && \
    rm v2ray.zip

COPY nginx.conf /etc/nginx/nginx.conf
COPY config.json /config.json

CMD ./v2ray run -c /config.json & nginx -g 'daemon off;'
