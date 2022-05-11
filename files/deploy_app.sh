#!/bin/bash

sudo apt -y update
sleep 10
sudo apt -y update
sudo apt -y install apache2
sudo apt -y update && sudo apt -y upgrade
sudo systemctl start apache2
sudo chown -R ubuntu:ubuntu /var/www/html

cat << EOM > /var/www/html/index.html
<html>
  <head><title>Bork!</title></head>
  <body>
  <div style="width:800px;margin: 0 auto">

  <!-- BEGIN -->
  <center><img src="http://${PLACEHOLDER}/${WIDTH}/${HEIGHT}?id=91"></img></center>
  <center><h2>Woof-Woof World!</h2></center>
  Look at this little ${PREFIX}!. Who's the goodest boy?
  <!-- END -->

  </div>
  </body>
</html>
EOM

echo "Script completed"
