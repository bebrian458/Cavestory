CC = g++
FRAMEWORKS = -F/Library/Frameworks -F/System/Library/Frameworks
LIBFLAGS = -Ilib -framework SDL2 -framework Cocoa  -framework SDL2_image
SRC = src
HEADERS = lib

CPP = $(SRC)/main.cpp \
		$(SRC)/game.cpp \
		$(SRC)/graphics.cpp \
		$(SRC)/input.cpp \
		$(SRC)/sprite.cpp

H = $(HEADERS)/game.h \
		$(HEADERS)/graphics.h \
		$(HEADERS)/input.h \
		$(HEADERS)/sprite.h

Default: Cavestory

Cavestory: $(CPP) $(H)
	$(CC) $(FRAMEWORKS) $(LIBFLAGS) -o $@ $(CPP)

clean:
	rm -f Cavestory