require 'active_support/all'


module A
  extend ActiveSupport::Concern

  def instance1
    p 'instance1'
  end

  module ClassMethods
    def class1
      p 'class1'
    end
  end
end


module B
  extend ActiveSupport::Concern
  include A

  def instance2
    p 'instance2'
  end

  module ClassMethods
    def class2
      p 'class2'
    end
  end
end
class P
  include B
end



