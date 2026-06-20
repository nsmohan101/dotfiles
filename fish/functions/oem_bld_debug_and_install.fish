function oem_bld_debug_and_install --wraps='./build.sh debug && ./build.sh install' --description 'alias oem_bld_debug_and_install=./build.sh debug && ./build.sh install'
    ./build.sh debug && ./build.sh install $argv
end
