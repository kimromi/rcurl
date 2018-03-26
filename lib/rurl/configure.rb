require 'yaml'
require 'erb'

module Rurl
  class Configure
    def initialize(file)
      @file = file
    end

    def load
      raise ConfigFileNotFound, "Config not found. #{@file}" unless File.exist?(@file)
      YAML.load(read)
    rescue Psych::SyntaxError
      raise InvalidConfig, 'yaml syntax error'
    end

    def read
      config = File.open(@file).read

      case File.extname(@file)
      when '.erb'
        ERB.new(config, nil, '%-').result
      when '.yaml', '.yml'
        config
      else
        raise ConfigNotSupportExtention, 'suport extention .yaml or .yml or .erb'
      end
    end
  end
end
