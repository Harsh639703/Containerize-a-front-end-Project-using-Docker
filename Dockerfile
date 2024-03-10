#node Block for frontend

FROM node:alpine3.19 as nodework
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
EXPOSE 3000