function fish_version_check \
    --argument-names major minor patch \
    --description "Check if the current fish version is major.minor.patch or newer"

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

    if test $version_array[3] -ge $patch
        return
    else
        return 1
    end

end
