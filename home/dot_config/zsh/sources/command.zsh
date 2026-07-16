# :fzf-tab:complete:(-command-:|command:option-(v|V)-rest)
# ? Don't understand why echo of man should be use `bat` on pipe to color the output
(out=$(tldr --color always "$word" 2>/dev/null) && echo "$out") ||
(out=$(MANWIDTH=$FZF_PREVIEW_COLUMNS man "$word" 2>/dev/null) && echo "$out" | bat -lman) ||
(out=$(which "$word") && echo "$out" || echo "${(P)word}")
