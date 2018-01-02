class Array
  def keep(&should_keep)
    choose { |e| should_keep.call(e) }
  end

  def discard(&should_discard)
    choose { |e| !should_discard.call(e) }
  end

  private

  def choose(&should_choose)
    self.each_with_object([]) do |e, chosen|
      chosen << e if should_choose.call(e)
    end
  end
end
