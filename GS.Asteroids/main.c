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
unsigned int randomSeed;


boolean shouldQuit;

void signalQuit(void)
{
    shouldQuit = true;
}


// Shifted division
// As with the C functions below,
// try to move this into ASM
word fpDivide(word a, word b)
{
    return floor(((float)a / b) * 64);
}

// Do this in assembly with a lookup table
word getRandom(word range)
{
    return rand() % range;
}

// Hate getting the digits in C
// Hopefully I can figure out a
// way to do this in assembly.

word getScoreDigit10s(word score)
{
    return (score/10) % 10;
}

word getScoreDigit100s(word score)
{
    return (score/100) % 10;
}

word getScoreDigit1000s(word score)
{
    return (score/1000) % 10;
}

word getScoreDigit10000s(word score)
{
    return (score/10000) % 10;
}

word getScoreDigit100000s(word score)
{
    return (score/100000) % 10;
}

// Sounds

static void loadSound(Word addr, Word soundNum)
{
    Handle handle = LoadResource(rRawSound, soundNum);
    HLock(handle);
    WriteRamBlock(*handle, addr, GetHandleSize(handle));
    HUnlock(handle);
}

void loadFireSound(word addr)
{
    loadSound(addr, FIRE_SOUND);
}

void loadExplode1Sound(word addr)
{
    loadSound(addr, EXPLODE1_SOUND);
}

void loadExplode2Sound(word addr)
{
    loadSound(addr, EXPLODE2_SOUND);
}

void loadExplode3Sound(word addr)
{
    loadSound(addr, EXPLODE3_SOUND);
}

void preloadSound(void)
{
    LoadResource(rRawSound, FIRE_SOUND);
    LoadResource(rRawSound, EXPLODE1_SOUND);
    LoadResource(rRawSound, EXPLODE2_SOUND);
    LoadResource(rRawSound, EXPLODE3_SOUND);
}

// Game loop
void waitForNextTick(void)
{
    while (!shouldQuit) {
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
    
    ShutDownTools(refIsHandle, toolStartupRef);
    TLShutDown();
    MMShutDown(userid);
    
    return 0;
}
