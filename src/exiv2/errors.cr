require "../libgexiv2/gexiv2"

module Exiv2
  class Error < Exception
    getter domain, code

    def initialize(source : LibGEXIV2::GError,
                   @domain : UInt32 = source.domain,
                   @code : Int32 = source.code)
      super(String.new source.message)
    end
  end
end
