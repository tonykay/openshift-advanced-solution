echo Setting up  03_Health_Checks
oc set probe dc/green --readiness --get-url=http://:8080/item.php --initial-delay-seconds=2
oc set probe dc/blue --readiness --get-url=http://:8080/item.php --initial-delay-seconds=2
oc set probe dc/green --liveness --get-url=http://:8080/item.php --initial-delay-seconds=2
oc set probe dc/blue --liveness --get-url=http://:8080/item.php --initial-delay-seconds=2
