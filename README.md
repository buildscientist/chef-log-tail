Chef-Log-Tail
=============
Chef-Log-Tail is a Chef resource/provider that allows users to tail any log file on a chef node. It was designed for Chef's who want to tail logs without having to exec calls to tail and grep.

Requirements
-----
- Linux or OS X
- Ruby 1.9.x
- Chef 11.x 
- [file-tail gem](http://flori.github.io/file-tail/index.html)
- Logs to tail

QuickStart
-----

Publish the chef-log-tail cookbook
- If you use [Berkshelf](http://berkshelf.com/)
``` 
berks cookbook 'chef-log-tail'
```
- Or the knife command line tool 
```
knife cookbook upload chef-log-tail
```

Create a recipe using the chef-log-tail resource
```
log_tail "/var/logs/httpd/access_log" do 
    line_count 3000
    action :enable
end
```

Publish the recipe/cookbook 

Add cookbook to your node(s) runlist
```
knife node <hostname> add run_list 'recipe[cookbook][recipe]'
```

Invoke chef-client on target node(s)
```
knife ssh 'name:*' 'sudo chef-client'
```

OR 

Invoke chef-solo on your target node
```
sudo chef-solo -c solo.rb -j node.json
```

Examples
----
Tail an individual log file
```
log_tail "/var/log/httpd/access_log" do 
	line_count 3000
	action :enable
end
```

Tail multiple log files
```
log_tail ["/var/log/httpd/error_log","/var/log/httpd/access_log"] do
	line_count 5
	action :enable
end
```

Disclaimer
----
This resource provider is not meant as a replacement to better suited log streaming solutions such as Logstash or Splunk. The goal is to provide Chef's with a quick method of tailing logs without having to resort to making system calls to /usr/bin/tail.
