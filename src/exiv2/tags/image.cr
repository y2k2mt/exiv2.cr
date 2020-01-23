require "./tag_extraction"

module Exiv2::Tags
  module Image
    include TagExtractor

    def model : String?
      string_tag "Exif.Image.Model"
    end

    def date_time : Time?
      string_tag("Exif.Image.DateTime").try { |d| Time.parse d, "%Y:%m:%d %H:%M:%S", Time::Location::UTC }
    end
  end
end
