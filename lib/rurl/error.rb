module Rurl
  class RurlError < StandardError; end

  class ConfigFileNotFound < RurlError; end
  class ConfigNotSupportExtention < RurlError; end
  class InvalidConfig < RurlError; end
end
