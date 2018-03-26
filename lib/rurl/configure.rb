require 'yaml'
require 'erb'
require 'active_support/core_ext/hash/keys'

module Rurl
  class Configure
    def initialize(args:, url:, path:)
      @args = args
      @url = url
      @path = path
    end

    def args
      @args
    end

    def method
      yaml[:method].upcase
    end

    def headers
      Array(yaml[:headers])
    end

    def params
      yaml[:params]
    end

    def url
      @url || yaml[:url]
    end

    private

    def file
      @path.gsub(/^@/, '')
    end

    def yaml
      raise ConfigFileNotFound, "Config not found. #{@file}" unless File.exist?(file)
      @yaml = YAML.load(read).symbolize_keys
    rescue Psych::SyntaxError
      raise InvalidConfig, 'invalid config file'
    end

    def read
      str = File.open(file).read

      case File.extname(file)
      when '.erb'
        ERB.new(str, nil, '%-').result
      when '.yaml', '.yml'
        str
      else
        raise ConfigNotSupportExtention, 'suport extention .yaml or .yml or .erb'
      end
    end
  end
end
