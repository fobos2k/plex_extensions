#!/bin/sh

CHROME_LIST="xxx chromium chrome"
PLEX_APP_URL=http://app.plex.tv
CHROME=

get_chrome()
{
    for browser in $(echo ${CHROME_LIST}); do
        echo -n "... ${browser} "
        which ${browser} > /dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo "found"
            CHROME=$(which ${browser})
            return 0
        fi
        echo "not found"
    done
    return 1
}

main()
{
    get_chrome
    if [ ${CHROME} ]; then
        ${CHROME} --app=${PLEX_APP_URL} &
    else
        echo "Please install Chrome browser (Google Chrome, Chromium etc.)"
        exit 1
    fi
    exit 0
}

main $@
