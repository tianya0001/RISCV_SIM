#include <iostream>
#include <SDL3/SDL.h>
#include <SDL3/SDL_main.h>

#include "main.hpp"

#define SDL_MAIN_USE_CALLBACKS 1  /* use the callbacks instead of main() */

/* We will use this renderer to draw into this window every frame. */
static SDL_Window *window = NULL;
static SDL_Renderer *renderer = NULL;

int main(int argc, char* argv[])
{
    if (!SDL_Init(SDL_INIT_VIDEO | SDL_INIT_EVENTS))
    {
        return -1;
    }

    // 创建窗口
    SDL_Window* window = SDL_CreateWindow("SDL3 Test", 640, 480, SDL_WINDOW_OPENGL);
    if (!window) {
        SDL_Log("Unable to create window: %s", SDL_GetError());
        SDL_Quit();
        return -1;
    }

    // 主循环
    bool running = true;
    while (running) {
        SDL_Event event;
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_EVENT_QUIT) {
                running = false;
            }
        }
    }

    // 释放资源
    SDL_DestroyWindow(window);

    SDL_Quit();

    return 0;
}

