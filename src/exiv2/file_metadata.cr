require "./tags/*"

module Exiv2
  module FileMetadata
    def initialize(file_path : String)
      @metadata = LibGEXIV2.gexiv2_metadata_new
      error = Pointer(LibGEXIV2::GError).null
      result = LibGEXIV2.gexiv2_metadata_open_path @metadata, file_path, pointerof(error)
      if result == 0
        self.close
        if !error.null?
          raise Exiv2::Error.new error.value
        else
          raise Exception.new "Unknown error: '#{file_path}'"
        end
      end
    end

    def close
      LibGEXIV2.gexiv2_metadata_free @metadata
    end
  end
end
