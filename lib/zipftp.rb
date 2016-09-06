require 'zip'
require 'net/ftp'
require 'byebug'

class ZipFtp

  attr_reader :filepath, :ftp_host, :ftp_login, :ftp_password, :ftp_directory, :zip_output_directory, :zip_filename, :sent
  alias_method :sent?, :sent

  def initialize(opts)
    @filepath, @ftp_host, @ftp_login, @ftp_password, @ftp_directory, @zip_output_directory, @zip_filename, @sent = opts[:filepath], opts[:ftp_host], opts[:ftp_login], opts[:ftp_password], opts[:ftp_directory], opts[:zip_output_directory], opts[:zip_filename], false
  end

  def send

    filename = File.basename(@filepath)
    zip_filename = @zip_filename ? @zip_filename : File.basename(filename, ".*")
    zip_filepath = @zip_output_directory + "/" + zip_filename + ".zip"

    # Create the zip file
    Zip::File.open(zip_filepath, Zip::File::CREATE) do |zipfile|
      zipfile.add(filename, @filepath)
    end
    puts "zip file created"

    # Send via ftp
    Net::FTP.open(@ftp_host) do |ftp|
      ftp.passive = true
      ftp.login(@ftp_login,@ftp_password)
      files = ftp.chdir(@ftp_directory)
      puts files
      files = ftp.list('n*')
      puts files
      ftp.put(zip_filepath)
    end
    puts "zip file sent via ftp"
    @sent = true

  end

end
