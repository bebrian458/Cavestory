/* Graphics class 
 * Holds all information dealing with graphics for the game
 */

#include <SDL2/SDL.h>
#include "graphics.h"

Graphics::Graphics(){
	SDL_CreateWindowAndRenderer(640, 480, 0, &this->_window, &this->_renderer); // Can remove "this->" 
	SDL_SetWindowTitle(this->_window, "Cavestory");
}

Graphics::~Graphics(){
	SDL_DestroyWindow(this->_window);
}
