### Defensive settings for make:
#     https://tech.davis-hansson.com/p/make/
SHELL:=bash
.ONESHELL:
.SHELLFLAGS:=-xeu -o pipefail -O inherit_errexit -c
.SILENT:
.DELETE_ON_ERROR:
MAKEFLAGS+=--warn-undefined-variables
MAKEFLAGS+=--no-builtin-rules

CURRENT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))


# We like colors
# From: https://coderwall.com/p/izxssa/colored-makefile-for-golang-projects
RED=`tput setaf 1`
GREEN=`tput setaf 2`
RESET=`tput sgr0`
YELLOW=`tput setaf 3`

.PHONY: build-backend
build-backend:  ## Build backend image
	@echo "Build"
	$(MAKE) -C "./backend/" build-image

.PHONY: start-backend
start-backend: ## Start backend server
	@echo "Start backend server"
	@docker run --rm --name theme-backend -d -p 8080:8080 volto-theme-plone-regional:6.0.0a1

.PHONY: stop-backend
stop-backend: ## Stop backend server
	@echo "Stop backend server"
	@docker stop theme-backend
