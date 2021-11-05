require 'socket'

def scan_func(host,port)
    begin
        socket = TCPSocket.new(host, port)
        status = "open"
    rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT
        status = "closed"
    end
    puts "Port #{port} is #{status}."
end

host, *ports = ARGV
ports.each{|port| scan_func(host,port)}


