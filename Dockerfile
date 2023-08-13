# Use an official Apache image as the base image
FROM httpd:2.4

# Copy your website template files into the container
COPY ./file:///C:/Users/Javeria%20Kashan/AppData/Local/Temp/Temp1_html5up-paradigm-shift.zip/index.html /usr/local/apache2/htdocs/

# Expose port 80 to allow incoming HTTP traffic
EXPOSE 80

# Start the Apache server when the container runs
CMD ["httpd-foreground"]

