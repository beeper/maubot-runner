#!/bin/sh

PLUGIN_DIR=/data/plugin
PLUGIN_REPO=${PLUGIN_REPO:-https://github.com/maubot/echo}

if [ -d $PLUGIN_DIR/.git ]; then
    echo "Updating plugin from git"
    (cd $PLUGIN_DIR && git fetch origin -a && git reset --hard origin/HEAD) || echo "Failed to update plugin"
else
    echo "Cloning plugin from git"
    rm -rf $PLUGIN_DIR
    git clone $PLUGIN_REPO $PLUGIN_DIR
fi

export USER_CREDENTIALS_DEVICE_ID="${USER_CREDENTIALS_DEVICE_ID:-}"
export USER_DISPLAYNAME="${USER_DISPLAYNAME:-Maubot}"
export USER_AVATAR_URL="${USER_AVATAR_URL:-mxc://maunium.net/AKwRzQkTbggfVZGEqexbYLIO}"
export USER_AUTOJOIN="${USER_AUTOJOIN:-false}"

envsubst < /opt/beeper/config.tpl.yaml > /data/plugin/config.yaml

cd /data/plugin
export PYTHONPATH=/opt/maubot
exec python -m maubot.standalone
