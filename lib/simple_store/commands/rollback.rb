module SimpleStore
  module Commands
    class Rollback < Base
      def process
        end_transaction
      end
    end
  end
end
