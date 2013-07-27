task :haml do
  require 'tilt'
  puts "Generating HTML"
  system "rm -rf _layouts/*"
  Dir.entries("_assets/layouts").each do |file|
    if (match=file.match(/(.*)\.haml$/))
      puts "Parsing #{file}"
      File.open(File.join("_layouts", "#{match[1]}.html"), 'w'){|f| f.write(Tilt.new(File.join("_assets/layouts", file)).render)}
    end
  end
  puts "Done"
end

task :clean do
  system "rm -rf ../_site/*"
end

task :preview => [:haml, :clean] do
  system "jekyll serve --watch"
end

task :build => [:haml, :clean] do
  system "jekyll build"
end
