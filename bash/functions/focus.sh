# remove specified host from /etc/hosts
function removehost() {
    if [[ "$1" ]]
    then
        HOSTNAME=$1

        if [ -n "$(grep $HOSTNAME /etc/hosts)" ]
        then
            echo "$HOSTNAME Found in your /etc/hosts, Removing now...";
            sudo sed -i".bak" "/$HOSTNAME/d" /etc/hosts
        else
            echo "$HOSTNAME was not found in your /etc/hosts";
        fi
    else
        echo "Error: missing required parameters."
        echo "Usage: "
        echo "  removehost domain"
    fi
}

#add new ip host pair to /etc/hosts
function addhost() {
    if [[ "$1" && "$2" ]]
    then
        IP=$1
        HOSTNAME=$2

        if [ -n "$(grep $HOSTNAME /etc/hosts)" ]
            then
                echo "$HOSTNAME already exists:";
                echo $(grep $HOSTNAME /etc/hosts);
            else
                echo "Adding $HOSTNAME to your /etc/hosts";
                printf "%s\t%s\n" "$IP" "$HOSTNAME" | sudo tee -a /etc/hosts > /dev/null;

                if [ -n "$(grep $HOSTNAME /etc/hosts)" ]
                    then
                        echo "$HOSTNAME was added succesfully:";
                        echo $(grep $HOSTNAME /etc/hosts);
                    else
                        echo "Failed to Add $HOSTNAME, Try again";
                fi
        fi
    else
        echo "Error: missing required parameters."
        echo "Usage: "
        echo "  addhost ip domain"
    fi
}

function reload_firefox() {
    sudo dscacheutil -flushcache;
    sudo killall -HUP mDNSResponder;
    killall SIGTERM firefox
    sleep 0.5
    ff
}

function focus() {
    addhost 127.0.0.1 www.reddit.com;
    addhost 127.0.0.1 twitter.com;
    reload_firefox
}


function unfocus() {
    removehost www.reddit.com;
    removehost twitter.com;
    sudo dscacheutil -flushcache
    sudo killall -HUP mDNSResponder;
    reload_firefox
}
