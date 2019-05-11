module SimpleStore
  module Commands
    class Commit < Base
      def process
        @store = stores
        save
        end_transaction
      end
    end
  end
end
