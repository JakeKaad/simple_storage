module SimpleStore
  module Commands
    class Delete < Base
      def process
        store.delete(key)
      end
    end
  end
end
