from pydantic import BaseModel
from typing import List, Optional

class Stop(BaseModel):
    name: str
    lat: Optional[float] = None
    lon: Optional[float] = None

class TourRequest(BaseModel):
    stops: List[Stop]
    optimize: Optional[bool] = True

class Route(BaseModel):
    order: List[str]
    distance_km: float
    duration_min: float
    path: List[List[float]]

class TourResponse(BaseModel):
    optimized_route: Route
    alternatives: Optional[List[Route]] = None