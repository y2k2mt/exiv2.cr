require "./file_metadata"
require "./tags/*"

module Exiv2
  class Metadata
    include FileMetadata
    include GExiv2Metadata
    include Tags::Image
    include Tags::Gps
  end
end
