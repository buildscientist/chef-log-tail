## Copyright 2013 Youssuf ElKalay
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  	http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#
#
# Cookbook Name:: chef-log-tail
# Recipe:: example

chef_gem "file-tail" do
	version "1.0.12" 
	action :install
end

log_tail ["/var/log/apache2/error_log","/var/log/apache2/access_log"] do
	line_count 5
	action :enable
end
