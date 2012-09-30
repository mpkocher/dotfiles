IRB.conf[:AUTO_INDENT]=true
 
#
#load libraries
require 'irb/completion'
require 'rubygems' rescue nil
require 'wirble'
require 'pp'
#require 'utility_belt'
 
#
#load wirble
Wirble.init
Wirble.colorize

#custom haxz

# More than one way to do this
# Commented is the ruby way
# uncommentted is my preferred way
def ls(options=nil)
   #entries = instance_eval("Dir.entries(File.dirname(__FILE__))")
   #(entries - ["..", "."]).reverse
	 cmd = "ls "
	 cmd = cmd + " #{options}" unless options.nil?
   %x[#{cmd}].split("\n")
end

def pwd
	Dir.getwd
end

def fl(file_name)
   file_name += '.rb' unless file_name =~ /\.rb/
   @@recent = file_name 
   load "#{file_name}"
end
 
def rl
  fl(@@recent)
end

def reload(filename)
     $".delete(filename + ".rb")
     require(filename)
end
