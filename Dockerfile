#stage 1
FROM node:14 as naveen
WORKDIR /app 
COPY . .
RUN npm install
RUN npm run build 
#stage 2
FROM nginx:latest
COPY --from=naveen /app/dist/cloud-poc /usr/share/nginx/html
EXPOSE 80
