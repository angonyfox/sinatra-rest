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

# find(id) throws exceptions...
# find_by_id returns nil
# module ActiveRecord
#   class Base
#     class << self
#       def find_by_id(id)
#         find(id)
#       end
#     end
#   end
# end


