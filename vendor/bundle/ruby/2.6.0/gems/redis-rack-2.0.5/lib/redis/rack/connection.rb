class Redis
  module Rack
    class Connection
      def initialize(options = {})
        @options = options
        @store = options[:redis_store]
        @pool = options[:pool]

        if @pool && !@pool.is_a?(ConnectionPool)
          raise ArgumentError, "pool must be an instance of ConnectionPool"
        end
      end

      def with(&block)
        if pooled?
          pool.with(&block)
        else
          block.call(store)
        end
      end

      def pooled?
        [:pool, :pool_size, :pool_timeout].any? { |key| @options.key?(key) }
      end

      def pool
        @pool ||= ConnectionPool.new(pool_options) { store } if pooled?
      end

      def store
        @store ||= Redis::Store::Factory.create(@options[:redis_server])
      end

      def pool_options
        {
          size: @options[:pool_size],
          timeout: @options[:pool_timeout]
        }
      end
    end
  end
end
