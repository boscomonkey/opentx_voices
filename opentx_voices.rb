#!/usr/bin/env ruby

# Quick & dirty script to generate voice tracks for OpenTX voice
# tracks on a Macintosh. Requires ffmpeg to be installed, and that can
# be easily accomplished via Homebrew.

require 'csv'
require 'fileutils'

# each semicolon separated file should be named on the command line
if ARGV.length == 0
  STDERR.puts <<EOF

Usage: #{$0} SSVFILE0 [SSVFILE1 ... [SSVFILEn]]

Script to generate voice tracks for OpenTX voice tracks on a
Macintosh.

Name each semicolon-separated file on the command line. If there are
output .WAV filename collisions, later CSV files on the command line
override earlier ones.

Requires ffmpeg to be installed (can be accomplished via Homebrew).

EOF
  exit -1
end

# grab voice from environment variable VOICE
voice_personality = ENV['VOICE']
voice_arg = voice_personality.nil? ? "" : "-v #{voice_personality}"
if voice_personality.nil?
  system("default voice")
else
  system("say #{voice_arg} Using voice personality: #{voice_personality}") or exit 1
end

# For each semi-colon separated file, cycle through each line of the
# CSV using semi-colon as the column separator
ARGV.each do |csv_fname|
  csv = CSV.open(csv_fname, col_sep:';')
  csv.each do |path, file, phrase|
    next if path.nil? || file.nil? || phrase.nil?
    puts phrase

    output_path = "output/#{voice_personality}/#{path}"
    FileUtils.mkpath(output_path) unless Dir.exists?(output_path)

    wav_file = "#{output_path}/#{file}"
    system("say #{voice_arg} -o #{wav_file} --data-format=LEI16@32000 #{phrase}")
    puts wav_file

    puts
  end
end
