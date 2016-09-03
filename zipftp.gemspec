Gem::Specification.new do |s|
  s.name        = 'zipftp'
  s.version     = 0.0.0
  s.date        = '2016-09-02'
  s.summary     = 'ZIP to FTP'
  s.description = 'Convert file(s) to zip and send via ftp'
  s.authors     = ['Obinna Okogbue']
  s.email       = 'obinna@okogbue.com'
  s.files       = ['lib/zipftp.rb']
  s.homepage    = 'http://rubygems.org/gems/zipftp'
  s.license     = 'MIT'

  s.add_runtime_dependency "rubyzip", '~> 1.2'
end
