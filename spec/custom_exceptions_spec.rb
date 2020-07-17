require 'custom_exceptions'

describe FileExtensionError do
  subject(:file_extension_error) { described_class.new }

  describe '#message' do
    it 'displays a customize error message' do
      expect(file_extension_error.message).to eq 'File extension is not LOG'
    end
  end
end
