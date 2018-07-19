require 'listen'
require 'slop'

opts = Slop.parse do |o|
  o.string '-a', '--aseprite', 'aseprite executable path', required: true
  o.string '-p', '--path', 'path to listen', required: true
  o.string '-t', '--target', 'sprite sheet folder target', required: true
  o.string '-d', '--data', 'json data folder target', required: true
  o.integer '-s', '--scale', 'scale factor', default: 1
  o.integer '-i', '--inner-padding', 'add padding inside each frame', default: 0
  o.string '-o', '--only', 'listen to a specific type of file', default: "\.ase$"
end

listener = Listen.to(opts[:path]) do |modified, added, removed|
  files = modified || added
  files.each do |file|
    if file
      filename = File.basename(file, '.*')
      target = "#{opts[:target]}/#{filename}.png"
      data = "#{opts[:data]}/#{filename}.json"

      puts "Exporting #{file} to SHEET: #{target} | DATA: #{data}"

      command = "#{opts[:aseprite]}"
      command += " -b #{file}"
      command += " --sheet #{target}"
      command += " --data #{data}"
      command += " --scale #{opts[:scale]}"
      command += " --inner-padding #{opts[:inner_padding]}"
      command += " --list-tags"
      command += " --sheet-pack"

      if system(command)
        puts "SUCCESS"
      else
        puts "ERROR"
      end
    end
  end
end

listener.only Regexp.new(opts[:only])
listener.start

sleep
