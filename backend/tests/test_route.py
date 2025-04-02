from fastapi.testclient import TestClient
from backend.main import app

client = TestClient(app)

def test_plan_route_success():
    response = client.post("/route", json={
        "stops": [
            {"name": "Brandenburger Tor"},
            {"name": "Alexanderplatz"}
        ],
        "optimize": True
    })
    assert response.status_code == 200
    data = response.json()
    assert "optimized_route" in data
    assert "order" in data["optimized_route"]
    assert len(data["optimized_route"]["order"]) == 2


def test_plan_route_too_few_stops():
    response = client.post("/route", json={"stops": [{"name": "Only one"}]})
    assert response.status_code == 400
    assert response.json()["detail"] == "Mindestens zwei Stopps erforderlich"
