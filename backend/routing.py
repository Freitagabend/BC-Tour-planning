from typing import List
from models import Stop, Route
import openrouteservice
from config import ORS_API_KEY
# API-Key hier einfügen
client = openrouteservice.Client(key=ORS_API_KEY)

def optimize_route(stops: List[Stop]) -> Route:
    if len(stops) < 2:
        raise ValueError("At least 2 stops required.")
    coords = [[s.lon, s.lat] for s in stops]
    
    jobs = []
    for i, coord in enumerate(coords):
        jobs.append({
            "id": i + 1,
            "location": coord,
            "service": 300,        
            "delivery": [1],        
            "skills": [1]           
        })


    vehicles = [{
        "id": 1,
        "profile": "driving-car",
        "start": coords[0],
        "end": coords[0],
        "capacity": [4],
        "skills": [1],
        "time_window": [28800, 64800]  
    }]
    
    request_body = {
        "jobs": jobs,
        "vehicles": vehicles
    }

    result = client.request("/optimization", {}, request_body, post_json=True)
    
    route = result["routes"][0]
    steps = route["steps"]

    names = [stops[step["job"] - 1].name for step in steps if "job" in step]
    path = [stops[step["job"] - 1] for step in steps if "job" in step]
    coords_latlon = [[s.lat, s.lon] for s in path]

    return Route(
        order=names,
        distance_km=round(route["distance"] / 1000, 2),
        duration_min=round(route["duration"] / 60, 2),
        path=coords_latlon
    )
    
    
    
    
def geocode_address(address: str) -> Stop:
    result = client.pelias_search(text=address)
    if not result['features']:
        raise ValueError(f"Adresse nicht gefunden: {address}")
    
    coords = result['features'][0]['geometry']['coordinates']
    return Stop(name=address, lat=coords[1], lon=coords[0])
