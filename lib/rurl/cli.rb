require 'thor'

module Rurl
  class CLI < Thor
    default_command :request

    option :file, type: :string, aliases: '-f'

    desc 'request', 'test'
    def request
      Configure.new(options[:file]).load
    rescue RurlError => e
      $stderr.puts e.message
      exit 1
    end

    map %w(--version -v) => :__print_version
    desc "--version, -v", "print version"
    def __print_version
      puts Rurl::VERSION
    end

  end
end
