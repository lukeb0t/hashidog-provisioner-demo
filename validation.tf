#check "health_check" {
#     data "http" "hashidog" {
#    url = "http://${aws_instance.hashidog[0].public_ip}"
#  }
#
#    assert {
#    condition = data.http.hashidog.status_code == 200
#    error_message = "${data.http.hashidog.url} returned an unhealthy status code"
#  }
#}