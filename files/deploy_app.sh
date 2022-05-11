#!/bin/bash

apt -y update
apt -y install apache2
systemctl start apache2
chown -R ubuntu:ubuntu /var/www/html

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
