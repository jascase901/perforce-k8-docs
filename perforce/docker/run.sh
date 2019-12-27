#Usage: configure-helix-p4d.sh [service-name] [options]
#
#    -n                   - Use the following flags in non-interactive mode
#    -p <P4PORT>          - Perforce Server's address
#    -r <P4ROOT>          - Perforce Server's root directory
#    -u <username>        - Perforce super-user login name
#    -P <password>         - Perforce super-user password
#    --unicode            - Enable unicode mode on server
#    --case               - Case-sensitivity (0=sensitive[default],1=insensitive)
#    -h --help            - Display this help and exit

INSTALL_SCRIPT=/opt/perforce/sbin/configure-helix-p4d.sh
$INSTALL_SCRIPT $SERVICE \
                --case 1 \
                --unicode \
                -P $PASSWD \
                -n \
                -p $P4PORT \
                -r $P4ROOT \
                -u $USER

while true; do :; done & # do nothing(:) in background, in an endless loop
kill -STOP $!            # stop the background process of doing nothing
wait $!                  # wait forever, because doing nothing process is stopped
