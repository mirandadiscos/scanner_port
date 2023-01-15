require 'socket'

class Scanner
    def self.scan(host,port)
        begin
            socket = TCPSocket.new(host, port)
            status = "open"
        rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT
            status = "closed"
        end
        puts "Port #{port} is #{status}."
    end
end

host, *ports = ARGV
ports.each{|port| Scanner.scan(host,port)}


