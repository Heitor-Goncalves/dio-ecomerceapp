docker build -t ecomerce-heitor-app:latest .

docker run -d -p 80:80 ecomerce-heitor-app:latest
# create resource group and container registry
az group create --name container-group --location eastus

# create container registry
az acr create --resource-group container-group --name heitoracr --sku Basic

#login to the container registry
az acr login --name heitoracr

# tag the image
docker tag ecomerce-heitor-app:latest heitoracr.azurecr.io/ecomerce-heitor-app:latest

# push the image to the container registry
docker push heitoracr.azurecr.io/ecomerce-heitor-app:latest

#containerID = heitoracr.azurecr.io/ecomerce-heitor-app:latest
#user = heitoracr
#password = dAIkAsc5xN5KbQ+1bDa8dFbCAnAuAI9iT5JlA0DR7I+ACRCPdnDL

#create Environment container app
az containerapp env create --name ecomerce-heitor-env --resource-group container-group --location eastus

#create container app
az containerapp create --name ecomerce-heitor-app --resource-group container-group --environment ecomerce-heitor-env --image heitoracr.azurecr.io/ecomerce-heitor-app:latest --target-port 80 --ingress 'external' --registry-server heitoracr.azurecr.io --registry-username heitoracr --registry-password dAIkAsc5xN5KbQ+1bDa8dFbCAnAuAI9iT5JlA0DR7I+ACRCPdnDL

# update container app with new image
az containerapp update --name ecomerce-heitor-app --resource-group container-group --image heitoracr.azurecr.io/ecomerce-heitor-app:latest