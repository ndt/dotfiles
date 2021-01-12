#!/bin/zsh
for alias_file in $(find ~/.zsh/aliases.d/ -type f); do
	source $alias_file
done

for CMD in cd ls rm pwd; do
	eval "alias $CMD=' $CMD'"
done
