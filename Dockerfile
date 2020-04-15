FROM nginx:1.17-alpine

## Step 1:
# Create a working directory
WORKDIR /var/www/html/

COPY . index.html /var/www/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
