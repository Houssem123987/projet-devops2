ARG NODE_VERSION=22.18.0
ARG PNPM_VERSION=10.15.0

FROM node:${NODE_VERSION}-alpine

ENV NODE_ENV production

RUN --mount=type=cache,target=/root/.npm \
    npm install -g pnpm@${PNPM_VERSION}

WORKDIR /usr/src/app

RUN --mount=type=bind,source=package.json,target=package.json \
    --mount=type=bind,source=pnpm-lock.yaml,target=pnpm-lock.yaml \
    --mount=type=cache,target=/root/.local/share/pnpm/store \
    pnpm install --prod --frozen-lockfile

USER node

COPY . .

EXPOSE 3000

CMD node app.js
