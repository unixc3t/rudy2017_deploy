class Tea
  class << self
    def hell
      p 'hello'
    end
  end
  def zz
    p 'zz'
  end
end


Tea.new().zz