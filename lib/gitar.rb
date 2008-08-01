$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'uuid'
require 'yaml'
require 'gitar/version'
require 'gitar/environment'
require 'gitar/document'
require 'gitar/storage'
require 'gitar/validation'
require 'gitar/base'

module Gitar
  
end