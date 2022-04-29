# Filter the railway station data file (json) and output only those stations which are in Mumbai
# The railway stations represent localities and are used as demand hotspot locations

import json

f = open("./railway_stations.json")

stations = json.load(f)

for station in stations["features"]:
    if station["properties"]["state"] == "Maharashtra":
        if "Mumbai" in station["properties"]["address"]:
            print(station.get("geometry").get("coordinates"), "   ", station.get("properties").get("name"))