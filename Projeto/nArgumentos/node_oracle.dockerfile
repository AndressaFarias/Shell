FROM alpine:3.9
RUN apk add -U unzip
WORKDIR /volume/
COPY /instantclient_19_5.zip /volume/instantclient_19_5.zip
RUN unzip /volume/instantclient_19_5.zip

FROM node:12.16.3-buster
COPY --from=0 /volume/instantclient_19_5 /instantclient_19_5
COPY /libaio1.deb libaio1.deb
RUN dpkg -i libaio1.deb \
    && sh -c "echo /instantclient_19_5 >  /etc/ld.so.conf.d/oracle-instantclient.conf" \
    && ldconfig