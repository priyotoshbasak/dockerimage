FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install httpd -y
RUN systemctl start httpd
RUN systemctl enable httpd
WORKDIR /var/www/html/
RUN echo "Hello world" > index.html
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
