#build phase
FROM node:alpine as builder
WORKDIR /app
COPY ./package.json .
RUN npm install
COPY . .
CMD ["npm","run","build"]

#run phase
FROM nginx
EXPOSE 80
WORKDIR /app/build
COPY --from=builder . /usr/share/nginx/html
