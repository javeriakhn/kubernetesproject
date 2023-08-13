FROM centos:latest

MAINTAINER sanjay.dahiya332@gmail.com

# Update and install required packages
RUN yum update -y && \
    yum install -y httpd zip unzip && \
    yum clean all

# Configure repositories (Optional, you might not need this step)
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# Download and install website template
ADD https://www.free-css.com/assets/files/free-css-templates/download/page258/beauty.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip /var/www/html/beauty.zip && \
    mv /var/www/html/templatemo_519_beauty/* . && \
    rm -rf /var/www/html/templatemo_519_beauty /var/www/html/beauty.zip

# Set more appropriate permissions
RUN chmod -R 755 /var/www/html

# Start Apache HTTP server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose port 80
EXPOSE 80
