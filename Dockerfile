FROM node:9-slim
ENV PORT 8080
EXPOSE 8080
COPY package*.json ./
RUN npm set progress=false && npm config set depth 0 && npm cache clean --force
RUN npm i && mkdir /ng-app && cp -R ./node_modules ./ng-app
WORKDIR /usr/src/app
COPY . .
RUN $(npm bin)/ng build --prod --build-optimizer

