check "health_check" {
  assert {
    condition = "http://${aws_instance.hashidog[0].public_ip}" == 200
    error_message = "${aws_instance.hashidog[0].public_ip}} returned an unhealthy status code"
  }
}