#!/bin/bash

source config

list=`cat ${EXEGOL_BIN_PATH}/tools`

for i in $list
do
    output="${EXEGOL_PREFIX}${i}"
    echo "#!/bin/bash" > $output
    echo "source ${EXEGOL_BIN_PATH}/config" >> $output
    echo "params=\"\$@\"" >> $output
    echo "echo \"[*] Exec: exegol exec -v \${EXEGOL_ENV} \\\"${i} \${params}\\\"\"" >> $output
    echo "exegol exec -v \${EXEGOL_ENV} \"${i} \${params}\"" >> $output
    chmod +x $output
done;