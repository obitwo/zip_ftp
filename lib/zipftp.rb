require 'zip'
require 'net/ftp'

folder = "/home/lawgix/zip_ftp/input"
input_filenames = ['sample.txt']

zipfile_name = "/home/lawgix/zip_ftp/output/archive.zip"

Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
  input_filenames.each do |filename|
    # Two arguments:
    # - The name of the file as it will appear in the archive
    # - The original file, including the path to find it
    zipfile.add(filename, folder + '/' + filename)
  end
end

Net::FTP.open('localhost') do |ftp|
  ftp.passive = true
  ftp.login('lawgix','obwon=419')
  files = ftp.chdir('/home/lawgix/zip_ftp/ftp')
  puts files
  files = ftp.list('n*')
  puts files
  ftp.put(zipfile_name)
end
