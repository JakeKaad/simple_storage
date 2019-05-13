module SimpleStore
  module Commands
    class Exit < Base
      def process
        puts 'Thank you for using Simple Store'
        exit(true)
      end
    end
  end
end
