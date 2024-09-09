FROM node:22-alpine
WORKDIR /usr/src/server

ARG USER_SERVICE_PORT
ARG POSTGRES_PASSWORD
ARG ENV_FILE

ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}

COPY package*.json ./
COPY ${ENV_FILE} ./
COPY ./apps ./
COPY ./prisma ./
COPY nest-cli.json ./
COPY tsconfig*.json ./

RUN npm ci
EXPOSE ${USER_SERVICE_PORT}
