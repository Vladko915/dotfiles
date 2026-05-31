if command -v ansible >/dev/null 2>&1; then
    arun() {
        ansible -i ~/hosts.ini kubernetes -m command -a "$1" | awk '/CHANGED/{print "----------"}1'
    }
fi