require 'log_printer'

describe LogPrinter do
  subject(:log_printer) { described_class.new }
  let(:parsed_logs) { { '/contact' => ['126.318.035.038', '184.123.665.067'] } }

  describe '#print_visits' do
    context 'when the logs are stored' do
      it 'prints a list of visits per endpoint' do
        expect { log_printer.print_visits(parsed_logs) }.to output("/contact 2 visits\n").to_stdout
      end
    end
  end

  describe '#print_unique_views' do
    context 'when the logs are stored' do
      it 'prints a list of unique views per endpoint' do
        expect { log_printer.print_unique_views(parsed_logs) }.to output("/contact 2 unique views\n").to_stdout
      end
    end
  end

  describe '#print_logs' do
    context 'when the logs are stored' do
      it 'prints a list of visits per endpoint and a list of unique views per endpoint' do
        expect { log_printer.print_logs(parsed_logs) }.to output("/contact 2 visits\n\n/contact 2 unique views\n").to_stdout
      end
    end
  end
end
