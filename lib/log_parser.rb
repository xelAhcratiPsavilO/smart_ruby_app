require_relative 'custom_exceptions'

class LogParser
  def initialize(log)
    handle(log)
  end

  private

  def handle(log)
    raise FileExtensionError unless %w[.log].include? File.extname(log)
  end
end
