function fish_version_check \
    --argument-names major minor patch \
    --description "Check if the current fish version is major.minor.patch or newer"

    if test (count $argv) -ne 3
        echo "Usage: fish_version_check MAJOR MINOR PATCH" >&2
        return 2
    end

    type --quiet string; or return 1
    set --local version_array (string split "." $version)

    if test $version_array[1] -gt $major
        return
    else if test $version_array[1] -lt $major
        return 1
    end

    if test $version_array[2] -gt $minor
        return
    else if test $version_array[2] -lt $minor
        return 1
    end

    test $version_array[3] -ge $patch

end
