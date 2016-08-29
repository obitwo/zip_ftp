require 'rubygems'
require 'zip'

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
  zipfile.get_output_stream("myFile") { |os| os.write "myFile contains just this" }
end