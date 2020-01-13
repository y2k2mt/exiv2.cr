class Exiv2::Metadata
  def initialize(file_path : String)
    @metadata = LibGEXIV2.gexiv2_metadata_new
    err = Pointer.malloc(0, LibGEXIV2::GError.new)
    LibGEXIV2.gexiv2_metadata_open_path(@metadata, file_path, pointerof(err))
    # if err
    #  raise err.to_s
    # end
  end

  def model
    string_tag "Exif.Image.Model"
  end

  def date_time
    Time.parse(string_tag("Exif.Image.DateTime"), "%Y:%m:%d %H:%M:%S",Time::Location::UTC)
  end

  def gps_latitude
    d = Pointer.malloc(0, 0.0)
    LibGEXIV2.gexiv2_metadata_get_gps_latitude(@metadata, d)
    d.value
  end

  def gps_latitude_ref
    string_tag "Exif.GPSInfo.GPSLatitudeRef"
  end

  private def long_tag(name : String)
    LibGEXIV2.gexiv2_metadata_get_tag_long(@metadata, name)
  end

  private def string_tag(name : String)
    String.new LibGEXIV2.gexiv2_metadata_get_tag_string(@metadata, name)
  end

  private def raw_tag(name : String)
    LibGEXIV2.gexiv2_metadata_get_tag_raw(@metadata, name)
  end

  def close
    LibGEXIV2.gexiv2_metadata_free(@metadata)
    LibGEXIV2.gexiv2_image_free(@metadata)
  end
end
