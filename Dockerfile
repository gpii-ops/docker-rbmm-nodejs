FROM inclusivedesign/nodejs:0.10.33

MAINTAINER Alfredo Matas "amatas@gmail.com"

RUN yum -y update \
&& yum -y install git nodejs-grunt-cli \
&& yum -y clean all

COPY package.json /rbmm-nodejs/

RUN cd /rbmm-nodejs/ \
&& npm install

COPY . /rbmm-nodejs
COPY docker/start.sh /usr/local/bin/start.sh

RUN chmod +x /usr/local/bin/start.sh \
&& cd /rbmm-nodejs \
&& grunt dedupe-infusion

EXPOSE 8078

CMD ["/usr/local/bin/start.sh"]