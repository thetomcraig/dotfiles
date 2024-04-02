# frozen_string_literal: true

require 'json'
require 'chunky_png'

require_relative 'lib/hex'
require_relative 'lib/rgb'
require_relative 'lib/hsl'
require_relative 'lib/keywords'

arg = ARGV[0]

if KEYWORDS.key?(arg.to_sym)
  origin = HEX.new(KEYWORDS[arg.to_sym])
  hex = "##{origin.hex}"
  rgb = origin.to_rgb
  hsl = origin.to_hsl
elsif HEX::PATTERN =~ arg || HEX::SHORT_PATTERN =~ arg
  origin = HEX.new(arg)
  hex = origin.hex[0] == '#' ? origin.hex : "##{origin.hex}"
  rgb = origin.to_rgb
  hsl = origin.to_hsl
elsif RGB::PATTERN =~ arg
  origin = RGB.new(arg)
  hex = origin.to_hex
  rgb = origin.rgb
  hsl = origin.hsl
elsif HSL::PATTERN =~ arg
  origin = HSL.new(arg)
  rgb = origin.to_rgb
  hsl = origin.hsl
  hex = origin.to_hex
end

png = ChunkyPNG::Image.new(256, 256, ChunkyPNG::Color.rgb(rgb[0], rgb[1], rgb[2]))
iconname = "icons/#{rgb[0]}-#{rgb[1]}-#{rgb[2]}.png"
png.save(iconname)

hex_title = hex
rgb_title = "rgb(#{rgb[0]}, #{rgb[1]}, #{rgb[2]})"
hsl_title = "hsl(#{hsl[0]}, #{hsl[1]}%, #{hsl[2]}%)"

results = { items: [
  {
    title: hex_title,
    subtitle: 'HEX',
    arg: hex_title,
    icon: {
      path: iconname
    }
  },
  {
    title: rgb_title,
    subtitle: 'RGB',
    arg: rgb_title,
    icon: {
      path: iconname
    }
  },
  {
    title: hsl_title,
    subtitle: 'HSL',
    arg: hsl_title,
    icon: {
      path: iconname
    }
  }
] }

puts JSON.generate(results)
