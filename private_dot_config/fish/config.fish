# conf.d is loaded first

# Disabling fish greeting
set --export fish_greeting

if grep --quiet --no-messages amdgpu /proc/modules
    set --export RUSTICL_ENABLE radeonsi
    set --export LIBVA_DRIVER_NAME radeonsi
end

if command --query nvim
    set --export EDITOR nvim
end

if command --query starship
    starship init fish | source
end

if command --query zoxide; and string length --quiet $__fish_data_dir
    zoxide init fish | source
end


fish_add_path $HOME/.local/bin /var/lib/flatpak/exports/bin/

# subconfig is loaded last
for file in $__fish_config_dir/subconfig/*.fish
    source $file
end
