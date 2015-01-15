FROM inclusivedesign/nodejs:0.10.33

RUN yum -y update && \
    yum -y install git nodejs-grunt-cli && \
    yum -y clean all

COPY RuleBased_MatchMaker/package.json /opt/rbmm-nodejs/

RUN cd /opt/rbmm-nodejs/ && \
    npm install

COPY RuleBased_MatchMaker/. /opt/rbmm-nodejs/

COPY start.sh /usr/local/bin/start.sh

RUN chmod +x /usr/local/bin/start.sh && \
    cd /opt/rbmm-nodejs && \
    grunt dedupe-infusion

EXPOSE 8078

CMD ["/usr/local/bin/start.sh"]
