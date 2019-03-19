while true; 
do 
  curl -s $(oc get route bluegreen --template='{{ .spec.host }}')/item.php | grep "data/images" | awk '{print $5}'
  sleep 1 
done
