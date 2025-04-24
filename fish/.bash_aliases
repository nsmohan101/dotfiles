function lem_test_app_update 
    python3 /mnt/devshare/apollo/build-scripts/lem_usb_comm --command FIRMWARE_UPDATE -f bld/LEM_TEST_APP_COMBINED.bin -g bld/version.json -p $argv[1]; 
end

function lem_update 
    python3 /mnt/devshare/apollo/build-scripts/lem_usb_comm --command FIRMWARE_UPDATE -f $argv[1] -g $argv[2] -p $argv[3]; 
end

function lem_app_update      
    python3 /mnt/devshare/apollo/build-scripts/lem_usb_comm --command FIRMWARE_UPDATE -f bld/APPLICATION_COMBINED.bin -g bld/version.json -p $argv[1]; 
end

function lem_bl_update      
    python3 /mnt/devshare/apollo/build-scripts/lem_usb_comm --command BOOTLOADER_UPDATE -f bld/BOOT_LOADER.bin -p $argv[1]; 
end

function lem_test            
    python3 /mnt/devshare/apollo/build-scripts/lem_usb_comm --command LEM_SELF_TEST -p $argv[1]; 
end

function lem_status          
    python3 /mnt/devshare/apollo/build-scripts/lem_usb_comm --command STATUS -p $argv[1]; 
end

function lem_erase           
    python3 /mnt/devshare/apollo/build-scripts/lem_usb_comm --command FLASH_ERASE -p $argv[1]; 
end

function lem_start           
    python3 /mnt/devshare/apollo/build-scripts/lem_usb_comm --command START_MONITORING -p $argv[1]; 
end

function lem_stop            
    python3 /mnt/devshare/apollo/build-scripts/lem_usb_comm --command STOP_MONITORING -p $argv[1]; 
end

function lem_reboot          
    python3 /mnt/devshare/apollo/build-scripts/lem_usb_comm --command REBOOT -p $argv[1]; 
end

function lem_reset_baseline  
    python3 /mnt/devshare/apollo/build-scripts/lem_usb_comm --command RESET_BASELINE -p $argv[1]; 
end

function lem_write_serial    
    python3 /mnt/devshare/apollo/build-scripts/lem_usb_comm --command WRITE_SERIAL --serial $argv[1] -p $argv[2]; 
end

function lem_write_label     
    python3 /mnt/devshare/apollo/build-scripts/lem_usb_comm --command WRITE_LABEL --label $argv[1] -p $argv[2]; 
end

function lem_read_label      
    python3 /mnt/devshare/apollo/build-scripts/lem_usb_comm --command READ_LABEL -p $argv[1]; 
end
function lem_eeprom_erase    
    python3 /mnt/devshare/apollo/build-scripts/lem_usb_comm --command EEPROM_ERASE -p $argv[1]; 
end

function lem_eeprom_init     
    python3 /mnt/devshare/apollo/build-scripts/lem_usb_comm --command EEPROM_INIT -p $argv[1]; 
end

function lem_listen          
    python3 /mnt/devshare/apollo/build-scripts/lem_usb_comm --listen  -p $argv[1]; 
end
