require "./tag_extraction"

module Exiv2::Tags
  module Image
    include TagExtraction

    def model : String?
      string_tag("Exif.Image.Model")
    end

    def date_time : Time
      Time.parse(string_tag("Exif.Image.DateTime"), "%Y:%m:%d %H:%M:%S", Time::Location::UTC)
    end
  end
end
