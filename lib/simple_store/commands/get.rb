module SimpleStore
  module Commands
    class Get < Base
      def process
        if stores.keys.include? key
          puts "=> #{stores[key]}"
        else
          puts "=> key not set"
        end
      end
    end
  end
end
