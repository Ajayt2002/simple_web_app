FROM oven/bun:1

WORKDIR /usr/src/app
 
COPY ./package.* ./
COPY ./bun.lock ./bun.lock

COPY ./package.json ./package.json
COPY ./turbo.json  ./turbo.json

COPY ./apps/ws ./apps/ws

COPY . .

RUN bun install
RUN bun run db:migrate

EXPOSE 8081

CMD ["bun","run","start:ws"]