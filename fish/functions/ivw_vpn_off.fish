function ivw_vpn_off --wraps='uwg-quick down wg0' --description 'alias ivw_vpn_off=uwg-quick down wg0'
    uwg-quick down wg0 $argv
end
