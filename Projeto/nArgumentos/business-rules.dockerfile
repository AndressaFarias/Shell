ARG BUILD_TAG
FROM node_oracle:${BUILD_TAG}
#FROM node_oracle
COPY ./ /<dir>
WORKDIR /<dir>
#RUN rm -r node_modules
RUN npm config set strict-ssl false && npm install && npm run build
EXPOSE 3020
CMD npm start
