require 'dotenv'
Dotenv.load("./.env")
require 'bundler/setup'
Bundler.require
require 'open-uri'
require 'net/http/persistent'
require 'json'
require 'tty-prompt'

require_all 'lib'