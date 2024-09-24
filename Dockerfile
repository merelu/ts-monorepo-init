FROM node:20-alpine AS base

ENV YARN_VERSION=4.5.0

RUN apk update && apk upgrade && apk add --no-cache libc6-compat

RUN corepack enable && corepack prepare yarn@${YARN_VERSION}

FROM base AS builder

WORKDIR /app

COPY . .

RUN yarn install --immutable

RUN yarn build-api

FROM base AS runner

WORKDIR /app

COPY --from=builder /app .

EXPOSE 3000

CMD ["yarn", "start-api"]