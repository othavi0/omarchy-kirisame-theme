set -l color00 '#232829'
set -l color01 '#cf9494'
set -l color02 '#98b3a3'
set -l color03 '#d1a98c'
set -l color04 '#85abbc'
set -l color05 '#bfa3c4'
set -l color06 '#8fbfc2'
set -l color07 '#dcd6d6'
set -l color08 '#7f8c8e'
set -l color09 '#cf9494'
set -l color0A '#98b3a3'
set -l color0B '#d1c391'
set -l color0C '#85abbc'
set -l color0D '#bfa3c4'
set -l color0E '#8fbfc2'
set -l color0F '#f2eeee'
set -l selection '#33464d'

set -l FZF_NON_COLOR_OPTS

for arg in (echo $FZF_DEFAULT_OPTS | tr " " "\n")
    if not string match -q -- "--color*" $arg
        set -a FZF_NON_COLOR_OPTS $arg
    end
end

set -Ux FZF_DEFAULT_OPTS "$FZF_NON_COLOR_OPTS"" --color=bg+:$selection,bg:$color00,spinner:$color0E,hl:$color04"" --color=fg:$color07,header:$color05,info:$color0A,pointer:$color04"" --color=marker:$color0E,fg+:$color0F,prompt:$color04,hl+:$color05"
