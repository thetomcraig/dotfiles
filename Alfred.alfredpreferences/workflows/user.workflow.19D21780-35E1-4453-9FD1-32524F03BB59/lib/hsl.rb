# frozen_string_literal: true

require_relative 'rgb'

class HSL
  PATTERN = /^(hsl)?\s?\(?(\d{1,3})(,|-|\s|\|)*(\d{1,3})%(,|-|\s|\|)*(\d{1,3})%\)?$/i.freeze
  attr_reader :hsl

  def initialize(input)
    @hsl_input = input
  end

  def to_hex
    r, g, b = @rgb

    RGB.new("#{r},#{g},#{b}").to_hex
  end

  def to_rgb
    h, s, l = to_hsl
    h /= 360.0
    s /= 100.0
    l /= 100.0

    if s.zero?
      r = g = b = l
    else
      q = l < 0.5 ? l * (1 + s) : l + s - l * s
      p = 2 * l - q
      r = hue_to_rgb(p, q, h + 1 / 3.0)
      g = hue_to_rgb(p, q, h)
      b = hue_to_rgb(p, q, h - 1 / 3.0)
    end

    @rgb = [r, g, b].map { |x| (x * 255).round(0) }

    @rgb
  end

  private

  def to_hsl
    if PATTERN =~ @hsl_input
      hsl = [
        Regexp.last_match(2),
        Regexp.last_match(4),
        Regexp.last_match(6)
      ]
    end

    @hsl = hsl.map(&:to_i)
  end

  def hue_to_rgb(p, q, t)
    t += 1 if t.negative?
    t -= 1 if t > 1
    return p + (q - p) * 6 * t if t < 1 / 6.0
    return q if t < 0.5
    return p + (q - p) * (2 / 3.0 - t) * 6 if t < 2 / 3.0

    p
  end
end
