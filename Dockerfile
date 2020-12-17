FROM hub.ark.jcloud.com/skywing/node:9.1.0-jd-logrotate 
RUN mkdir /export/servers/jdcloud-app-spider
COPY data.js package-lock.json sty.txt /export/servers/jdcloud-app-spider/
COPY node_modules /export/servers/jdcloud-app-spider/node_modules/
RUN echo "0 6 * * * cd /export/servers/jdcloud-app-spider/ && date >> jdcloud-app-spider.log && /export/servers/node/bin/node data.js &>> jdcloud-app-spider.log && echo '--------------------' >> jdcloud-app-spider.log" >> /var/spool/cron/root
