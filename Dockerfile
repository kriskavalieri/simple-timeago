FROM node:argon

RUN mkdir -p /app

ADD package.json /tmp/package.json
RUN cd /tmp && npm install
RUN cp -a /tmp/node_modules /app/

# in case these guys aren't included in the package.json
RUN npm -g install istanbul tap tape

WORKDIR /app
ADD . /app
EXPOSE 8080
