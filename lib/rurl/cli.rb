require 'thor'

module Rurl
  class CLI < Thor
    default_command :execute

    option :path, type: :string, aliases: '-d'

    desc 'execute -d @path [url] [args]', 'execute curl'
    def execute(*args)
      invoke :help and return unless options[:path]

      if url = args.find{|arg| arg.match(/^https?:\/\//) }
        args.delete(url)
      end

      config = Configure.new(args: args, url: url, path: options[:path])
      Curl.execute(config)
    rescue RurlError => e
      $stderr.puts e.message
      exit 1
    end

    map %w(--version -v) => :version
    desc "--version, -v", "see version"
    def version
      puts Rurl::VERSION
    end
  end
end
