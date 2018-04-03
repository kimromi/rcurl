require 'json'

module Rcurl
  module Method
    class Post < Base
      def method
        '-X POST'
      end

      def url
        config.url
      end

      def params
        if json?
          "-d '#{config.params.to_json}'"
        else
          config.params.map{|k, v| "-d '#{k}=#{v}'"}.join(' ')
        end
      end

      private

      def json?
        config.headers.any? do |header|
          header.downcase =~ /content-type: application\/json/
        end
      end
    end
  end
end
