module Exiv2::TagExtractor
  def long_tag(name : String)
    LibGEXIV2.gexiv2_metadata_get_tag_long @metadata, name
  end

  struct Fraction
    getter numerator, denominator

    def initialize(@numerator : Int32, @denominator : Int32)
    end
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

  def string_array_tag_proc : Array(String)
    pointers = yield
    pointers
      .take_while { |p| p.address != 0x51 }
      .take_while { |p| !p.null? }
      .map { |p| String.new p }
  end

  def bool_tag(b : LibC::Int)
    b == 1 ? true : false
  end

  def fraction : Fraction
    nom, den = 0, 0
    nom_p = pointerof(nom)
    den_p = pointerof(den)
    yield nom_p, den_p
    Fraction.new nom_p.value, den_p.value
  end
end
