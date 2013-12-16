# Copyright 2013 Youssuf ElKalay
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

require 'rspec'
require 'chef'
require "#{File.dirname(File.dirname(__FILE__))}/libraries/provider_log_tail" 

describe Chef::Provider::LogTail do
	before(:each) do 
		@name = "/tmp"
		@new_resource = Chef::Resource::LogTail.new(@name)
		@events = Chef::EventDispatch::Dispatcher.new
		@node = Chef::Node.new
		@run_context = Chef::RunContext.new(@node,{},@events)
		@logtail = Chef::Provider::LogTail.new(@new_resource,@run_context)
	end

	it "raises an exception if the log path is invalid" do 
		@new_resource.log_path  "/foo/bar/"
	        expect{ @logtail.run_action(:enable) }.to raise_exception(IOError) 
	end
end
