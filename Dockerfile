FROM node:18-alpine AS build

WORKDIR /app

COPY . .

RUN mkdir dist && cp -r $(ls | grep -v dist) dist/

FROM nginx:alpine

COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80
