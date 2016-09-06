require 'zipftp'
require 'byebug'

z = ZipFtp.new( filepath: "/home/lawgix/zipftp/input/sample.txt",
                ftp_host: "localhost",
                ftp_login: "lawgix",
                ftp_password: "obwon=419",
                ftp_directory: "/home/lawgix/zipftp/ftp",
                zip_output_directory: "/home/lawgix/zipftp/output",
                zip_filename: "test" )

puts "File path: #{z.filepath}\nHost: #{z.ftp_host}\nSent: #{z.sent?}\n\n"
z.send
puts "File path: #{z.filepath}\nHost: #{z.ftp_host}\nSent: #{z.sent?}\n\n"
