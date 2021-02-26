require 'dotenv'
Dotenv.load
require 'bundler/setup'
Bundler.require
require 'open-uri'
require 'net/http/persistent'
# require 'httparty'
require 'json'
# require "park_cli_project"
require 'tty-prompt'

require_all 'lib'

# module ParkDiscovery
# end