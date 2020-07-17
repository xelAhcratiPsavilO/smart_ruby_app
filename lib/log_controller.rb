class LogController
  def initialize(log, log_parser, log_printer)
    @log = log
    @log_parser = log_parser
    @log_printer = log_printer
  end

  def execute
    log_parser.parse(log)
    parsed_logs = log_parser.parsed_logs
    log_printer.print_logs(parsed_logs)
  end

  private

  attr_reader :log, :log_parser, :log_printer
end
