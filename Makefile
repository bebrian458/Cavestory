CC = g++
FRAMEWORKS = -F/Library/Frameworks -F/System/Library/Frameworks
LIBFLAGS = -Iheaders -framework SDL2 -framework Cocoa 
SRC = src

Cavestory: 
	$(CC) $(FRAMEWORKS) $(LIBFLAGS) -o $@ \
	$(SRC)/main.cpp \
	$(SRC)/graphics.cpp \
	$(SRC)/game.cpp

clean:
	rm -f Cavestory