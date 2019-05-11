module SimpleStore
  module Commands
    class Begin < Base
      def process
        File.open(SimpleStore.transaction_store, "a+") {|file|}
      end
    end
  end
end
