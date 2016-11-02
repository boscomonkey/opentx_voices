#!/usr/bin/env ruby

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

  `mkdir -p #{path}`
  wav_file = "#{path}/#{file}"
  puts wav_file

  system("ffmpeg -i #{aiff_file} -ar 16000 #{wav_file}")
  puts
end
