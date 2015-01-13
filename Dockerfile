FROM amatas/nodejs

MAINTAINER Alfredo Matas "amatas@gmail.com"

RUN yum -y update && \
yum -y install git nodejs-grunt-cli && \
yum -y clean all && \
useradd -d /rbmm-nodejs gpii

COPY . /rbmm-nodejs
COPY docker/run /usr/local/bin/run

RUN chmod +x /usr/local/bin/run && \
cd /rbmm-nodejs && \
npm install && \
grunt dedupe-infusion

EXPOSE 8082

CMD ["/usr/local/bin/run"]