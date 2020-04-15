FROM nginx:1.17-alpine
WORKDIR /app
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
