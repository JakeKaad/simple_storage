require 'pry'

require_relative 'simple_store/configuration'
require_relative 'simple_store/commands'
require_relative 'simple_store/engine'

module SimpleStore
  def self.store
    configuration.store
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure(&block)
    yield configuration
  end
end
