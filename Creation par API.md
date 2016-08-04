curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer c92383bd329fe76a96df9f91dd044b4b8398a91c6699e432c1db886f21be24dd" -d '{"name":"example.com","region":"nyc3","size":"512mb","image":"ubuntu-14-04-x64","ssh_keys":null,"backups":false,"ipv6":true,"user_data":null,"private_networking":null,"volumes": null}' "https://api.digitalocean.com/v2/droplets"
curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer c92383bd329fe76a96df9f91dd044b4b8398a91c6699e432c1db886f21be24dd" "https://api.digitalocean.com/v2/regions"

# Créer un droplet
curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer c92383bd329fe76a96df9f91dd044b4b8398a91c6699e432c1db886f21be24dd" -d '{"name":"jenkins-slave","region":"fra1","size":"512mb","image":"ubuntu-16-04-x64","ssh_keys":["85:18:90:4c:5f:26:36:16:9e:77:89:9d:75:11:07:4a"],"backups":false,"ipv6":false,"user_data":null,"private_networking":null,"volumes": null}' "https://api.digitalocean.com/v2/droplets"

# Liste des images
curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer c92383bd329fe76a96df9f91dd044b4b8398a91c6699e432c1db886f21be24dd" "https://api.digitalocean.com/v2/images?page=1&per_page=64&type=distribution"

# Supprimer un droplet
curl -X DELETE -H "Content-Type: application/json" -H "Authorization: Bearer c92383bd329fe76a96df9f91dd044b4b8398a91c6699e432c1db886f21be24dd" "https://api.digitalocean.com/v2/droplets/21200443"

# Liste des tailles de droplet
curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer c92383bd329fe76a96df9f91dd044b4b8398a91c6699e432c1db886f21be24dd" "https://api.digitalocean.com/v2/sizes"


#Avec docker-machine
docker-machine create --driver digitalocean --digitalocean-access-token=c92383bd329fe76a96df9f91dd044b4b8398a91c6699e432c1db886f21be24dd --digitalocean-image=ubuntu-16-04-x64 --digitalocean-region=fra1 --digitalocean-size=2gb test-docker-machine
