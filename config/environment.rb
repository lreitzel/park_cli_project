require 'dotenv'
Dotenv.load
require 'bundler/setup'
Bundler.require
require 'open-uri'
require 'net/http'
# require 'httparty'
require 'json'
# require "park_cli_project"

require_all 'lib'

module ParkDiscovery
end