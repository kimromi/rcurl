require 'thor'

module Rurl
  class CLI < Thor
    default_command :help

    map %w(--version -v) => :__print_version
    desc "--version, -v", "print version"
    def __print_version
      puts Rurl::VERSION
    end
  end
end
