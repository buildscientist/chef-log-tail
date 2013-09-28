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

require 'chef/resource'

class Chef
	class Resource
		class LogTail < Chef::Resource
			def initialize(name,run_context=nil)
				super
				@resource_name = :log_tail
				@provider = Chef::Provider::LogTail
				@action = :capture
				@allowed_actions = [:nothing, :enable]
				
				@log_path = name
				@line_count = nil
				@filter = nil
				@reverse_order = false
			end		
			
			def log_path(arg=nil)
				set_or_return(:log_path, arg, :kind_of => [String,Array], :required => true)
			end
			
			def line_count(arg=nil)
				set_or_return(:line_count, arg, :kind_of => Fixnum, :required => true)
			end

			def filter(arg=nil)
				set_or_return(:filter, arg, :kind_of => String, :required => false)
			end
			
			def reverse_order(arg=nil)
				set_or_return(:reverse_order, arg, :kind_of => [TrueClass,FalseClass], :default => false)
			end
		end
	end

end
