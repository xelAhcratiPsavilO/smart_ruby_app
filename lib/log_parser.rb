require_relative 'custom_exceptions'

class LogParser
  attr_reader :parsed_logs

  def initialize(log)
    @log = log
    handle(log)
    @parsed_logs = Hash.new { |hash, key| hash[key] = [] }
  end

  def parse(log)
    log_lines = File.readlines(log)
    log_lines.each do |line|
      endpoint, ip_address = line.split
      parsed_logs[endpoint] << ip_address
    end
  end

  private

  attr_reader :log

  def handle(log)
    raise FileLocationError unless File.exist?(log)
    raise FileExtensionError unless %w[.log].include? File.extname(log)
  end
end
