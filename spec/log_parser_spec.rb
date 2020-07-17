require 'log_parser'
require 'tempfile'

describe LogParser do
  subject(:log_parser) { described_class.new(log) }

  describe '#initialize' do
    context 'when the file extension is not LOG' do
      let(:log) { Tempfile.new(['webserver', '.pdf']) }
      it 'raises an error' do
        expect { log_parser }.to raise_error FileExtensionError
      end
    end
  end
end
