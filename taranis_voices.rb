#!/usr/bin/env ruby

# Quick & dirty script to generate voice tracks for OpenTX voice
# tracks on a Macintosh. Requires ffmpeg to be installed, and that can
# be easily accomplished via Homebrew.

require 'csv'

aiff_topdir = '/tmp/taranis_voices'
`mkdir -p #{aiff_topdir}`

fname = ARGV[0]
csv = CSV.open(fname, col_sep:';')
csv.each do |path, file, phrase|
  puts phrase

  aiff_dir = "#{aiff_topdir}/#{path}"
  `mkdir -p #{aiff_dir}`

  aiff_file = "#{aiff_dir}/#{file}.aiff"
  system("say -o #{aiff_file} #{phrase}")
  puts aiff_file

  output_path = "output/#{path}"
  `mkdir -p #{output_path}`
  wav_file = "#{output_path}/#{file}"
  puts wav_file

  system("ffmpeg -y -i #{aiff_file} -ar 16000 #{wav_file}")
  puts
end
