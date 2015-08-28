=begin

Create a command line interface tool to setup up a cpp project and add/create/remove class files in makefile and project with default constructors and destructors.
Be able to add/remove libraries to makefile. Be able to build project and run it.
Be able to add fields when creating class files which will also create getters and setters for them.

=end

$libs = Array.new
$files = Array.new
$std_cpp = "-std=c++11"
$comp = "clang++"

def initial_argument arg
	case arg
	when "init"
		if ARGV.count > 1 then
			create_project ARGV[1]
		else
			puts "Must supply a project name as argument."
		end
	when "create_class"
		if ARGV.count > 1 then
			create_class ARGV[1]
		else
			puts "Must supply a class name as argument."
		end

	when "help"
		show_help
	else
		show_help
	end
end

def show_help

	puts "-------------------------------"
	puts ""
	puts "Usage: ruby cpproj.rb [command] [argument]"
	puts ""
	puts "commands:"
	puts "	init		initialize a cpp project. Argument passed: name of project."
	puts "			Creates project, build, and src folders. Inside project "
	puts "			folder a Makefile. Inside src folder a Main.cpp file."
	puts ""
	puts "	create_class	Argument passed: name of class. Creates a .cpp and .h file"
	puts "			with defualt constructor and destructor setup for you. Adds"
	puts "			file to Makefile as well."
	puts ""
	puts "	help		Shows this menu."
	puts ""
	puts "-------------------------------"
end

def create_project name
	puts "creating project..."
	if !File.directory?("./"+name) then
		Dir.mkdir name, 0700
		$files<<"Main"
		create_makefile name
		puts "#{name}/src"
		Dir.mkdir "#{name}/src", 0700
		puts "#{name}/build"
		Dir.mkdir "#{name}/build", 0700
		puts "#{name}/src/Main.cpp"
		File.write "#{name}/src/Main.cpp", "#include <iostream>\nusing namespace std;\n\nint main(int argc, const char* argv[]) {\n\tcout<<\"Hello World!\"<<endl;\n\treturn 0;\n}" 
		puts "Done!"
	else
		puts "#{name} directory already exists"
	end
end

def create_makefile name
	str = "CC=clang++
	CFLAGS=-Wall -c
	TARGET=#{name}
	OBJECTS="
	tmp = ""
	$files.each do |f|
		tmp = tmp + f + ".o "
	end
	str = str + tmp + "\n"
	if $libs.count > 0 then
		str = str + "\nLIBS="
		tmp = ""
		$libs.each do |l|
			tmp = tmp + l + " "
		end
		str = str + tmp + "\n"
	end
	str = str + "all: $(TARGET)
	$(TARGET): $(OBJECTS)
		$(CC) #{$std_cpp} $(OBJECTS) -o $(TARGET)
	"
	$files.each do |f|
	str = str + "#{f}.o: #{f}.cpp
		$(CC) $(CFLAGS) #{$std_cpp} #{f}.cpp\n"
	end
	str = str + "clean: 
		rm -Rf *.o $(TARGET)
	"
	
	File.write "#{name}/Makefile", str
	puts "#{name}/Makefile"
end


def create_class name

	if File.exist?("Makefile") && File.directory?("./src") then

	else
		puts "src directory is not in immediate directory. Move to top directory in project or create a project if you have not yet."
		show_help
	end

end

if ARGV.count > 0 then
	initial_argument ARGV[0]
else
show_help
end
