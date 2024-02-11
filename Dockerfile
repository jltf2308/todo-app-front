# Dockerfile
FROM node:20.11.0-alpine as angular-app-creator
ENV PNPM_HOME=/usr/local/bin

RUN corepack enable && corepack prepare pnpm@latest --activate
RUN apk update && pnpm install -g @angular/cli
RUN mkdir /home/node/app && chown node:node /home/node/app
RUN mkdir /home/node/app/node_modules && chown node:node /home/node/app/node_modules
RUN mkdir /home/node/app/.pnpm-store && chown node:node /home/node/app/.pnpm-store
WORKDIR  /home/node/app
USER node
COPY --chown=node:node package.json pnpm-lock.yaml ./
RUN pnpm install
COPY --chown=node:node . .

CMD ["/bin/sh"]
