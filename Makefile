SHELL := /bin/bash

unameOut := $(shell uname -s)

ifeq ($(unameOut),Linux)
    dataLib := $(HOME)/.local/share
    dataConf := $(HOME)/.config
else ifeq ($(unameOut),Darwin)
    dataLib := $(HOME)/Library/Application\ Support
    dataConf := $(HOME)/.config
else ifeq ($(unameOut),CYGWIN*)
    dataLib := %APPDATA%
    dataConf := %APPDATA%
else ifeq ($(unameOut),MINGW*)
    dataLib := %APPDATA%
    dataConf := %APPDATA%
else ifeq ($(unameOut),MSYS_NT*)
    dataLib := %APPDATA%
    dataConf := %APPDATA%
else
    $(error unknown os)
endif

dataLib := $(dataLib)/typst/packages/docs
bmstu_package := $(dataLib)/bmstu/0.1.1

.PHONY: all install
all: install

install: create_dir_lib copy_files create_dir_conf config

create_dir_lib:
	@mkdir -p $(bmstu_package)

copy_files:
	@cp -r $(dir $(lastword $(MAKEFILE_LIST)))/bmstu/* $(bmstu_package)

create_dir_conf:
	@mkdir -p $(dataConf)/typst

config:
	@ln -s $(bmstu_package)/bmstu.config.typ $(dataConf)/typst
