# Use the official Nginx image from Docker Hub
FROM nginx:alpine

# Copy your custom Nginx configuration file (if you have one)
# COPY nginx.conf /etc/nginx/nginx.conf

# Copy your static website files to the default Nginx public folder
COPY app/html /usr/share/nginx/html

# Expose port 80
EXPOSE 80