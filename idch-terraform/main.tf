terraform {
  required_providers {
    idcloudhost = {
      source = "bapung/idcloudhost"
      version = "0.1.2"
    }
  }
}

provider "idcloudhost" {
    auth_token = "mTWvAHka6YmhUncBxKZyCpeL40C7Kyc0" # API Token from idcloudhost.com
    region = "jkt01"
}

resource "idcloudhost_vm" "nafis-appserver" {
    name = "nafis-appserver"
    os_name = "ubuntu"
    os_version= "20.04"
    disks = 20
    vcpu = 1
    memory = 1024
    username = "nafis"
    initial_password = "Katasand1" # Combination of Uppercase, Lowercase & Numbers
    billing_account_id = 1200157626 # Billing ID from idcloudhost.com
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDesR8GxzKHeswK9lwf5+ZwmqKhhiOFwxf2RaNN9Ih5hnCImNdg55xBzIS1hWsz3svU4gia+DZHRAC99MWIZr+RlTcIsEd02BgSHGUj63UPuJCOGz1vCvhp38pKtxZOAL0e0Kb3TRUvGGP52rs3eCQ37IBErEYamcUyX1vVovQwmB5GqarRl1cSxmReioOJgBIoqsbGiRCuYztVOCFSLq1bxeSTJM6gF/Kcmu6cE6wuhD6q/989dhdX1SHwBU04lJvKh2zRCzz+eiJgGkYMErNbAAAUl/qkKtcvGmSKMT2ObGQ8hdXLVEIOyPesQ2PvJGC7IprPzk1D/pcTIwD/DGTw8/5/tEnYFrODWfTnvq0zW0GfnMAk1lfHugwn265dYhrHOjQ3gDbmTgIbe5Ltg4VKRqTVZDAUY52KD7hrSEx7GCacSUUcmCZ2TWFnBMRHYqqM8d9GWhZPHVBjhLbZSed9C9Jb/N07wvoPVVVZ01Rej555L7LC5Aqu1OWMyCxPDls= server@server"
    backup = false
}

resource "idcloudhost_vm" "nafis-gateway" {
    name = "nafis-gateway"
    os_name = "ubuntu"
    os_version= "20.04"
    disks = 20
    vcpu = 1
    memory = 1024
    username = "nafis"
    initial_password = "Katasand1" # Combination of Uppercase, Lowercase & Numbers
    billing_account_id = 1200157626 # Billing ID from idcloudhost.com
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDesR8GxzKHeswK9lwf5+ZwmqKhhiOFwxf2RaNN9Ih5hnCImNdg55xBzIS1hWsz3svU4gia+DZHRAC99MWIZr+RlTcIsEd02BgSHGUj63UPuJCOGz1vCvhp38pKtxZOAL0e0Kb3TRUvGGP52rs3eCQ37IBErEYamcUyX1vVovQwmB5GqarRl1cSxmReioOJgBIoqsbGiRCuYztVOCFSLq1bxeSTJM6gF/Kcmu6cE6wuhD6q/989dhdX1SHwBU04lJvKh2zRCzz+eiJgGkYMErNbAAAUl/qkKtcvGmSKMT2ObGQ8hdXLVEIOyPesQ2PvJGC7IprPzk1D/pcTIwD/DGTw8/5/tEnYFrODWfTnvq0zW0GfnMAk1lfHugwn265dYhrHOjQ3gDbmTgIbe5Ltg4VKRqTVZDAUY52KD7hrSEx7GCacSUUcmCZ2TWFnBMRHYqqM8d9GWhZPHVBjhLbZSed9C9Jb/N07wvoPVVVZ01Rej555L7LC5Aqu1OWMyCxPDls= server@server"
    backup = false
}

resource "idcloudhost_vm" "nafis-monitoring" {
    name = "nafis-monitoring"
    os_name = "ubuntu"
    os_version= "20.04"
    disks = 20
    vcpu = 2
    memory = 2048
    username = "nafis"
    initial_password = "Katasand1" # Combination of Uppercase, Lowercase & Numbers
    billing_account_id = 1200157626 # Billing ID from idcloudhost.com
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDesR8GxzKHeswK9lwf5+ZwmqKhhiOFwxf2RaNN9Ih5hnCImNdg55xBzIS1hWsz3svU4gia+DZHRAC99MWIZr+RlTcIsEd02BgSHGUj63UPuJCOGz1vCvhp38pKtxZOAL0e0Kb3TRUvGGP52rs3eCQ37IBErEYamcUyX1vVovQwmB5GqarRl1cSxmReioOJgBIoqsbGiRCuYztVOCFSLq1bxeSTJM6gF/Kcmu6cE6wuhD6q/989dhdX1SHwBU04lJvKh2zRCzz+eiJgGkYMErNbAAAUl/qkKtcvGmSKMT2ObGQ8hdXLVEIOyPesQ2PvJGC7IprPzk1D/pcTIwD/DGTw8/5/tEnYFrODWfTnvq0zW0GfnMAk1lfHugwn265dYhrHOjQ3gDbmTgIbe5Ltg4VKRqTVZDAUY52KD7hrSEx7GCacSUUcmCZ2TWFnBMRHYqqM8d9GWhZPHVBjhLbZSed9C9Jb/N07wvoPVVVZ01Rej555L7LC5Aqu1OWMyCxPDls= server@server"
    backup = false
}

resource "idcloudhost_floating_ip" "ip-appserver" {
    name = "nafis-appserver"
    billing_account_id = 1200157626 # Billing ID from idcloudhost.com
    assigned_to = idcloudhost_vm.nafis-appserver.id
}

resource "idcloudhost_floating_ip" "ip-gateway" {
    name = "nafis-gateway"
    billing_account_id = 1200157626 # Billing ID from idcloudhost.com
    assigned_to = idcloudhost_vm.nafis-gateway.id
}

resource "idcloudhost_floating_ip" "ip-monitoring" {
    name = "nafis-monitoring"
    billing_account_id = 1200157626 # Billing ID from idcloudhost.com
    assigned_to = idcloudhost_vm.nafis-monitoring.id
}
