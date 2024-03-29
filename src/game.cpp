#include <SDL2/SDL.h>
#include "game.h"
#include "graphics.h"
#include "input.h"

/* Game class
 * This class holds all info for our main game loop
 */

namespace {
	const int FPS = 50;
	const int MAX_FRAME_TIME = 5 * 1000 / FPS;
}

Game::Game(){
	SDL_Init(SDL_INIT_EVERYTHING);
	this->gameLoop();
}

Game::~Game(){

}

void Game::gameLoop(){
	Graphics graphics;
	Input input;
	SDL_Event event;

	this->_player = Player(graphics, 100, 100);
	this->_level = Level("map 1", Vector2(100, 100), graphics);

	int LAST_UPDATE_TIME = SDL_GetTicks();
	// Start the game loop
	while(true){
		input.beginNewFrame();

		if(SDL_PollEvent(&event)){
			switch(event.type) {
			    case SDL_KEYDOWN:
			        if(!event.key.repeat)
			            input.keyDownEvent(event);
			        break;
			    case SDL_KEYUP:
			        input.keyUpEvent(event);
			        break;
			    case SDL_QUIT:
			        return;
			}
		}

		if(input.wasKeyPressed(SDL_SCANCODE_ESCAPE))
			return;
		else if(input.isKeyHeld(SDL_SCANCODE_LEFT))
			this->_player.moveLeft();
		else if(input.isKeyHeld(SDL_SCANCODE_RIGHT))
			this->_player.moveRight();
		else
			this->_player.stopMoving();

		// Limit FPS
		const int CURRENT_TIME_MS = SDL_GetTicks();
		int ELAPSED_TIME_MS = CURRENT_TIME_MS - LAST_UPDATE_TIME;
		this->update(std::min(ELAPSED_TIME_MS, MAX_FRAME_TIME));
		LAST_UPDATE_TIME = CURRENT_TIME_MS;	

		this->draw(graphics);
	}
}

void Game::draw(Graphics &graphics){
	graphics.clear();

	this->_level.draw(graphics);
	this->_player.draw(graphics);

	graphics.flip();
}

void Game::update(float elapsedtime){
	this->_player.update(elapsedtime);
	this->_level.update(elapsedtime);
}


