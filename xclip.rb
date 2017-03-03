#require 'daemons'
class XclipMonitor

   def initialize()
   end

   def listen
	   xclipFile = %x{xclip -o}
	   if File.file?(xclipFile)
		%x{gvim #{xclipFile}}
		%x{echo -n | xclip}
           end
   end
end


# main execution
#Daemons.run('xclipMonitor')
server = XclipMonitor.new()
while true
	server.listen
#	sleep 5
end
