#!/bin/bash
echo "Starting MyCollab application container - v2!"

# echo "Wait for DB server to be ready"
# /opt/bibbox-scripts/waitforit.sh "phenotips-db:3306"

/opt/mycollab/MyCollab-5.3.4/bin/startup.sh
tail -f /opt/mycollab/MyCollab-5.3.4/logs/mycollab.out