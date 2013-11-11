#
# Cookbook Name:: ossec
# Attributes:: default
#
# Copyright 2010, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# general settings
default['ossec']['server_role'] = "ossec_server"
default['ossec']['checksum']    = "e7bb4701a6b9a40f76d4e2c3c39106ded3c37f13ccc3ce476029da1f0e9c9f9e"
default['ossec']['version']     = "2.7"
default['ossec']['url']         = "http://www.ossec.net/files/ossec-hids-#{node['ossec']['version']}.tar.gz"
default['ossec']['logs']        = []

# server-only
default['ossec']['server']['maxagents'] = 256

# used to populate config files and preload values for install
default['ossec']['user']['alerts']['log_alert_level'] = 1
default['ossec']['user']['alerts']['email_alert_level'] = 7
default['ossec']['user']['language'] = "en"
default['ossec']['user']['install_type'] = "local"
default['ossec']['user']['dir'] = "/var/ossec"
default['ossec']['user']['delete_dir'] = true
default['ossec']['user']['active_response'] =  true
default['ossec']['user']['syscheck']['enable'] = true
default['ossec']['user']['syscheck']['frequency'] = 79200
default['ossec']['user']['syscheck']['checkall'] = [ "/etc", "/usr/bin", "/usr/sbin", "/bin", "/sbin" ]
default['ossec']['user']['syscheck']['ignore'] = [ "/etc/mtab", "/etc/mnttab", "/etc/hosts.deny", "/etc/mail/statistics", "/etc/random-seed", "/etc/adjtime", "/etc/httpd/logs", "/etc/utmpx", "/etc/wtmpx", "/etc/cups/certs", "/etc/dumpdates", "/etc/svc/volatile" ]
default['ossec']['user']['syslog']['enable'] = true
default['ossec']['user']['syslog']['server'] = "syslog.example.com"
default['ossec']['user']['syslog']['port'] = 514
default['ossec']['user']['syslog']['level'] = default['ossec']['user']['alerts']['log_alert_level']
default['ossec']['user']['syslog']['group'] = "ossec"
default['ossec']['user']['rootcheck'] = true
default['ossec']['user']['update'] = false
default['ossec']['user']['update_rules'] = true
default['ossec']['user']['binary_install'] = false
default['ossec']['user']['agent_server_ip'] = nil
default['ossec']['user']['enable_email'] = true
default['ossec']['user']['email'] = "ossec@example.com"
default['ossec']['user']['smtp'] = "127.0.0.1"
default['ossec']['user']['remote_syslog'] = false
default['ossec']['user']['firewall_response'] = true
default['ossec']['user']['pf'] = false
default['ossec']['user']['pf_table'] = false
default['ossec']['user']['white_list'] = []
default['ossec']['user']['rules'] = [ "rules_config.xml", "pam_rules.xml", "sshd_rules.xml", "telnetd_rules.xml", "syslog_rules.xml", "arpwatch_rules.xml", "symantec-av_rules.xml", "symantec-ws_rules.xml", "pix_rules.xml", "named_rules.xml", "smbd_rules.xml", "vsftpd_rules.xml", "pure-ftpd_rules.xml", "proftpd_rules.xml", "ms_ftpd_rules.xml", "ftpd_rules.xml", "hordeimp_rules.xml", "roundcube_rules.xml", "wordpress_rules.xml", "cimserver_rules.xml", "vpopmail_rules.xml", "vmpop3d_rules.xml", "courier_rules.xml", "web_rules.xml", "apache_rules.xml", "nginx_rules.xml", "php_rules.xml", "mysql_rules.xml", "postgresql_rules.xml", "ids_rules.xml", "squid_rules.xml", "firewall_rules.xml", "cisco-ios_rules.xml", "netscreenfw_rules.xml", "sonicwall_rules.xml", "postfix_rules.xml", "sendmail_rules.xml", "imapd_rules.xml", "mailscanner_rules.xml", "dovecot_rules.xml", "ms-exchange_rules.xml", "racoon_rules.xml", "vpn_concentrator_rules.xml", "spamd_rules.xml", "msauth_rules.xml", "mcafee_av_rules.xml", "trend-osce_rules.xml", "ms-se_rules.xml", "zeus_rules.xml", "solaris_bsm_rules.xml", "vmware_rules.xml", "ms_dhcp_rules.xml", "asterisk_rules.xml", "ossec_rules.xml", "attack_rules.xml", "local_rules.xml", "richtest.xml" ]
