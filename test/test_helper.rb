require 'test/unit'
require 'fileutils'
require File.dirname(__FILE__) + '/../lib/gitar'
require 'rubygems'
require 'shoulda'
require 'git' # unpack into vendor

class Cat < Gitar::Base
  
end