#!/bin/bash

echo "Running queue check"
TOP_PATCH=`hg qtop`
MATCH="no patches applied"
STATUS=1
if [[ $TOP_PATCH = $MATCH ]]; then

	STATUS=0
else
	echo "$TOP_PATCH is applied, operation is not permitted"
fi

exit $STATUS
