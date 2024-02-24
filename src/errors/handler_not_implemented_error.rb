class HandlerNotImplementedError < StandardError
  def initialize(message = "Handler for this action not implemented")
    super
  end
end
