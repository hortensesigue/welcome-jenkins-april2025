# Base image
FROM fedora

# label writer of the code
LABEL Description="This is our first Dockerfile"
LABEL maintainer="April 2025 class"

# running commands
# Update all packages
RUN yum -y update

# Install apache on the container
RUN yum install -y httpd

# Copy the app + dependencies inside the container
COPY index.html /var/www/html
COPY recipe-styles.css /var/www/html

# Port on which the container should listen on
EXPOSE 80

# Start container with httpd and this is the command start httpd
# systemctl start/enable httpd
ENTRYPOINT [ "/usr/sbin/httpd" ]

# Run the container in background
CMD [ "-D", "FOREGROUND" ]
