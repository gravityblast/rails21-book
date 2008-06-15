desc 'Raggruppa tutti i file (.textile) in un unico file'

task :merge do
  File.open('output/full_book.texttile', 'w+') do |f|
    Dir["text/**/*.markdown"].sort.each do |path|
      f << File.new(path).read + "\r\n"
    end
  end
end
