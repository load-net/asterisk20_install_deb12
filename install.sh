cd /usr/src
wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-20-current.tar.gz
tar xzvf /usr/src/asterisk-20-current.tar.gz
cd asterisk-20.6.0/
contrib/scripts/install_prereq install
sleep 1
./configure --libdir=/usr/lib64 --with-crypto --with-ssl=ssl --with-srtp --with-pjproject-bundled
sleep 1
menuselect/menuselect --disable BUILD_NATIVE --disable-all \
		--enable chan_bridge_media \
		--enable chan_rtp \
		--enable chan_alsa \
		--enable chan_pjsip \
		--enable cdr_csv \
		--enable cdr_sqlite3_custom \
		--enable cdr_pgsql \
		--enable cdr_adaptive_odbc \
		--enable cel_custom \
		--enable cel_sqlite3_custom \
		--enable cel_pgsql \
		--enable cel_odbc \
		--enable bridge_native_rtp \
		--enable bridge_simple \
		--enable codec_gsm \
		--enable codec_a_mu \
		--enable codec_alaw \
		--enable codec_ulaw \
		--enable codec_speex \
		--enable codec_opus \
		--enable codec_resample \
		--enable format_gsm \
		--enable format_wav \
		--enable format_wav_gsm \
		--enable format_pcm \
		--enable format_ogg_vorbis \
		--enable format_h264 \
		--enable format_h263 \
		--enable func_base64 \
		--enable func_callerid \
		--enable func_cdr \
		--enable func_channel \
		--enable func_curl \
		--enable func_cut \
		--enable func_db \
		--enable func_logic \
		--enable func_math \
		--enable func_sprintf \
		--enable func_strings \
		--enable app_confbridge \
		--enable app_db \
		--enable app_dial \
		--enable app_echo \
		--enable app_exec \
		--enable app_mixmonitor \
		--enable app_originate \
		--enable app_playback \
		--enable app_playtones \
		--enable app_queue \
		--enable app_sendtext \
		--enable app_stack \
		--enable app_transfer \
		--enable app_system \
		--enable app_verbose \
		--enable app_voicemail \
		--enable app_externalivr \
		--enable app_jack \
		--enable app_sms \
		--enable pbx_config \
		--enable pbx_lua \
		--enable pbx_realtime \
		--enable res_agi \
		--enable res_ari \
		--enable res_ari_applications \
		--enable res_ari_asterisk \
		--enable res_ari_bridges \
		--enable res_ari_channels \
		--enable res_ari_device_states \
		--enable res_ari_endpoints \
		--enable res_ari_events \
		--enable res_ari_mailboxes \
		--enable res_ari_model \
		--enable res_ari_playbacks \
		--enable res_ari_recordings \
		--enable res_ari_sounds \
		--enable res_clioriginate \
		--enable res_config_curl \
		--enable res_config_odbc \
		--enable res_curl \
		--enable res_format_attr_h263 \
		--enable res_format_attr_h264 \
		--enable res_format_attr_opus \
		--enable res_format_attr_vp8 \
		--enable res_http_post \
		--enable res_http_websocket \
		--enable res_odbc \
		--enable res_odbc_transaction \
		--enable res_parking \
		--enable res_pjproject \
		--enable res_pjsip \
		--enable res_pjsip_acl \
		--enable res_pjsip_authenticator_digest \
		--enable res_pjsip_caller_id \
		--enable res_pjsip_config_wizard \
		--enable res_pjsip_dialog_info_body_generator \
		--enable res_pjsip_diversion \
		--enable res_pjsip_dlg_options \
		--enable res_pjsip_dtmf_info \
		--enable res_pjsip_empty_info \
		--enable res_pjsip_endpoint_identifier_anonymous \
		--enable res_pjsip_endpoint_identifier_ip \
		--enable res_pjsip_endpoint_identifier_user \
		--enable res_pjsip_exten_state \
		--enable res_pjsip_header_funcs \
		--enable res_pjsip_logger \
		--enable res_pjsip_messaging \
		--enable res_pjsip_mwi \
		--enable res_pjsip_mwi_body_generator \
		--enable res_pjsip_nat \
		--enable res_pjsip_notify \
		--enable res_pjsip_one_touch_record_info \
		--enable res_pjsip_outbound_authenticator_digest \
		--enable res_pjsip_outbound_publish \
		--enable res_pjsip_outbound_registration \
		--enable res_pjsip_path \
		--enable res_pjsip_pidf_body_generator \
		--enable res_pjsip_pidf_digium_body_supplement \
		--enable res_pjsip_pidf_eyebeam_body_supplement \
		--enable res_pjsip_publish_asterisk \
		--enable res_pjsip_pubsub \
		--enable res_pjsip_refer \
		--enable res_pjsip_registrar \
		--enable res_pjsip_rfc3326 \
		--enable res_pjsip_sdp_rtp \
		--enable res_pjsip_send_to_voicemail \
		--enable res_pjsip_session \
		--enable res_pjsip_sips_contact \
		--enable res_pjsip_t38 \
		--enable res_pjsip_transport_websocket \
		--enable res_pjsip_xpidf_body_generator \
		--enable res_realtime \
		--enable res_rtp_asterisk \
		--enable res_sorcery_astdb \
		--enable res_sorcery_config \
		--enable res_sorcery_memory \
		--enable res_sorcery_memory_cache \
		--enable res_sorcery_realtime \
		--enable res_srtp \
		--enable res_chan_stats \
		--enable res_config_ldap \
		--enable res_config_pgsql \
		--enable res_config_sqlite \
		--enable res_corosync \
		--enable res_endpoint_stats \
		--enable res_snmp \
		--enable astdb2sqlite3 \
		--enable astcanary \
		--enable OPTIONAL_API \
		--enable MOH-OPSOUND-WAV \
		--enable CORE-SOUNDS-EN-WAV \
		--enable CORE-SOUNDS-RU-WAV \
		--enable EXTRA-SOUNDS-EN-WAV \
		menuselect.makeopts
sleep 1
./configure --libdir=/usr/lib64 --with-crypto --with-ssl=ssl --with-srtp --with-pjproject-bundled
sleep 1
make -j4 && make install && make samples && make config && ldconfig
sleep 1
adduser --system --group --home /usr/lib64/asterisk --no-create-home --gecos "Asterisk" asterisk
usermod -a -G dialout,audio asterisk
chown -R asterisk: /var/{lib,log,run,spool}/asterisk /usr/lib/asterisk /etc/asterisk
sleep 1
sed -i 's/;runuser = asterisk/runuser = asterisk/' /etc/asterisk/asterisk.conf
sed -i 's/;rungroup = asterisk/rungroup = asterisk/' /etc/asterisk/asterisk.conf
sleep 1
systemctl start asterisk && systemctl enable asterisk && systemctl status asterisk
