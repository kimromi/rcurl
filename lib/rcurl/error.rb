module Rcurl
  class RcurlError < StandardError; end

  class ConfigFileNotFound < RcurlError; end
  class ConfigNotSupportExtention < RcurlError; end
  class InvalidConfig < RcurlError; end

  class NotSupportedMethod < RcurlError; end
  class NotGivenUrl < RcurlError; end
end
