/*
 * main.c
 * GS.Asteroids
 *
 * Created by Peter Hirschberg on 5/14/21.
 * Copyright (c) 2021 Peter Hirschberg. All rights reserved.
 *
 */

#include <stdlib.h>
#include <string.h>
#include <time.h>

#include <gsos.h>
#include <Memory.h>
#include <Locator.h>
#include <MiscTool.h>
#include <Resources.h>
#include <Sound.h>
#include <QuickDraw.h>

#include "main.h"

unsigned int userid;
clock_t lastTick;

word getRandom(range)
{
    return rand() % range;
}

void waitForNextTick(void)
{
    while (1) {
        clock_t t;
        runGameTick();
        do {
            t = clock();
        }
        while ((t - lastTick) < 2);
        lastTick = t;
    }
}

int main(void)
{
    int event;
    Ref toolStartupRef;

    userid = MMStartUp();
    TLStartUp();
    toolStartupRef = StartUpTools(userid, refIsResource, TOOL_STARTUP);
    CompactMem();
    InitMouse(0);
    SetMouse(transparent);
  
    gameInit();

    lastTick = clock();
    waitForNextTick();

    // TODO - allow for quitting the game!! :-)
    
    ShutDownTools(refIsHandle, toolStartupRef);
    TLShutDown();
    MMShutDown(userid);
    
    return 0;
}
