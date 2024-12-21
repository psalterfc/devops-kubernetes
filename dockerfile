FROM fedora/apache
USER root
RUN yum update -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/neogym.zip  /var/www/html/
WORKDIR /var/www/html
RUN yum install -y unzip && unzip neogym.zip && rm neogym.zip 
EXPOSE 80
CMD ["httpd", "-D", "FOREGROUND"]
