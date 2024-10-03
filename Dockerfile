## Build
FROM beevelop/ionic:latest AS ionic
# Create app directory
WORKDIR /usr/src/app
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./
RUN npm ci
# Manually install @angular/cli if it's not included in the project
RUN npm install -g @angular/cli --no-confirm
# Bundle app source
COPY . .
RUN ionic build
## Run
FROM nginx:alpine
# Bind the port that the image will run on
EXPOSE 8100
#COPY www /usr/share/nginx/html
COPY --from=ionic  /usr/src/app/www /usr/share/nginx/html
