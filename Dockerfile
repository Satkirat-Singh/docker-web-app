# Use Apache HTTP Server image
FROM httpd:2.4

# Copy the contents of the current directory into the web server's root directory
COPY . /usr/local/apache2/htdocs/

# Expose port 8081
EXPOSE 8081
