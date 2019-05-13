module SimpleStore
  module Commands
    class Null < Base
      def process
        puts 'please select a valid command'
      end
    end
  end
end
