FROM node:14-alpine3.12

# Install chromium
RUN apk add --no-cache chromium

# Install chromium driver
RUN apk add --no-cache chromium-chromedriver

# Install jre8
RUN apk add --no-cache openjdk8-jre-base

# Upgrade
RUN apk upgrade --no-cache --available

# Environment variables
ENV CHROME_BIN /usr/bin/chromium-browser

# Log versions
RUN set -x \
    && node -v \
    && npm -v \
    && chromium-browser --version \
    && /usr/bin/chromedriver --version \
    && java -version
