class Files
  def read(plain_text_file)
    text = ""
    File.open(plain_text_file).each do |line|
      text << line
    end
    text
  end

  def write(encrypted_file, encrypted_text)
    File.open(encrypted_file, "w") { |f| f.write(encrypted_text) }
  end
end
