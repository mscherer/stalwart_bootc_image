#!/bin/bash
cd /run/stalwart_config/

/usr/local/bin/stalwart-recovery on

source /run/stalwart-recovery.env
export STALWART_URL=http://127.0.0.1:8080/

for PLAN_FILE in *.json; do
	/usr/local/bin/stalwart-cli apply --file ${PLAN_FILE}
	rm -f ${PLAN_FILE}
done

/usr/local/bin/stalwart-recovery off
