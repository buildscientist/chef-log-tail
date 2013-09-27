#
# Cookbook Name:: chef-log-tail
# Recipe:: example
#
# Copyright 2013, buildscientist.com
#

chef_gem "file-tail" do
	version "1.0.12" 
	action :install
end

log_tail "/var/log/apache2/error_log" do
	line_count 10
	action :enable
end
