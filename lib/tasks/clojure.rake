namespace :clojure do
 task :compile do
   @build_path = ["app/clojure"] unless @build_path
   %w(tmp tmp/target tmp/target/classes).each do |d|
     Dir.mkdir(d) unless File.exist?(d) 
   end
   source_files = @build_path.collect do |d|
     Dir.glob("#{d}/**/*.clj").select do |clj_file|
       classfile = 'tmp/target/classes/' + clj_file.sub(".clj", ".class")
       File.exist?(classfile) ? File.stat(clj_file).mtime > File.stat(classfile).mtime : true
     end
   end.flatten
   
   source_file_list = source_files.join ' '
   puts "Source files to compile: #{source_file_list}"
   namespaces = source_files.map do |f|
     f.sub("app/clojure/", "").sub(".clj", "").sub("/", ".")
   end.join ' '
   puts "Clojure namespaces: #{namespaces}"
   cmd = "java -Dclojure.compile.path=./tmp/target/classes -cp ./app/clojure:./tmp/target/classes:lib/clojure.jar clojure.lang.Compile #{namespaces}"
   puts "Compile command: #{cmd}"
   `#{cmd}`
 end

 task :jar => :compile do
   Dir.glob("tmp/target/classes/*").each do |p|
     basename = p.sub('tmp/target/classes/', '')
     puts "Creating jar for path: #{basename}"
     cmd = "jar -cvf lib/#{basename}.jar -C tmp/target/classes #{basename}"
     puts "#{cmd}"
     `#{cmd}`
   end
 end
 
end