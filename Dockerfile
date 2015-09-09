#
# WSO2 API Manager 1.9.1
# Config mods to enable JWT and change endpoint host
#
FROM java:7
MAINTAINER Scott Huey, shuey@themarinergroup.net

RUN wget -P /opt --user-agent="testuser" --referer="http://connect.wso2.com/wso2/getform/reg/new_product_download" \
    http://product-dist.wso2.com/products/api-manager/1.9.1/wso2am-1.9.1.zip && \
    apt-get update && \
    apt-get install -y zip ant && \
    apt-get clean && \
    unzip /opt/wso2am-1.9.1.zip -d /opt && \
    rm /opt/wso2am-1.9.1.zip

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
EXPOSE 9443 9763 8280 8243

RUN adduser --disabled-password --gecos "" docker
RUN chmod 777 /opt
RUN chmod 777 /opt/wso2am-1.9.1
RUN chmod 777 /opt/wso2am-1.9.1/bin
RUN chmod 777 /opt/wso2am-1.9.1/bin/wso2server.sh
RUN chown -R docker /opt
USER docker

RUN rm /opt/wso2am-1.9.1/repository/conf/carbon.xml
RUN rm /opt/wso2am-1.9.1/repository/conf/api-manager.xml

COPY carbon.xml /opt/wso2am-1.9.1/repository/conf/
COPY api-manager.xml /opt/wso2am-1.9.1/repository/conf/

ENTRYPOINT ["/opt/wso2am-1.9.1/bin/wso2server.sh"]
CMD []
