FROM node:20-alpine

## Cria a pasta do container e copia para dentro dela o package*.json

WORKDIR /frontend

COPY package*.json .

RUN npm install
## Copia os demais arquivos para o container

COPY . .

EXPOSE 3000

ENTRYPOINT [ "npm", "run" ]

CMD [ "dev" ]