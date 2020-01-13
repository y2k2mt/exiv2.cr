# exiv2.cr

Crystal binding to [libgexiv2](https://wiki.gnome.org/Projects/gexiv2)

Extracting EXIF,IPTC and XMP metadata in photo and video files.

## Installation

1. Install `libgexiv2`:

   ```shell
   $ sudo apt install libgexiv2-dev
   ```

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     exiv2.cr:
       github: y2k2mt/exiv2.cr
   ```

1. Run `shards install`

## Usage

```crystal
require "exiv2.cr"
```

TODO: Write usage instructions here

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/your-github-user/exiv2.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [y2k2mt](https://github.com/your-github-user) - creator and maintainer
