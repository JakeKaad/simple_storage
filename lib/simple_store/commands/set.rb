module SimpleStore
  module Commands
    class Set < Base
      def process
        store[key] = value
        save
      end
    end
  end
end
