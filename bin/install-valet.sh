#!/usr/bin/env bash

#install valet-linux as a global composer package.
composer global require cpriego/valet-linux

#update domain
valet domain local

#update TLD name
valet domain .local
