FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# end of the build phase, the output will be in /app/build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
#nginx start by default


