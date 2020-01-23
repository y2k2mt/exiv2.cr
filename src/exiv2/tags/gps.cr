require "./tag_extraction"

module Exiv2::Tags
  module Gps
    include TagExtractor

    enum AltitudeRef
      Above
      Below
    end

    def gps_latitude_ref
      string_tag "Exif.GPSInfo.GPSLatitudeRef"
    end

    def gps_longitude_ref
      string_tag "Exif.GPSInfo.GPSLongitudeRef"
    end

    def gps_altitude_ref
      altitude_ref = string_tag "Exif.GPSInfo.GPSAltitudeRef"
      if altitude_ref == "1"
        AltitudeRef::Below
      else
        AltitudeRef::Above
      end
    end
  end
end
