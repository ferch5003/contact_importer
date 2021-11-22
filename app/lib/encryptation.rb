module Encryptation
  class << self
    def sha256(base:)
      Digest::SHA256.base64digest(base)
    rescue StandardError
      base
    end
  end
end
