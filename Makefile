.SILENT:

CC = g++
FRAMEWORKS = -F/Library/Frameworks -F/System/Library/Frameworks
LIBFLAGS = -Ilib -framework SDL2 -framework SDL2_image -framework Cocoa 
SRC = src
HEADERS = lib

H = $(HEADERS)/globals.h \
		$(HEADERS)/game.h \
		$(HEADERS)/graphics.h \
		$(HEADERS)/input.h \
		$(HEADERS)/sprite.h \
		$(HEADERS)/animatedsprite.h \
		$(HEADERS)/player.h \
		$(HEADERS)/level.h \
		$(HEADERS)/tinyxml2.h

CPP = $(SRC)/main.cpp \
		$(SRC)/game.cpp \
		$(SRC)/graphics.cpp \
		$(SRC)/input.cpp \
		$(SRC)/sprite.cpp \
		$(SRC)/animatedsprite.cpp \
		$(SRC)/player.cpp \
		$(SRC)/level.cpp \
		$(SRC)/tinyxml2.cpp

Default: Cavestory

Cavestory: $(CPP) $(H)
	echo Building...
	$(CC) $(FRAMEWORKS) $(LIBFLAGS) -o $@ $(CPP)

clean:
	echo Removing executable...
	rm -f Cavestory