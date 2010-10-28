module Stone
  module Resource
    def find_by_id(id)
      get(id)
    end
    
    def delete(id)
      model = self.find_by_id(id)
      model.destroy if model
    end
  end
end

module DataMapper

  module Resource
    def update_attributes(opt)
      update opt
    end
  end

  module Model
    def find_by_id(id)
      get(id)
    end
    
    def delete(id)
      model = self.find_by_id(id)
      model.destroy if model
    end
  end
end

# find throws exceptions...
# find_by_id returns nil
# 
# find_by_id should already exist but alas it doesn't 
# because templates are eval'd before that method is.. (i think)
module ActiveRecord
  class Base
    class << self
      def find_by_id(id)
        begin
          find(id)
        rescue Exception 
          nil
        end
      end
    end
  end
end


