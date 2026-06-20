function ivw_vpn_on --wraps='uwg-quick up wg0' --description 'alias ivw_vpn_on=uwg-quick up wg0'
    uwg-quick up wg0 $argv
end
