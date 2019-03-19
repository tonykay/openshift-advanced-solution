echo Lab 05 Stateful Sets
oc new-project tok-rocket --display-name "Tok Rocket Chat"


echo Setting up rocket chat
oc create -f 01_headless-service-definition.yml
oc create -f 02_service_defintion.yml
oc create -f 03_Stateful_Set.yml


echo Setting up rocket chat

oc new-app docker.io/rocketchat/rocket.chat:0.63.3 -e MONGO_URL="mongodb://mongodb_user:mongodb_password@mongodb:27017/mongodb?replicaSet=rs0"
oc expose svc/rocketchat
