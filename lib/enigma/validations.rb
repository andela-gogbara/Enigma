module Validations

  def check_file_type(arguments)
    arguments.each_with_index do |value, index|
      return @messages.file_type_error unless value.include? ".txt"
      break if index == 1
    end
  end

  def check_file_exitence
      return @messages.file_not_present
  end

  def check_argument
    @messages.argument_error
  end

  def error_message(error_class)
    case error_class
    when "TypeError" then check_argument
    when "Errno::ENOENT" then check_file_exitence
    else
      "Uknown Error"
    end
  end

  def is_first_argument_present?(argument1)
    File.exist?(argument1) ? true : false
  end


# End of file
end
