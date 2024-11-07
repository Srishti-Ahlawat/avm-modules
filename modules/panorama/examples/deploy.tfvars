# Location
location = "eastus"
panorama_name       = "PanoramaInstance"
resource_group_name = "test-rg"
boot_diagnostic_storage_uri = "https://testing13132.blob.core.windows.net"

# Networking Configuration
interface = [
  {
    name                 = "default"
    subnet_id            = "/subscriptions/05a4028e-14a9-4f7d-baf3-2629d5a430bc/resourceGroups/test-rg/providers/Microsoft.Network/virtualNetworks/test131221/subnets/default"
    private_ip_address   = "10.0.0.4"
    public_ip            = true
    public_ip_name       = "PanoramaPublicIP"
    enable_ip_forwarding = false
  }
]

ssh_keys = [
 "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDV5QVpitQcVO1GaH6g+yZ3ZWLX6qwCQaPMZM2scdzLMtyA3zb+ZzLolCYeS+3ijreQLJLZBoUE8XqVZgRRTLPzCa+pxJqz7hZPGeWggaLseE8pvsV17XEUXfHBiboXsDCiynwI9PbndLISI37HwDOzJetSYgrDWnrCU9DqRZ9oB8WoSmnQLY1oHtugJprBTuXuCwOXNxv1ZxCwtytFw23RnJsf6Uz1/rvNXDhJd2gd5vWWClRt8wMHGoTMSKeqIlPrl76pM4c+oik7qQlPtBdyU7iJFKg4jOJNKrhKRHE7J2bBpaNffYNEEaf8jkl+fPXMpdOJ36ivI+e3PIqDmZ0R redmond\\srahlawat@DESKTOP-H9UPNAK"
]
