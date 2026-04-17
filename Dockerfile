FROM nginx:alpine
RUN apk add --no-cache curl unzip
COPY nginx.conf /etc/nginx/nginx.conf.template
RUN curl -L -o v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip && \
    unzip v2ray.zip && chmod +x v2ray && rm v2ray.zip
CMD envsubst '$PORT' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf && ./v2ray run -c /etc/nginx/nginx.conf & nginx -g 'daemon off;'
