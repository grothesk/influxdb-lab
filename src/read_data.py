from influxdb_client import InfluxDBClient


URL = "http://localhost:8086"
ORG = 'deepshore'
BUCKET = 'iot'
TOKEN = 'YEfRcxzk_kZhEc1Oa_MGbOemtJ-TtKE3xv_1i0Zex_gtv3QRZOTgzThvai9FdfkWRwPnAs8iQml_Yv81pWTNFw=='
PAST_HOURS = "12"


client = InfluxDBClient(url=URL, token=TOKEN, org=ORG)

query = 'from(bucket: "{bucket}")\
    |> range(start: -{past_hours}h)\
    |> filter(fn:(r) => r.city == "berlin")'.format(bucket=BUCKET, past_hours=PAST_HOURS)

tables = client.query_api().query(query, org=ORG)

for table in tables:
    for row in table.records:
        print(row.values)
