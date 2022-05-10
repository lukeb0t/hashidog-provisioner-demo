#!/bin/bash
# Script to deploy a very simple web application.
# The web app has a customizable image and some text.

cat << EOM > /var/www/html/index.html
<html>
  <head><title>Bork!</title></head>
  <body>
  <div style="width:800px;margin: 0 auto">

  <!-- BEGIN -->
  <center><img src="http://${PLACEHOLDER}/${WIDTH}/${HEIGHT}?id=91"></img></center>
  <center><h2>Wuff-Wuff World!</h2></center>
  Look at this little ${PREFIX}!. Who's the goodest boy?
  <!-- END -->

  </div>
  </body>
</html>
EOM

echo "Script complete."
