require "./tags/*"

module Exiv2
  module FileMetadata
    def initialize(file_path : String)
      if !File.exists?(file_path)
        raise Errno.new("Error opening file '#{file_path}'")
      end
      @metadata = LibGEXIV2.gexiv2_metadata_new
      error = nil
      result = LibGEXIV2.gexiv2_metadata_open_path @metadata, file_path, error
      case result
      when 0
        self.close
        raise Exception.new "Failed to load image metadata for '#{file_path}'"
      else
        if error && (message = error.value.message) && !message.null?
          self.close
          raise Exception.new String.new message
        end
      end
    end

    def close
      LibGEXIV2.gexiv2_metadata_free @metadata
    end
  end
end
