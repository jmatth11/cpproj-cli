# cpproj-cli
A small c++ cli tool for project management.

# Current Abilities

- Create a C++ project. Includes: src folder, build folder, Makefile, Main.cpp
- Generate new class files. Updates Makefile to include new files.
- Remove class files. Updates Makefile to not include removed files.
- Build project to generate an executable. 
- Run command will build and run the project.

# Planned Abilities 

- Adding data members to class with specified type.
- Generate setters and getters for data members in class

# Setup global use

To setup this file for global use create a directory called cpproj in a place that won't get changed.
Place the cpproj.rb script in the cpproj directory.
Go to the file that holds your paths (on Mac it would be .bash_profile) and add this line: "alias cpproj='ruby /pathToDirectory/cpproj/cpproj.rb' "
And thats it! You will be set to use this globally throughout your system.

# Usage

*If you haven't setup this file globally then you will have to call on the script like so: `ruby /path/to/cpproj.rb`

- Initialize a project <br/>
`cpproj init my_project`<br/>
This will create a folder called my_project. Directly inside the is a Makefile and build and src folders. Inside src folder there is a Main.cpp file.

- Create a class<br/>
`cpproj create_class ClassName`<br/>
This will generate simple .cpp and .hpp files within the src folder with defualt constructor and destructor created for you. This will also update the Makefile to include the new class in compilation.

- Remove a class<br/>
`cpproj remove_class ClassName`<br/>
This will remove the class specified from the project and Makefile.

- Build project<br/>
`cpproj build`<br/>
This will clean out previous executable and object files and only build project.

- Run project<br/>
`cpproj run`<br/>
This will execute build command and then run the exectuable afterwards.

- Help<br/>
`cpproj help`<br/>
If you need to have a reminder of all of the commands this will list them and give a brief description of it's functionality.


