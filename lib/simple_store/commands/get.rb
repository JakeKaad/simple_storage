module SimpleStore
  module Commands
    class Get < Base
      def process
        puts store[key]
      end
    end
  end
end
