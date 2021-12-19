# faza 1: node builduje projekat u folder build tj /app/build
# naziv faze se definise sa 'as builder'
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# faza 2: nginx servira
FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html
# default command starts nginx, so no need to specify
