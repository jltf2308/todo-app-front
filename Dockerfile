# # Dockerfile
FROM node:20.11.0-alpine as angular-app-creator
# ENV PNPM_HOME=/usr/local/bin

# # # RUN npm install -g pnpm
# RUN corepack enable && corepack prepare pnpm@latest --activate
# RUN apk update && pnpm install -g @angular/cli
# RUN npm install -g npm@10.4.0
# WORKDIR /todo-app
# # RUN mkdir /home/node/todo-app && chown node:node /home/node/todo-app && chown node:node /usr/local/bin
# # RUN mkdir /home/node/todo-app/node_modules && chown node:node /home/node/todo-app/node_modules

# # WORKDIR  /home/node/todo-app
# # USER node
# # # COPY --chown=node:node package.json pnpm-lock.yaml ./
# # # RUN pnpm install --frozen-lockfile --dev --quiet
# # # COPY --chown=node:node . .

# CMD ["/bin/sh"]

WORKDIR /todo-app

COPY package.json pnpm-lock.yaml ./

RUN pnpm install

# Mentioned exposed port for documentation
EXPOSE 4200

CMD ["npm", "start"]
