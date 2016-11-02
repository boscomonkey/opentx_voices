#!/usr/bin/env ruby

# Quick & dirty script to generate voice tracks for OpenTX voice
# tracks on a Macintosh. Requires ffmpeg to be installed, and that can
# be easily accomplished via Homebrew.

require 'csv'

# output temporary text-to-speech AIFF files
aiff_topdir = '/tmp/taranis_voices'
`mkdir -p #{aiff_topdir}`

# grab the CSV filename from first command line arg
csv_fname = ARGV[0]

# grab voice from environment variable VOICE
voice_personality = ENV['VOICE']
voice_arg = voice_personality.nil? ? "" : "-v #{voice_personality}"
unless voice_personality.nil?
  system("say #{voice_arg} Using voice personality: #{voice_personality}") or exit 1
end

# cycle through each line of the CSV using semi-colon as the column separator
csv = CSV.open(csv_fname, col_sep:';')
csv.each do |path, file, phrase|
  next if path.nil? || file.nil? || phrase.nil?
  puts phrase

  aiff_dir = "#{aiff_topdir}/#{path}"
  `mkdir -p #{aiff_dir}`

  aiff_file = "#{aiff_dir}/#{file}.aiff"
  system("say #{voice_arg} -o #{aiff_file} #{phrase}")
  puts aiff_file

  output_path = "output/#{voice_personality}/#{path}"
  `mkdir -p #{output_path}`
  wav_file = "#{output_path}/#{file}"
  puts wav_file

  system("ffmpeg -y -i #{aiff_file} -ar 16000 #{wav_file}")
  puts
end
