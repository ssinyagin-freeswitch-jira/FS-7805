MYIP=`curl --ipv4 --silent http://ifconfig.io`
TESTAUDIO=/etc/freeswitch/media/ITU-T_P_50_BRITISH_ENGLISH.wav
BATCH=/tmp/distortion_test$$


/etc/freeswitch/scripts/conference_dialer \
    --verbose \
    sofia/external/30@${MYIP}:5080 \
    sofia/external/30@${MYIP}:5080 \
    sofia/external/30@${MYIP}:5080 \
    sofia/external/30@${MYIP}:5080 \
    sofia/external/30@${MYIP}:5080 \
    sofia/external/30@${MYIP}:5080 \
    sofia/external/30@${MYIP}:5080 \
    sofia/external/30@${MYIP}:5080 \
    sofia/external/30@${MYIP}:5080 \
    sofia/external/30@${MYIP}:5080

    
