module Exiv2::TagExtraction
  def long_tag(name : String)
    LibGEXIV2.gexiv2_metadata_get_tag_long(@metadata, name)
  end

  def string_tag(name : String) : String?
    tag_value = LibGEXIV2.gexiv2_metadata_get_tag_string(@metadata, name)
    if tag_value.null?
      nil
    else
      String.new tag_value
    end
  end

  def raw_tag(name : String)
    LibGEXIV2.gexiv2_metadata_get_tag_raw(@metadata, name)
  end
end
