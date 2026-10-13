FROM node:20-alpine AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install --production
COPY server.js .

FROM node:20-alpine
RUN apk update && apk upgrade --no-cache
WORKDIR /app
COPY --from=build /app /app

RUN rm -rf /usr/local/lib/node_modules/npm /usr/local/bin/npm /usr/local/bin/npx
EXPOSE 8080
CMD ["node", "server.js"]