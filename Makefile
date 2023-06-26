TEENSY_VER := 4.1
TARGET := frser-duino-teensy4

ifeq ($(OS),Windows_NT)
    ARDUINOPATH := $(LOCALAPPDATA)/Arduino15
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
        ARDUINOPATH := $(HOME)/.arduino15
    endif
    ifeq ($(UNAME_S),Darwin)
        ARDUINOPATH := $(HOME)/Library/Arduino15
    endif
endif

TOOLSPATH := $(abspath $(dir $(wildcard $(ARDUINOPATH)/packages/teensy/tools/teensy-tools/*/teensy_reboot)))
LIBRARYPATH := $(abspath $(wildcard $(ARDUINOPATH)/packages/teensy/hardware/avr/*/libraries))
COMPILERPATH := $(abspath $(dir $(wildcard $(ARDUINOPATH)/packages/teensy/tools/teensy-compile/*/arm/bin/arm-none-eabi-gcc)))

TEENSY_VER := 4.1

include teensyduino-cores/teensy4/Makefile

OPTIONS += -UUSING_MAKEFILE
