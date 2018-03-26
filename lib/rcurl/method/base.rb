module Rcurl
  module Method
    class Base
      attr_reader :config

      def initialize(config)
        @config = config
      end

      def args
        config.args.join(' ')
      end

      def headers
        config.headers.map{|h| "-H '#{h}'"}.join(' ')
      end

      def method
        "-X #{config.method.upcase}"
      end

      def url
        "'#{config.url}'"
      end

      def params
        raise NotImplementError
      end
    end
  end
end
