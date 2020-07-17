require 'log_parser'
require 'tempfile'

describe LogParser do
  subject(:log_parser) { described_class.new(log) }

  describe '#initialize' do
    context 'when the file does not exist in the given path' do
      let(:log) { '' }
      it 'raises an error' do
        expect { log_parser }.to raise_error FileLocationError
      end
    end

    context 'when the file extension is not LOG' do
      let(:log) { Tempfile.new(['webserver', '.pdf']) }
      it 'raises an error' do
        expect { log_parser }.to raise_error FileExtensionError
      end
    end

    context 'when the file exists and the extension is LOG' do
      let(:log) { Tempfile.new(['webserver', '.log']) }
      it 'does not raise an error' do
        expect { log_parser }.not_to raise_error
      end
    end
  end

  describe '#parsed_logs' do
    context 'when the file is parsed' do
      let(:log) { Tempfile.new(['webserver', '.log']) }
      it 'stores the logs in a hash' do
        log.write("/help_page/1 126.318.035.038\n/contact 184.123.665.067")
        log.read
        log_parser.parse(log)
        expect(log_parser.parsed_logs).to include(
          '/help_page/1' => ['126.318.035.038'],
          '/contact' => ['184.123.665.067']
        )
      end
    end
  end

  describe '#print_visits' do
    context 'when the logs are stored' do
      let(:log) { Tempfile.new(['webserver', '.log']) }
      it 'prints a list of visits per endpoint' do
        log.write("/help_page/1 126.318.035.038\n/contact 184.123.665.067\n/contact 126.318.035.038")
        log.read
        log_parser.parse(log)
        expect { log_parser.print_visits }.to output("/contact 2 visits\n/help_page/1 1 visits\n").to_stdout
      end
    end
  end

  describe '#print_unique_views' do
    context 'when the logs are stored' do
      let(:log) { Tempfile.new(['webserver', '.log']) }
      it 'prints a list of unique views per endpoint' do
        log.write("/contact 184.123.665.067\n/contact 126.318.035.038")
        log.read
        log_parser.parse(log)
        expect { log_parser.print_unique_views }.to output("/contact 2 unique views\n").to_stdout
      end
    end
  end

  describe '#print_logs' do
    context 'when the logs are stored' do
      let(:log) { Tempfile.new(['webserver', '.log']) }
      it 'prints a list of visits per endpoint and a list of unique views per endpoint' do
        log.write("/contact 184.123.665.067\n/contact 126.318.035.038")
        log.read
        log_parser.parse(log)
        expect { log_parser.print_logs }.to output("/contact 2 visits\n\n/contact 2 unique views\n").to_stdout
      end
    end
  end
end
