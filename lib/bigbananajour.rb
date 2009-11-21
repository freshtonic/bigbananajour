libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require "bananajour"

require 'bigbananajour/email_mangle_helper'
require 'bigbananajour/eater'

# Bananajour monkeypatches.
require 'bigbananajour/bananajour/bananajour'
require 'bigbananajour/bananajour/commands'
require 'bigbananajour/bananajour/repository'
require 'bigbananajour/bananajour/bonjour/advertiser'
require 'bigbananajour/bananajour/bonjour/repository'
require 'bigbananajour/bananajour/bonjour/repository_browser'
