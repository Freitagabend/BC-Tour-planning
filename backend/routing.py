from openrouteservice import convert
from typing import List
from models import Stop, Route
from config import ORS_API_KEY

# API-Key hier einfügen
client = openrouteservice.Client(key=ORS_API_KEY)

def optimize_route(stops: List[Stop]) -> Route:
    coords = [[s.lon, s.lat] for s in stops]

    # Optimierung (Traveling Salesman Problem)
    result = client.optimization(
        jobs=[{"id": i + 1, "location": coords[i]} for i in range(len(coords))],
        vehicles=[{
            "id": 1,
            "start": coords[0],
            "end": coords[0]  # Runde Tour, Start = Ziel
        }]
    )

    # Reihenfolge extrahieren
    job_map = {job["id"]: stops[i] for i, job in enumerate(result["jobs"])}
    steps = result["routes"][0]["steps"]
    ordered = [job_map[step["job_id"]] for step in steps]

    # Route berechnen (echte Strecke)
    route_data = client.directions(
        coordinates=[[s.lon, s.lat] for s in ordered],
        profile='driving-car',
        format='geojson'
    )

    dist = route_data["features"][0]["properties"]["summary"]["distance"] / 1000
    duration = route_data["features"][0]["properties"]["summary"]["duration"] / 60
    geometry = route_data["features"][0]["geometry"]["coordinates"]
    path = [[latlon[1], latlon[0]] for latlon in geometry]

    return Route(
        order=[s.name for s in ordered],
        distance_km=round(dist, 2),
        duration_min=round(duration, 2),
        path=path
    )
    
def geocode_address(address: str) -> Stop:
    result = client.pelias_search(text=address)
    if not result['features']:
        raise ValueError(f"Adresse nicht gefunden: {address}")
    
    coords = result['features'][0]['geometry']['coordinates']
    return Stop(name=address, lat=coords[1], lon=coords[0])
