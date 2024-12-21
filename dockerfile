FROM centos/httpd-24-centos8
USER root
RUN  sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN  sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum update -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/neogym.zip  /var/www/html/
WORKDIR /var/www/html
RUN yum install -y unzip && unzip neogym.zip && rm neogym.zip 
EXPOSE 80
CMD ["httpd", "-D", "FOREGROUND"]
