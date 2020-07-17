class LogController
  def initialize(log, log_parser)
    @log = log
    @log_parser = log_parser
  end

  def execute
    log_parser.parse(log)
    log_parser.print_logs
  end

  private

  attr_reader :log, :log_parser
end
