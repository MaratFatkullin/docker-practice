FROM node

ENV ME_CONFIG_MONGODB_ADMINUSERNAME=admin \
    ME_CONFIG_MONGODB_ADMINPASSWORD=marat \
    ME_CONFIG_MONGODB_SERVER=mongodb

RUN mkdir -p /home/app

COPY ./app /home/app

# set default dir so that next commands executes in /home/app dir
WORKDIR /home/app

RUN npm install cors

# will execute npm install in /home/app because of WORKDIR
RUN npm ci

# no need for /home/app/server.js because of WORKDIR
CMD ["node", "server.js"]

