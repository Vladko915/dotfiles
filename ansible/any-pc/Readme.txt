#change hostname,set ip-static, update .bash_aliases

apis any-pc/hostname.ini any-pc/pb_edit_hostname.yml
apis any-pc/01_dhcp.ini any-pc/pb_change_to_static_ip.yml
apis any-pc/all.ini any-pc/pb_up_bash_aliases.yml