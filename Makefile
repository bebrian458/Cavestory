.SILENT:

CC = g++
CFLAGS = -c
FRAMEWORKS = -F/Library/Frameworks -F/System/Library/Frameworks
LIBFLAGS = -framework SDL2 -framework SDL2_image -framework Cocoa 
SRC = src
LIBS = -Ilib
OBJDIR = obj
PGM = Cavestory

OBJECTS = $(addprefix $(OBJDIR)/, \
		main.o \
		game.o \
		graphics.o \
		input.o \
		sprite.o \
		animatedsprite.o \
		player.o \
		level.o \
		tinyxml2.o)

Default: $(PGM)

$(PGM): $(OBJECTS)
	echo "Building executable..."
	$(CC) -Wall -o $@ $^ $(FRAMEWORKS) $(LIBFLAGS)

$(OBJDIR)/%.o: $(SRC)/%.cpp | $(OBJDIR)
	echo "Building $@..."
	$(CC) -c $< -o $@ $(LIBS)

$(OBJDIR):
	echo "Making obj dir for object files..."
	mkdir $@

clean:
	echo "Removing executable and object files..."
	rm -rf $(PGM) $(OBJDIR)