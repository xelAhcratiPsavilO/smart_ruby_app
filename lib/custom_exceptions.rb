class FileExtensionError < StandardError
  def message
    'File extension is not LOG'
  end
end
