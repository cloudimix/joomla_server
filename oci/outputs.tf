output "public_ip" {
  value = oci_core_instance.joomla[*].public_ip
}
