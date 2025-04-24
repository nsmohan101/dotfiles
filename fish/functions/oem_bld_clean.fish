function oem_bld_clean --wraps='./build.sh clean_full' --description 'alias oem_bld_clean=./build.sh clean_full'
  ./build.sh clean_full $argv; 
end
