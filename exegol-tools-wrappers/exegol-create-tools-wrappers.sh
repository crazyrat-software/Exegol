#!/bin/bash

source config

wget -qO - https://raw.githubusercontent.com/ThePorgs/Exegol-docs/main/source/assets/installed_tools/lists/latest_nightly_arm64.csv | awk -F',' -s '{print $1;}' | tail -n +2 > ${EXEGOL_BIN_PATH}/tools

list=`cat ${EXEGOL_BIN_PATH}/tools`

for i in $list
do
    output="${EXEGOL_PREFIX}${i}"
    if [ -f $output ]; then
	echo "[!] Skipping file: ${output}"
    else
	echo "[*] Creating file: ${output}"
	echo "#!/bin/bash" > $output
	echo "source ${EXEGOL_BIN_PATH}/config" >> $output
	echo "params=\"\$@\"" >> $output
	echo "echo \"[*] Exec: exegol exec -v \${EXEGOL_ENV} \\\"${i} \${params}\\\"\"" >> $output
	echo "exegol exec -v \${EXEGOL_ENV} \"${i} \${params}\"" >> $output
	chmod +x $output
    fi
done;