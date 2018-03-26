require 'uri'
require 'active_support/core_ext/object/to_param'

module Rurl
  module Method
    class Get < Base
      def method
        nil
      end

      def url
        uri = URI(config.url)
        uri.query = config.params.to_param
        "'#{uri}'"
      end

      def params
        nil
      end
    end
  end
end
