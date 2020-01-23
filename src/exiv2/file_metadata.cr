require "./tags/*"

module Exiv2
  module FileMetadata
    def initialize(file_path : String)
      if !File.exists?(file_path)
        raise "File #{file_path} not found"
      end
      @metadata = LibGEXIV2.gexiv2_metadata_new
      ne = LibGEXIV2::GError.new
      err = pointerof(ne)
      LibGEXIV2.gexiv2_metadata_open_path @metadata, file_path, pointerof(err)
      if err && (message = err.value.message) && !message.null?
        raise String.new message
      end
    end

    def close
      LibGEXIV2.gexiv2_metadata_free @metadata
    end
  end
end
