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
require "#{File.dirname(File.dirname(__FILE__))}/libraries/resource_log_tail" 

describe Chef::Resource::LogTail do 
	before(:each) do 
		@resource = Chef::Resource::LogTail.new("/tmp/")
	end

	it "should create an instance of Chef::Resource:LogTail" do 
		@resource.should be_a_kind_of(Chef::Resource::LogTail)
	end
	
	it "should have a resource name" do 
		@resource.name.should eql("/tmp/")
	end

	it "should have a default action of :enable" do 
		@resource.action.should eql(:enable)
	end

	it "should only accept actions of nothing or enable" do 
		expect { @resource.action :capture }.to raise_error()
	end

	it "should only accept a line count as a fixed number" do 
		@resource.line_count 10
		@resource.line_count.should be_a_kind_of(Fixnum)
	end
	
	it "should accept log paths of type string" do 
		@resource.log_path "/foo/bar"
		@resource.log_path.should be_a_kind_of(String)
	end

	it "should accept log paths of type array" do
		@resource.log_path ["/foo/bar","/bar/foo"]
		@resource.log_path.should be_a_kind_of(Array)
	end
end
