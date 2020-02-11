require "./tags/tag_extraction"

module Exiv2
  module GExiv2Metadata
    include TagExtractor

    def comment : String?
      string_tag_proc { LibGEXIV2.gexiv2_metadata_get_comment @metadata }
    end

    def exif_tag_rational(name : String) : Fraction
      fraction { |nom, den| LibGEXIV2.gexiv2_metadata_get_exif_tag_rational @metadata, name, nom, den }
    end

    def exif_tags
      string_array_tag_proc { Slice(Pointer(UInt8)).new LibGEXIV2.gexiv2_metadata_get_exif_tags(@metadata), 512 }
    end

    def exposure_time : Fraction
      fraction { |nom, den| LibGEXIV2.gexiv2_metadata_get_exposure_time @metadata, nom, den }
    end

    def fnumber
      LibGEXIV2.gexiv2_metadata_get_fnumber(@metadata).to_f32
    end

    def focal_length
      LibGEXIV2.gexiv2_metadata_get_focal_length(@metadata).to_f32
    end

    def gps_latitude
      float_tag_proc { |f| LibGEXIV2.gexiv2_metadata_get_gps_latitude @metadata, f }
    end

    def gps_longitude
      float_tag_proc { |f| LibGEXIV2.gexiv2_metadata_get_gps_longitude @metadata, f }
    end

    def gps_altitude
      float_tag_proc { |f| LibGEXIV2.gexiv2_metadata_get_gps_altitude @metadata, f }
    end

    def ipct_tags
      string_array_tag_proc { Slice(Pointer(UInt8)).new LibGEXIV2.gexiv2_metadata_get_iptc_tags(@metadata), 512 }
    end

    def iso_speed : Int32
      LibGEXIV2.gexiv2_metadata_get_iso_speed @metadata
    end

    def pixel_height : Int32
      LibGEXIV2.gexiv2_metadata_get_pixel_height @metadata
    end

    def pixel_width : Int32
      LibGEXIV2.gexiv2_metadata_get_pixel_width @metadata
    end

    def mime_type : String?
      string_tag_proc { LibGEXIV2.gexiv2_metadata_get_mime_type @metadata }
    end

    def supports_exif : Bool
      bool_tag LibGEXIV2.gexiv2_metadata_get_supports_exif @metadata
    end

    def supports_iptc : Bool
      bool_tag LibGEXIV2.gexiv2_metadata_get_supports_tptc @metadata
    end

    def supports_xmp : Bool
      bool_tag LibGEXIV2.gexiv2_metadata_get_supports_xmp @metadata
    end

    def tag_description(tag_name : String) : String?
      string_tag_proc { LibGEXIV2.gexiv2_metadata_get_tag_description tag_name }
    end
  end
end
