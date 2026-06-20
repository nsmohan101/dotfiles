function oem_bld_and_install --wraps='./build.sh && ./build.sh install' --description 'alias oem_bld_and_install=./build.sh && ./build.sh install'
  ./build.sh && ./build.sh install $argv; 
end
