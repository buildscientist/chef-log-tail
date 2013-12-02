Chef-Log-Tail
=============
Chef-Log-Tail is a Chef resource/provider that allows users to tail any log file on a chef node. It was designed for Chef's who want to tail logs without having to exec calls to tail and grep.

Requirements
-----
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
Disclaimer
----
This resource provider is not meant as a replacement to better suited log streaming solutions such as Logstash or Splunk. The goal is to provide Chef's with a quick method of tailing logs without having to resort to making system calls to /usr/bin/tail.

CHANGELOG
-----
0.3.0
-----
- [YEK] - chef-log-tail can now tail multiple log files

0.2.0
-----
- [YEK] - Initial release of chef-log-tail
- chef-log-tail is capable of tailing a single log
