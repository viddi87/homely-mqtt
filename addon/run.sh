#!/usr/bin/with-contentv bashio

if bashio::services.available mqtt ; then
    export MQTT_HOST="$(bashio::services mqtt 'host')"
    export MQTT_PORT="$(bashio::services mqtt 'port')"
    export MQTT_USER="$(bashio::services mqtt 'username')"
    export MQTT_PASSWORD="$(bashio::services mqtt 'password')"
fi

if bashio::config.has_value mqtt_host ; then
    export MQTT_HOST="$(bashio::config mqtt_host)"
fi

if bashio::config.has_value mqtt_port ; then
    export MQTT_PORT="$(bashio::config mqtt_port)"
fi

if bashio::config.has_value mqtt_username ; then
    export MQTT_USER="$(bashio::config mqtt_username)"
fi

if bashio::config.has_value mqtt_password ; then
    export MQTT_PASSWORD="$(bashio::config mqtt_password)"
fi

if bashio::config.has_value homely_username ; then
    export HOMELY_HOST="$(bashio::config homely_username)"
fi

if bashio::config.has_value homely_password ; then
    export HOMELY_PASSWORD="$(bashio::config homely_password)"
fi

env | grep HOMELY_ | sed -r 's/_(USER|PASSWORD)=.*/_\1=REDACTED/'
set -x

