require "./tags/*"

module Exiv2
  class Metadata
    include Tags::Image
    include Tags::Gps

    def initialize(file_path : String)
      @metadata = LibGEXIV2.gexiv2_metadata_new
      err = Pointer.malloc(0, LibGEXIV2::GError.new)
      LibGEXIV2.gexiv2_metadata_open_path(@metadata, file_path, pointerof(err))
      if err && (message = err.value.message) && !message.null?
        raise String.new message
      end
    end

    def close
      LibGEXIV2.gexiv2_metadata_free(@metadata)
    end
  end
end
