module SimpleStore
  module Commands
    class Null < Base
      def valid?
        false
      end
    end
  end
end
