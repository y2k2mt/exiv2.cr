require "./tag_extraction"

module Exiv2::Tags
  module Gps
    include TagExtraction

    enum AltitudeRef
      Above
      Below
    end

    def latitude
      d = Pointer.malloc(0, 0.0)
      LibGEXIV2.gexiv2_metadata_get_gps_latitude(@metadata, d)
      d.value
    end

    def longitude
      d = Pointer.malloc(0, 0.0)
      LibGEXIV2.gexiv2_metadata_get_gps_longitude(@metadata, d)
      d.value
    end

    def altitude
      d = Pointer.malloc(0, 0.0)
      LibGEXIV2.gexiv2_metadata_get_gps_altitude(@metadata, d)
      d.value
    end

    def latitude_ref
      string_tag "Exif.GPSInfo.GPSLatitudeRef"
    end

    def longitude_ref
      string_tag "Exif.GPSInfo.GPSLongitudeRef"
    end

    def altitude_ref
      altitude_ref = string_tag "Exif.GPSInfo.GPSAltitudeRef"
      if altitude_ref == "1"
        AltitudeRef::Below
      else
        AltitudeRef::Above
      end
    end
  end
end
