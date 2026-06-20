function get_version
cat bld/version.json | jq -r '.version'
end
