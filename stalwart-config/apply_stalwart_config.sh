#!/bin/bash
cd /run/stalwart_config/

/usr/local/bin/stalwart-recovery on

set -a
source /run/stalwart-recovery.env
set +a

for PLAN_FILE in *.json; do
	/usr/local/bin/stalwart-cli apply --file ${PLAN_FILE}
	rm -f ${PLAN_FILE}
done

/usr/local/bin/stalwart-recovery off
