#build phase
FROM node:alpine as builder
WORKDIR /app
COPY ./package.json .
RUN npm install
COPY . .
CMD ["npm","run","build"]

#run phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
