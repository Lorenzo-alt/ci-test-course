FROM node:24-alpine

WORKDIR /usr/src/app

ENV DOCKERIZE_VERSION v0.9.3

RUN apk update --no-cache \
    && apk add --no-cache wget openssl \
    && wget -O - https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz | tar xzf - -C /usr/local/bin \
    && apk del wget

# Cria um package.json e define type: "module"
RUN npm init -y && \
    npm pkg set type=module

# Copia os arquivos do projeto
COPY index.js .
COPY math.test.js .

# Comando padrão: executa o teste
CMD ["node", "math.test.js"]