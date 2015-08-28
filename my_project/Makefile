CC=clang++
CFLAGS=-Wall -c
TARGET=my_project
OBJECTS=Main.o 
all: $(TARGET)
$(TARGET): $(OBJECTS)
	$(CC) -std=c++11 $(OBJECTS) -o $(TARGET)
Main.o: Main.cpp
	$(CC) $(CFLAGS) -std=c++11 Main.cpp
clean: 
	rm -Rf *.o $(TARGET)
