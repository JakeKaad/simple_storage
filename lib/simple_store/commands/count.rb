module SimpleStore
  module Commands
    class Count < Base
      def process
        size = store.values.select do |val|
          val == value
        end.size

        puts "=> There are #{size} entries for #{value}."
      end
    end
  end
end
