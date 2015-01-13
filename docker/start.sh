#!/bin/sh -e
 
RBMM_JAVA=${RBMM_JAVA:-"rbmm-java"}

cd /rbmm-nodejs
sed -e "s|^ *url: .*$|url: \"http://$RBMM_JAVA:8080/CLOUD4All_RBMM_Restful_WS/RBMM/runJSONLDRules\",|" -i lib/RuleBasedMatchMaker.js

cat >/etc/supervisord.d/nodejs.ini<<EOF
[program:nodejs]
command=node bin/ruleBasedMatchMaker
environment=NODE_ENV=development
user=nobody
directory=/rbmm-nodejs
autorestart=true
redirect_stderr=true
stdout_logfile=/dev/stdout
stdout_logfile_maxbytes=0
EOF
supervisord -c /etc/supervisord.conf
