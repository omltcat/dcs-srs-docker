#!/bin/sh
set -eu

if [ ! -e "$SRS_HOME/SRS-Server-Commandline-Linux" ] \
	|| ! cmp -s /app/SRS-Server-Commandline-Linux "$SRS_HOME/SRS-Server-Commandline-Linux"; then
	cp /app/SRS-Server-Commandline-Linux "$SRS_HOME/SRS-Server-Commandline-Linux"
fi

chmod 0755 "$SRS_HOME/SRS-Server-Commandline-Linux"
cd "$SRS_HOME"

for mapping in \
	CONSOLE_LOGS:--consoleLogs \
	SERVER_PORT:--port \
	COALITION_SECURITY:--coalitionSecurity \
	SPECTATOR_AUDIO_DISABLED:--spectatorAudioDisabled \
	CLIENT_EXPORT_ENABLED:--clientExportEnabled \
	REAL_RADIO_TX:--realRadioTx \
	REAL_RADIO_RX:--realRadioRx \
	RADIO_EXPANSION:--radioExpansion \
	EXTERNAL_AWACS_MODE:--enableEAM \
	EXTERNAL_AWACS_MODE_BLUE_PASSWORD:--eamBluePassword \
	EXTERNAL_AWACS_MODE_RED_PASSWORD:--eamRedPassword \
	CLIENT_EXPORT_FILE_PATH:--clientExportPath \
	CHECK_FOR_BETA_UPDATES:--betaUpdates \
	ALLOW_RADIO_ENCRYPTION:--allowRadioEncryption \
	TEST_FREQUENCIES:--testFrequencies \
	SHOW_TUNED_COUNT:--showTunedCount \
	GLOBAL_LOBBY_FREQUENCIES:--globalLobbyFrequencies \
	SHOW_TRANSMITTER_NAME:--showTransmitterName \
	LOTATC_EXPORT_ENABLED:--lotATCExport \
	LOTATC_EXPORT_PORT:--lotATCExportPort \
	LOTATC_EXPORT_IP:--lotATCExportIP \
	RETRANSMIT_NODE_LIMIT:--retransmitNodeLimit \
	STRICT_RADIO_ENCRYPTION:--strictRadioEncryption \
	TRANSMISSION_LOG_ENABLED:--transmissionLogEnabled \
	HTTP_SERVER_ENABLED:--httpServerEnabled \
	HTTP_SERVER_PORT:--httpServerPort \
	HTTP_SERVER_ADDRESS:--httpServerAddress \
	RADIO_EFFECT_OVERRIDE:--radioEffectOverride \
	SERVER_IP:--serverBindIP \
	CFG:--cfg \
	SERVER_PRESETS_ENABLED:--serverPresetChannelsEnabled \
	SERVER_EAM_RADIO_PRESET_ENABLED:--serverEAMRadioPresetEnabled \
	ALLOW_INSTRUCTOR_MODE:--allowInstructorMode; do
	env_name=${mapping%%:*}
	option=${mapping#*:}
	value=$(printenv "$env_name" 2>/dev/null || true)
	if [ -n "$value" ]; then
		set -- "$@" "$option=$value"
	fi
done

exec "$SRS_HOME/SRS-Server-Commandline-Linux" "$@"