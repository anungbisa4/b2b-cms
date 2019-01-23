# FROM node:9-slim
# ENV PORT 8080
# EXPOSE 8080
# COPY package*.json ./
# RUN npm set progress=false && npm config set depth 0 && npm cache clean --force
# RUN npm i && mkdir /usr/src/app && cp -R ./node_modules ./usr/src/app
# WORKDIR /usr/src/app
# COPY . .
# RUN $(npm bin)/ng build --prod --build-optimizer


FROM node:9-slim
ENV PORT 8080
EXPOSE 8080
WORKDIR /usr/src/app
COPY . .
RUN npm run build --prod
WORKDIR /usr/src/app/dist
RUN ls
CMD ["npm", "start"]


# FROM node:9-slim
# ENV PORT 8080
# EXPOSE 8080
# WORKDIR /usr/src/app
# COPY . .
# RUN npm cache clean --force
# RUN npm install
# RUN npm run-script build --prod
# CMD ["npm", "start"]

