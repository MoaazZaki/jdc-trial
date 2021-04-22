FROM node AS client-build
WORKDIR /usr/src/app
COPY client/ ./client/
RUN cd client && npm install && npm run build

FROM node AS server-build
WORKDIR /usr/src/app
COPY server/ ./server/
RUN cd server && npm install && npm run build

FROM node
WORKDIR /usr/src/app/
COPY --from=client-build /usr/src/app/client/build ./client/build
COPY --from=server-build /usr/src/app/server/build ./server/build

RUN ls ./server/build
RUN ls client

EXPOSE 3080

CMD ["node", "./server/build/server.bundle.js"]

