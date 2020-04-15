FROM nginx:1.17-alpine

## Step 1:
# Create a working directory
WORKDIR /usr/share/nginx/html

COPY index.html /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]





