#!/usr/bin/env ruby

require_relative 'lib/log_controller'
require_relative 'lib/log_parser'

log = ARGV[0]
LogController.new(log, LogParser.new(log)).execute
