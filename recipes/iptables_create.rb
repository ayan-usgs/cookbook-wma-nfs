#
# Cookbook Name:: wma_nfs
# Recipe:: iptables_create
# Description:: Creates IPTables rules
#
node['wma']['nfs']['iptables'].map do |rule_name, rule_body|
  iptables_rule rule_name do
    lines [rule_body].flatten.join("\n")
  end
end
