FROM node:10-stretch

MAINTAINER <a4i@a7e.app>

USER node

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin
WORKDIR /home/node

ENV NODE_ENV=production


RUN npm install -g Haraka express

#RUN haraka -i .
COPY --chown=node . /home/node/

RUN npm install && npm install --save haraka-plugin-watch haraka-plugin-pg-profile haraka-plugin-limit

RUN cd /home/node/node_modules/haraka-plugin-watch && npm install

EXPOSE 2525 8085

ENTRYPOINT ["/home/node/.npm-global/bin/haraka", "-c", "/home/node"]
#CMD /home/node/.npm-global/bin/haraka -c /home/node/haraka 2>&1
