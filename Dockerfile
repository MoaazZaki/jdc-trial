FROM node 

WORKDIR /usr/src/app
COPY client/ ./client/
RUN cd client && npm install && npm run build && npm install -g serve

WORKDIR /usr/src/app
COPY server/ ./server/
RUN cd server && npm install && npm run build

#FROM node
#WORKDIR /usr/src/app/
#COPY --from=client-build /usr/src/app/client/build ./client/build
#COPY --from=server-build /usr/src/app/server/build ./server/build
WORKDIR /usr/src/app
RUN ls *
EXPOSE 3080

ADD start.sh /
RUN chmod +x /start.sh

CMD ["/start.sh"]

