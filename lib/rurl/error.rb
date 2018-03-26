module Rurl
  class RurlError < StandardError; end

  class ConfigFileNotFound < RurlError; end
  class ConfigNotSupportExtention < RurlError; end
  class InvalidConfig < RurlError; end

  class NotSupportedMethod < RurlError; end
  class NotGivenUrl < RurlError; end
end
