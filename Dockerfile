FROM nginx:1.17-alpine

## Step 1:
# Create a working directory
#WORKDIR /var/www/html/

COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]



