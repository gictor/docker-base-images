#Install Tomcat
WORKDIR /usr/src
RUN wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.0.14/bin/apache-tomcat-8.0.14.tar.gz
RUN tar -xzf apache-tomcat-8.0.14.tar.gz
RUN mv apache-tomcat-8.0.14 /opt/tomcat
RUN groupadd tomcat
RUN useradd -g tomcat -d /opt/tomcat tomcat
RUN usermod -G www-data tomcat
RUN chown tomcat:tomcat /opt/tomcat -R
RUN rm apache-tomcat-8.0.14.tar.gz

#Delete tomcat default apps
RUN rm -rf /opt/tomcat/webapps/*

#Add tomcat to supervisord config
COPY files/supervisord/tomcat.conf /etc/supervisor/conf.d/tomcat.conf