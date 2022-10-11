class UIReader
  protected

  def ask_data
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
