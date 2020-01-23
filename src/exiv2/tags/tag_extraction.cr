module Exiv2::TagExtractor
  def long_tag(name : String)
    LibGEXIV2.gexiv2_metadata_get_tag_long @metadata, name
  end

  def float_tag_proc : Float64?
    f = 0.0_f64
    tag_value = pointerof(f)
    yield tag_value
    if tag_value.null?
      nil
    else
      tag_value.value
    end
  end

  def string_tag(name : String) : String?
    string_tag_proc { LibGEXIV2.gexiv2_metadata_get_tag_string @metadata, name }
  end

  def string_tag_proc : String?
    tag_value = yield
    if tag_value.null?
      nil
    else
      String.new tag_value
    end
  end
end
