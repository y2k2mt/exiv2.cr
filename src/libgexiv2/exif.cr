@[Link(ldflags: "`command -v pkg-config > /dev/null && pkg-config --libs gexiv2 2> /dev/null|| printf %s`")]
lib LibGEXIV2
  alias GQuark = Guint32
  alias GType = Gsize
  alias Gboolean = Gint
  alias Gchar = LibC::Char
  alias Gdouble = LibC::Double
  alias Gint = LibC::Int
  alias Gint32 = LibC::Int
  alias Gint64 = LibC::Long
  alias Glong = LibC::Long
  alias Gsize = LibC::ULong
  alias Guint = LibC::UInt
  alias Guint32 = LibC::UInt
  alias Guint8 = UInt8
  alias StreamCanRead = (Void* -> Gboolean)
  alias StreamCanSeek = (Void* -> Gboolean)
  alias StreamCanWrite = (Void* -> Gboolean)
  alias StreamFlush = (Void* -> Void)
  alias StreamLength = (Void* -> Gint64)
  alias StreamPosition = (Void* -> Gint64)
  alias StreamRead = (Void*, Void*, Gint32, Gint32 -> Gint32)
  alias StreamSeek = (Void*, Gint64, WrapperSeekOrigin -> Void)
  alias StreamWrite = (Void*, Void*, Gint32, Gint32 -> Void)
  enum GExiv2Orientation
    Gexiv2OrientationMin         = 0
    Gexiv2OrientationUnspecified = 0
    Gexiv2OrientationNormal      = 1
    Gexiv2OrientationHflip       = 2
    Gexiv2OrientationRot180      = 3
    Gexiv2OrientationVflip       = 4
    Gexiv2OrientationRot90Hflip  = 5
    Gexiv2OrientationRot90       = 6
    Gexiv2OrientationRot90Vflip  = 7
    Gexiv2OrientationRot270      = 8
    Gexiv2OrientationMax         = 8
  end
  enum GExiv2StructureType
    Gexiv2StructureXaNone =  0
    Gexiv2StructureXaAlt  = 20
    Gexiv2StructureXaBag  = 21
    Gexiv2StructureXaSeq  = 22
    Gexiv2StructureXaLang = 23
  end
  enum GExiv2XmpFormatFlags
    Gexiv2OmitPacketWrapper   =   16
    Gexiv2ReadOnlyPacket      =   32
    Gexiv2UseCompactFormat    =   64
    Gexiv2IncludeThumbnailPad =  256
    Gexiv2ExactPacketLength   =  512
    Gexiv2WriteAliasComments  = 1024
    Gexiv2OmitAllFormatting   = 2048
  end
  enum WrapperSeekOrigin
    Begin   = 0
    Current = 1
    End     = 2
  end
  fun gexiv2_metadata_clear(self : GExiv2Metadata*)
  fun gexiv2_metadata_clear_comment(self : GExiv2Metadata*)
  fun gexiv2_metadata_clear_exif(self : GExiv2Metadata*)
  fun gexiv2_metadata_clear_iptc(self : GExiv2Metadata*)
  fun gexiv2_metadata_clear_tag(self : GExiv2Metadata*, tag : Gchar*) : Gboolean
  fun gexiv2_metadata_clear_xmp(self : GExiv2Metadata*)
  fun gexiv2_metadata_delete_gps_info(self : GExiv2Metadata*)
  fun gexiv2_metadata_erase_exif_thumbnail(self : GExiv2Metadata*)
  fun gexiv2_metadata_free(self : GExiv2Metadata*)
  fun gexiv2_metadata_from_app1_segment(self : GExiv2Metadata*, data : Guint8*, n_data : Glong, error : GError**) : Gboolean
  fun gexiv2_metadata_generate_xmp_packet(self : GExiv2Metadata*, xmp_format_flags : GExiv2XmpFormatFlags, padding : Guint32) : Gchar*
  fun gexiv2_metadata_get_comment(self : GExiv2Metadata*) : Gchar*
  fun gexiv2_metadata_get_exif_tag_rational(self : GExiv2Metadata*, tag : Gchar*, nom : Gint*, den : Gint*) : Gboolean
  fun gexiv2_metadata_get_exif_tags(self : GExiv2Metadata*) : Gchar**
  fun gexiv2_metadata_get_exif_thumbnail(self : GExiv2Metadata*, buffer : Guint8**, size : Gint*) : Gboolean
  fun gexiv2_metadata_get_exposure_time(self : GExiv2Metadata*, nom : Gint*, den : Gint*) : Gboolean
  fun gexiv2_metadata_get_fnumber(self : GExiv2Metadata*) : Gdouble
  fun gexiv2_metadata_get_focal_length(self : GExiv2Metadata*) : Gdouble
  fun gexiv2_metadata_get_gps_altitude(self : GExiv2Metadata*, altitude : Gdouble*) : Gboolean
  fun gexiv2_metadata_get_gps_info(self : GExiv2Metadata*, longitude : Gdouble*, latitude : Gdouble*, altitude : Gdouble*) : Gboolean
  fun gexiv2_metadata_get_gps_latitude(self : GExiv2Metadata*, latitude : Gdouble*) : Gboolean
  fun gexiv2_metadata_get_gps_longitude(self : GExiv2Metadata*, longitude : Gdouble*) : Gboolean
  fun gexiv2_metadata_get_iptc_tags(self : GExiv2Metadata*) : Gchar**
  fun gexiv2_metadata_get_iso_speed(self : GExiv2Metadata*) : Gint
  fun gexiv2_metadata_get_metadata_pixel_height(self : GExiv2Metadata*) : Gint
  fun gexiv2_metadata_get_metadata_pixel_width(self : GExiv2Metadata*) : Gint
  fun gexiv2_metadata_get_mime_type(self : GExiv2Metadata*) : Gchar*
  fun gexiv2_metadata_get_orientation(self : GExiv2Metadata*) : GExiv2Orientation
  fun gexiv2_metadata_get_pixel_height(self : GExiv2Metadata*) : Gint
  fun gexiv2_metadata_get_pixel_width(self : GExiv2Metadata*) : Gint
  fun gexiv2_metadata_get_preview_image(self : GExiv2Metadata*, props : GExiv2PreviewProperties*) : GExiv2PreviewImage*
  fun gexiv2_metadata_get_preview_properties(self : GExiv2Metadata*) : GExiv2PreviewProperties**
  fun gexiv2_metadata_get_supports_exif(self : GExiv2Metadata*) : Gboolean
  fun gexiv2_metadata_get_supports_iptc(self : GExiv2Metadata*) : Gboolean
  fun gexiv2_metadata_get_supports_xmp(self : GExiv2Metadata*) : Gboolean
  fun gexiv2_metadata_get_tag_description(tag : Gchar*) : Gchar*
  fun gexiv2_metadata_get_tag_interpreted_string(self : GExiv2Metadata*, tag : Gchar*) : Gchar*
  fun gexiv2_metadata_get_tag_label(tag : Gchar*) : Gchar*
  fun gexiv2_metadata_get_tag_long(self : GExiv2Metadata*, tag : Gchar*) : Glong
  fun gexiv2_metadata_get_tag_multiple(self : GExiv2Metadata*, tag : Gchar*) : Gchar**
  fun gexiv2_metadata_get_tag_raw(self : GExiv2Metadata*, tag : Gchar*) : GBytes
  fun gexiv2_metadata_get_tag_string(self : GExiv2Metadata*, tag : Gchar*) : Gchar*
  fun gexiv2_metadata_get_tag_type(tag : Gchar*) : Gchar*
  fun gexiv2_metadata_get_type : GType
  fun gexiv2_metadata_get_xmp_packet(self : GExiv2Metadata*) : Gchar*
  fun gexiv2_metadata_get_xmp_tags(self : GExiv2Metadata*) : Gchar**
  fun gexiv2_metadata_has_exif(self : GExiv2Metadata*) : Gboolean
  fun gexiv2_metadata_has_iptc(self : GExiv2Metadata*) : Gboolean
  fun gexiv2_metadata_has_tag(self : GExiv2Metadata*, tag : Gchar*) : Gboolean
  fun gexiv2_metadata_has_xmp(self : GExiv2Metadata*) : Gboolean
  fun gexiv2_metadata_is_exif_tag(tag : Gchar*) : Gboolean
  fun gexiv2_metadata_is_iptc_tag(tag : Gchar*) : Gboolean
  fun gexiv2_metadata_is_xmp_tag(tag : Gchar*) : Gboolean
  fun gexiv2_metadata_new : GExiv2Metadata*
  fun gexiv2_metadata_open_buf(self : GExiv2Metadata*, data : Guint8*, n_data : Glong, error : GError**) : Gboolean
  fun gexiv2_metadata_open_path(self : GExiv2Metadata*, path : Gchar*, error : GError**) : Gboolean
  fun gexiv2_metadata_open_stream(self : GExiv2Metadata*, cb : ManagedStreamCallbacks*, error : GError**) : Gboolean
  fun gexiv2_metadata_register_xmp_namespace(name : Gchar*, prefix : Gchar*) : Gboolean
  fun gexiv2_metadata_save_external(self : GExiv2Metadata*, path : Gchar*, error : GError**) : Gboolean
  fun gexiv2_metadata_save_file(self : GExiv2Metadata*, path : Gchar*, error : GError**) : Gboolean
  fun gexiv2_metadata_save_stream(self : GExiv2Metadata*, cb : ManagedStreamCallbacks*, error : GError**) : Gboolean
  fun gexiv2_metadata_set_comment(self : GExiv2Metadata*, comment : Gchar*)
  fun gexiv2_metadata_set_exif_tag_rational(self : GExiv2Metadata*, tag : Gchar*, nom : Gint, den : Gint) : Gboolean
  fun gexiv2_metadata_set_exif_thumbnail_from_buffer(self : GExiv2Metadata*, buffer : Guint8*, size : Gint)
  fun gexiv2_metadata_set_exif_thumbnail_from_file(self : GExiv2Metadata*, path : Gchar*, error : GError**) : Gboolean
  fun gexiv2_metadata_set_gps_info(self : GExiv2Metadata*, longitude : Gdouble, latitude : Gdouble, altitude : Gdouble) : Gboolean
  fun gexiv2_metadata_set_metadata_pixel_height(self : GExiv2Metadata*, height : Gint)
  fun gexiv2_metadata_set_metadata_pixel_width(self : GExiv2Metadata*, width : Gint)
  fun gexiv2_metadata_set_orientation(self : GExiv2Metadata*, orientation : GExiv2Orientation)
  fun gexiv2_metadata_set_tag_long(self : GExiv2Metadata*, tag : Gchar*, value : Glong) : Gboolean
  fun gexiv2_metadata_set_tag_multiple(self : GExiv2Metadata*, tag : Gchar*, values : Gchar**) : Gboolean
  fun gexiv2_metadata_set_tag_string(self : GExiv2Metadata*, tag : Gchar*, value : Gchar*) : Gboolean
  fun gexiv2_metadata_set_xmp_tag_struct(self : GExiv2Metadata*, tag : Gchar*, type : GExiv2StructureType) : Gboolean
  fun gexiv2_metadata_unregister_all_xmp_namespaces
  fun gexiv2_metadata_unregister_xmp_namespace(name : Gchar*) : Gboolean
  fun gexiv2_preview_image_free(self : GExiv2PreviewImage*)
  fun gexiv2_preview_image_get_data(self : GExiv2PreviewImage*, size : Guint32*) : Guint8*
  fun gexiv2_preview_image_get_extension(self : GExiv2PreviewImage*) : Gchar*
  fun gexiv2_preview_image_get_height(self : GExiv2PreviewImage*) : Guint32
  fun gexiv2_preview_image_get_mime_type(self : GExiv2PreviewImage*) : Gchar*
  fun gexiv2_preview_image_get_type : GType
  fun gexiv2_preview_image_get_width(self : GExiv2PreviewImage*) : Guint32
  fun gexiv2_preview_image_write_file(self : GExiv2PreviewImage*, path : Gchar*) : Glong
  fun gexiv2_preview_properties_get_extension(self : GExiv2PreviewProperties*) : Gchar*
  fun gexiv2_preview_properties_get_height(self : GExiv2PreviewProperties*) : Guint32
  fun gexiv2_preview_properties_get_mime_type(self : GExiv2PreviewProperties*) : Gchar*
  fun gexiv2_preview_properties_get_size(self : GExiv2PreviewProperties*) : Guint32
  fun gexiv2_preview_properties_get_type : GType
  fun gexiv2_preview_properties_get_width(self : GExiv2PreviewProperties*) : Guint32

  struct GError
    domain : GQuark
    code : Gint
    message : Gchar*
  end

  struct GExiv2Metadata
    parent_instance : GObject
    priv : GExiv2MetadataPrivate
  end

  struct GExiv2PreviewImage
    parent_instance : GObject
    priv : GExiv2PreviewImagePrivate
  end

  struct GExiv2PreviewProperties
    parent_instance : GObject
    priv : GExiv2PreviewPropertiesPrivate
  end

  struct GObject
    g_type_instance : GTypeInstance
    ref_count : Guint
    qdata : GData
  end

  struct GTypeClass
    g_type : GType
  end

  struct GTypeInstance
    g_class : GTypeClass*
  end

  struct ManagedStreamCallbacks
    handle : Void*
    can_seek : StreamCanSeek
    can_read : StreamCanRead
    can_write : StreamCanWrite
    length : StreamLength
    position : StreamPosition
    read : StreamRead
    write : StreamWrite
    seek : StreamSeek
    flush : StreamFlush
  end

  # FIXME:Converted Type aliases from typedefs are not worked.
  type GBytes = Void*
  type GData = Void*
  # type GError = X_GError
  # type GExiv2Metadata = X_GExiv2Metadata
  type GExiv2MetadataPrivate = Void*
  # type GExiv2PreviewImage = X_GExiv2PreviewImage
  type GExiv2PreviewImagePrivate = Void*
  # type GExiv2PreviewProperties = X_GExiv2PreviewProperties
  type GExiv2PreviewPropertiesPrivate = Void*
  # type GObject = X_GObject
  # type GTypeClass = X_GTypeClass
  # type GTypeInstance = X_GTypeInstance
  # type ManagedStreamCallbacks = X_ManagedStreamCallbacks
end
