FROM node:lts-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install   
COPY . .
RUN npm test

FROM nginx:stable-alpine
COPY --from=builder /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off:"]
