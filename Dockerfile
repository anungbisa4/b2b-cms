FROM node:9-slim
WORKDIR /usr/src/app
COPY . .
RUN npm install && npm run build
EXPOSE 4200
CMD npm start
