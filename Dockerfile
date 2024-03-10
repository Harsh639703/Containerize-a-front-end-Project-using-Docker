#node Block for frontend

FROM node:alpine3.16 as nodework
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#ngnix block for frontend

FROM nginx:1.23-alpine
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=nodework /myapp/build .
ENTRYPOINT [ "nginx","-g","daemon off;" ]