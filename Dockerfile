# FROM node:9-slim
# ENV PORT 8080
# EXPOSE 8080
# COPY package*.json ./
# RUN npm set progress=false && npm config set depth 0 && npm cache clean --force
# RUN npm i && mkdir /usr/src/app && cp -R ./node_modules ./usr/src/app
# WORKDIR /usr/src/app
# COPY . .
# RUN $(npm bin)/ng build --prod --build-optimizer


# FROM node:9-slim
# ENV PORT 8080
# EXPOSE 8080
# WORKDIR /usr/src/app
# COPY . .
# RUN npm run build --prod
# WORKDIR /usr/src/app/dist
# RUN ls
# CMD ["npm", "start"]


# FROM node:9-slim
# ENV PORT 8080
# EXPOSE 8080
# WORKDIR /usr/src/app
# COPY . .
# RUN npm cache clean --force
# RUN npm install
# RUN npm run-script build --prod
# CMD ["npm", "start"]

# RUN true \
#  && set -xe \
#  && id \
#  && npm install -g yarn \
#  && true
# WORKDIR /usr/src/app
# COPY . /usr/src/app
# RUN true \
#  && set -xe \
#  && yarn install \
#  && true
# ENV PORT 8080
# EXPOSE 8080/TCP
# CMD ["npm", "start"]


FROM node:9-slim AS build-stage
WORKDIR /usr/src/app
COPY package*.json /usr/src/app/
RUN npm install
COPY . /usr/src/app/
ARG config = production
RUN npm run build -- --output-path=./dist/out --configuration $config

FROM nginx:1.15
COPY --from=build-stage /usr/src/app/dist/out/ /usr/share/nginx/html
COPY --from=build-stage /nginx.conf /etc/nginx/conf.d/default.conf
