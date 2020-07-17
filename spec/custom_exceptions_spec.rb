require 'custom_exceptions'

describe FileLocationError do
  subject(:file_location_error) { described_class.new }

  describe '#message' do
    it 'displays a customize error message' do
      expect(file_location_error.message).to eq 'File does not exist in given path'
    end
  end
end

describe FileExtensionError do
  subject(:file_extension_error) { described_class.new }

  describe '#message' do
    it 'displays a customize error message' do
      expect(file_extension_error.message).to eq 'File extension is not LOG'
    end
  end
end
