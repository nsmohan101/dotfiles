function grepAndReplace
grep -rl "$argv[2]" $arg[1] | xargs sed -i "s/$argv[2]/$argv[3]/g";  
end
