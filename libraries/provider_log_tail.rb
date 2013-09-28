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

require 'file-tail'

class Chef
	class Provider
		class LogTail < Chef::Provider
			def initialize(*args)
				super
			end
			
			def load_current_resource
				@current_resource ||= Chef::Resource::LogTail.new(new_resource.name)
				@current_resource.log_path(new_resource.log_path)
				@current_resource.line_count(new_resource.line_count)
				@current_resource.filter(new_resource.filter)
				@current_resource.reverse_order(new_resource.reverse_order)
			end
			
			def action_enable
				tail_log()

			end	

			def validate_path
				Chef::Log::debug("Validating log path - #{new_resource.log_path}")
				raise IOError, "#{new_resource.log_path} is not a valid file}" unless ::File.file?(@new_resource.log_path)
			end

			def tail_log
				validate_path()
				log_file = @new_resource.log_path
				Chef::Log::info("[BEGIN =====> #{log_file} <===== BEGIN")
				::File::Tail::Logfile.tail(log_file,:return_if_eof => true, :backward => @new_resource.line_count) do |line| 
					Chef::Log::info(line)
				end
				Chef::Log::info("END =====> #{log_file} <===== END")
			end
		end
	end

end
