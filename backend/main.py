from fastapi import FastAPI, HTTPException
from models import TourRequest, TourResponse
from routing import optimize_route, geocode_address

app = FastAPI()

@app.post("/route", response_model=TourResponse)
def plan_route(request: TourRequest):
    if len(request.stops) < 2:
        raise HTTPException(status_code=400, detail="At least two stops required")

    # Geocode, wenn keine Koordinaten vorhanden
    complete_stops = []
    for stop in request.stops:
        if stop.lat is None or stop.lon is None:
            try:
                geo_stop = geocode_address(stop.name)
                complete_stops.append(geo_stop)
            except ValueError as e:
                raise HTTPException(status_code=400, detail=str(e))
        else:
            complete_stops.append(stop)

    optimized_route = optimize_route(complete_stops)

    return TourResponse(
        optimized_route=optimized_route,
        alternatives=None
    )
