module EnigmaHelpers
  def total_rotation(count, key, offset_key)
    key_rotation(count, key) + offset_rotation(count, offset_key)
  end

  def key_rotation(count, key)
    shift = count % 5
    key[shift..shift + 1].to_i
  end

  def offset_rotation(count, offset_key)
    shift = count % 4
    offset_key[shift].to_i
  end

  def offset_key(date_of_encryption)
  date_key = date_of_encryption.to_i
  date_key = date_key **2
  date_key.to_s[-4..-1]
  end
  #End of module
end
