#!/bin/bash

# Connection
INFLUXDB_URL="http://localhost:8086"
BUCKET="iot"
ORG="deepshore"
TOKEN="YEfRcxzk_kZhEc1Oa_MGbOemtJ-TtKE3xv_1i0Zex_gtv3QRZOTgzThvai9FdfkWRwPnAs8iQml_Yv81pWTNFw=="

# Data to write
MEASUREMENT="beer"
TAGS="country=de,city=heidelberg"
FIELDS="liters=0"

# Timestamp in seconds
TIME=$(date -u +"%s")

# InfluxDB Line Protocol
LINE_PROTOCOL="${MEASUREMENT},${TAGS} ${FIELDS} ${TIME}"

# Write data
curl -XPOST "${INFLUXDB_URL}/api/v2/write?org=${ORG}&bucket=${BUCKET}&precision=s" \
  -H "Authorization: Token ${TOKEN}" \
  --data-raw "${LINE_PROTOCOL}"

echo "Data written to InfluxDB."
