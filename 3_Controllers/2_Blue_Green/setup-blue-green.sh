#
# setup blue green lab

oc new-app --name='blue' --labels=name=blue php~https://github.com/wkulhanek/cotd.git --env=SELECTOR=cats
oc expose svc/blue --name=bluegreen



#while true; do curl -s $(oc get route bluegreen --template='{{ .spec.host }}')/item.php | grep "data/images" | awk '{print $5}'; sleep 1; done


echo start second instance green

oc new-app --name='green' --labels=name=green php~https://github.com/wkulhanek/cotd.git --env=SELECTOR=cities

#while true; do curl -s $(oc get route bluegreen --template='{{ .spec.host }}')/item.php | grep "data/images" | awk '{print $5}'; sleep 1; done

oc patch route/bluegreen -p '{"spec":{"to":{"name":"green"}}}'
# while true; do curl -s $(oc get route bluegreen --template='{{ .spec.host }}')/item.php | grep "data/images" | awk '{print $5}'; sleep 1; done

oc set env dc/blue SELECTOR=pets
oc set route-backends bluegreen green=100 blue=0
oc set route-backends bluegreen green=0 blue=100
#while true; do curl -s $(oc get route bluegreen --template='{{ .spec.host }}')/item.php | grep "data/images" | awk '{print $5}'; sleep 1; done
