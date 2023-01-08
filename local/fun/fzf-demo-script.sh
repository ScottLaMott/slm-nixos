#!/bin/sh

yes | head -100 | awk '{ print NR, NR %2 == 0 ? "even" : "odd" }' | fzf

# editieren
# vim -o $(fzf)

