FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# first phase is over now going to enter into second phase that is stating up nginx web container which will server our static html content

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html


