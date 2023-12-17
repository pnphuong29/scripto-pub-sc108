# gitlab.com

Host gitlab.com
  HostName gitlab.com
  User git
  IdentityFile "/Users/pnphuong29/pnphuong29/OneDrive/Keys/gitlab/pnphuong29_dev_gitlab.txt"
  IdentitiesOnly yes
  AddKeysToAgent yes # macOS only
  UseKeychain yes # macOS only
  CheckHostIP yes

# gitlab.com

Host gitlab.successsoftware.global
  HostName gitlab.successsoftware.global
  User git
  IdentityFile "/Users/pnphuong29/pnphuong29/OneDrive/Keys/sss/phuong.pham.sss_gitlab.txt"
  IdentitiesOnly yes
  AddKeysToAgent yes # macOS only
  UseKeychain yes # macOS only
  CheckHostIP yes

# github.com

Host github.com
  HostName github.com
  User git
  IdentityFile "/Users/pnphuong29/pnphuong29/OneDrive/Keys/github/pnphuong29_dev_github.txt"
  IdentitiesOnly yes
  AddKeysToAgent yes # macOS only
  UseKeychain yes # macOS only
  CheckHostIP yes

# aws lightsail

Host aws-centos8
  HostName 18.136.179.55
  User centos
  IdentityFile "/Users/pnphuong29/pnphuong29/OneDrive/Keys/aws/aws_lightsail_centos_8_southeast"
  IdentitiesOnly yes
  AddKeysToAgent yes
  UseKeychain yes
  CheckHostIP yes
