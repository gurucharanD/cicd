FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/dist contains required code

FROM nginx
COPY --from=builder /app/dist /usr/share/nginx/html
 