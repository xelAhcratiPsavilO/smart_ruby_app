class FileLocationError < StandardError
  def message
    'File does not exist in given path'
  end
end

class FileExtensionError < StandardError
  def message
    'File extension is not LOG'
  end
end
