MYIP=`curl --ipv4 --silent http://ifconfig.io`
TESTAUDIO=/etc/freeswitch/media/ITU-T_P_50_BRITISH_ENGLISH.wav
BATCH=/tmp/distortion_test$$

rm -f /var/tmp/*.wav

echo >${BATCH}

for y in {1..10}; do
    echo 'bgapi originate sofia/external/rec@'${MYIP}':5080 &playback('${TESTAUDIO}')' >>${BATCH}
done

echo '/exit' >>${BATCH}

for x in {1..10}; do
    cat ${BATCH} | fs_cli -b -q >/dev/null
    sleep 2
done

sleep 130

cd /var/tmp

for f in *.wav; do
    echo -n $f
    /etc/freeswitch/scripts/aqua_score ${TESTAUDIO} $f | grep Percent
done
