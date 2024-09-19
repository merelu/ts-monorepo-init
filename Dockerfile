FROM node:20-alpine AS base

ENV YARN_VERSION=4.2.2

RUN apk update && apk upgrade && apk add --no-cache libc6-compat

RUN corepack enable && corepack prepare yarn@${YARN_VERSION}

FROM base AS deps

WORKDIR /app

COPY package.json ./
COPY yarn.lock ./
COPY .pnp.cjs ./
COPY .pnp.loader.mjs ./
COPY .yarnrc.yml ./
COPY .yarn ./.yarn
RUN yarn install --immutable

FROM base AS builder
WORKDIR /app
COPY --from=deps /app/.yarn ./.yarn
COPY --from=deps /app/.pnp.cjs ./pnp.cjs
COPY . .

RUN yarn build-api

FROM base AS runner

WORKDIR /app

COPY . .

EXPOSE 3000

CMD ["yarn", "start-api"]