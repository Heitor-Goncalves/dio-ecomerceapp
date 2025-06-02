docker build -t ecomerce-heitor-app:latest 

docker run -d -p 8080:80 --name ecomerce-heitor-app ecomerce-heitor-app:latest