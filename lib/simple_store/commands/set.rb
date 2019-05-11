module SimpleStore
  module Commands
    class Set < Base
      def process
        store[key] = value
      end
    end
  end
end
