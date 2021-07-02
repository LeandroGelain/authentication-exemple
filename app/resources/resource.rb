class Resource

  def response_format(params, status, message)
    {
      object: params,
      status: status,
      message: message
    }
  end

  def error_message(message, status)
    {
      message: message,
      status: status
    }
  end

end