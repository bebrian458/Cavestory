.SILENT:

CC = g++
CFLAGS = -c
FRAMEWORKS = -F/Library/Frameworks -F/System/Library/Frameworks
LIBFLAGS = -framework SDL2 -framework SDL2_image -framework Cocoa 
SRCDIR = src
LIBS = -Ilib
OBJDIR = obj
PGM = Cavestory

SOURCES = $(wildcard $(SRCDIR)/*.cpp)
OBJECTS = $(patsubst $(SRCDIR)/%.cpp, $(OBJDIR)/%.o, $(SOURCES))

Default: $(PGM)

$(PGM): $(OBJECTS)
	echo "Building executable..."
	$(CC) -Wall -o $@ $^ $(FRAMEWORKS) $(LIBFLAGS)

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp | $(OBJDIR)
	echo "Building $@..."
	$(CC) -c $< -o $@ $(FRAMEWORKS) $(LIBS)

$(OBJDIR):
	echo "Making obj dir for object files..."
	mkdir $@

clean:
	echo "Removing executable and object files..."
	rm -rf $(PGM) $(OBJDIR)