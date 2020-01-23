require "./tags/tag_extraction"

module Exiv2
  module GExiv2Metadata
    include TagExtractor

    struct Fraction
      getter numerator, denominator

      def initialize(@numerator : Int32, @denominator : Int32)
      end
    end

    def comment : String?
      string_tag_proc { LibGEXIV2.gexiv2_metadata_get_comment @metadata }
    end

    def exif_tag_rational(name : String) : Fraction
      nom, den = 0, 0
      nom_p = pointerof(nom)
      den_p = pointerof(den)
      LibGEXIV2.gexiv2_metadata_get_exif_tag_rational @metadata, name, nom_p, den_p
      Fraction.new nom_p.value, den_p.value
    end

    # FIXME
    #    def exif_tags
    #      s = Slice(UInt8).new LibGEXIV2.gexiv2_metadata_get_exif_tags(@metadata).value, 8192
    #      ss = String.new s.reject { |u| u == 0 }.to_unsafe
    #      ss.split('!').reduce([] of String) { |memo, s| memo += s.split('1') }
    #    end

    def exposure_time : Fraction
      nom, den = 0, 0
      nom_p = pointerof(nom)
      den_p = pointerof(den)
      LibGEXIV2.gexiv2_metadata_get_exposure_time @metadata, nom_p, den_p
      Fraction.new nom_p.value, den_p.value
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

    def iso_speed : Int32
      LibGEXIV2.gexiv2_metadata_get_iso_speed @metadata
    end

    def pixel_height : Int32
      LibGEXIV2.gexiv2_metadata_get_pixel_height @metadata
    end

    def pixel_width : Int32
      LibGEXIV2.gexiv2_metadata_get_pixel_width @metadata
    end
  end
end
