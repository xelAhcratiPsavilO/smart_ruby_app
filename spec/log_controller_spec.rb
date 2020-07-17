require 'log_controller'

describe LogController do
  subject(:log_controller) { described_class.new(log, log_parser) }
  let(:log_parser) { spy :log_parser }
  let(:log) { double :log }

  describe '#execute' do
    it 'parses and prints logs' do
      log_controller.execute
      expect(log_parser).to have_received(:parse).with(log)
      expect(log_parser).to have_received :print_logs
    end
  end
end
