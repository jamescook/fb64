require 'mkmf'


def windows?
  RbConfig::CONFIG['target_os'] =~ /mingw32|mswin/
end

def solaris?
  RbConfig::CONFIG['target_os'] =~ /solaris/
end

def darwin?
  RbConfig::CONFIG['target_os'] =~ /darwin/
end

def openbsd?
  RbConfig::CONFIG['target_os'] =~ /openbsd/
end

def nix?
  ! (windows? || solaris? || darwin?)
end

extension_name = 'fb64'
dir_config 'libbase64'
library_name = if darwin?
  'libbase64.o'
elsif windows?
  raise "Sorry, your platform is not supported"
else
  'libbase64.so' # TODO verify
end

if have_library(library_name) && have_header('libbase64.h')
  dir_config(extension_name)
  create_makefile(extension_name)
end

# rake clean clobber compile -- --with-libbase64-dir=/Users/jcook/open_source/base64
