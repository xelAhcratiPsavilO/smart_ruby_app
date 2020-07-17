require 'log_controller'

describe LogController do
  subject(:log_controller) { described_class.new(log, log_parser, log_printer) }
  let(:log_parser) { spy :log_parser }
  let(:log_printer) { spy :log_printer }
  let(:log) { double :log }
  let(:parsed_logs) { double :parsed_logs }

  describe '#execute' do
    it 'parses and prints logs' do
      log_controller.execute
      expect(log_parser).to have_received :parse
      expect(log_printer).to have_received :print_logs
    end
  end
end
