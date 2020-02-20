require "./spec_helper"

describe Exiv2::Metadata do
  it "works" do
    metadata = Exiv2::Metadata.new "spec/metadata_test.jpg"
    metadata.model.should eq("COOLPIX P6000")
    metadata.gps_longitude.should eq(11.885126666663888)
    metadata.gps_longitude_ref.should eq("E")
    metadata.gps_latitude.should eq(43.46744833333334)
    metadata.gps_latitude_ref.should eq("N")
    metadata.comment.should eq("                               ")
    metadata.date_time.to_s.should eq("2008-11-01 21:15:07 UTC")
    metadata.pixel_height.should eq(480)
    metadata.exif_tag_rational("Exif.Image.Model").denominator.should eq(1)
    metadata.exif_tag_rational("Exif.Image.Model").numerator.should eq(67)
    metadata.exif_tags.includes?("Exif.GPSInfo.GPSAltitudeRef").should eq(true)
    metadata.exif_tags.includes?("Exif.Image.DateTime").should eq(true)
    metadata.exif_tags.includes?("Exif.Iop.InteroperabilityIndex").should eq(true)
    metadata.exif_tags.includes?("Exif.MakerNote.ByteOrder").should eq(true)
    metadata.exif_tags.includes?("Exif.Nikon3.0x000a").should eq(true)
    metadata.exif_tags.includes?("Exif.NikonAf.AFAreaMode").should eq(true)
    metadata.exif_tags.includes?("Exif.Photo.ColorSpace").should eq(true)
    metadata.exif_tags.includes?("Exif.Thumbnail.Compression").should eq(true)
    metadata.exposure_time.denominator.should eq(300)
    metadata.exposure_time.numerator.should eq(4)
    metadata.focal_length.should eq(24.0)
    metadata.fnumber.should eq(5.9_f32)
    metadata.supports_exif.should eq(true)
    metadata.mime_type.should eq("image/jpeg")
    metadata.tag_description("Exif.Image.Model").should eq("The model name or model number of the equipment. This is the model name or number of the DSC, scanner, video digitizer or other equipment that generated the image. When the field is left blank, it is treated as unknown.")
    metadata.close
  end

  expect_raises(Errno,"Error opening file 'spec/not_avairable_file'") do
    metadata = Exiv2::Metadata.new "spec/not_avairable_file"
  end

#  expect_raises(Exception,"Error opening file 'spec/not_avairable_file'") do
it "not work" do
    metadata = Exiv2::Metadata.new "spec/invalid_format.img"
  end
end
