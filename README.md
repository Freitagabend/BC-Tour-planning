# BC-Tour-planning

Tour planning system for Microsoft Dynamics 365 Business Central with a Python FastAPI backend.  
The AL extension allows dynamic generation and optimization of delivery routes based on customers, sales orders, or shipments.  
The backend uses OpenRouteService for geocoding and route optimization.

---

## 📁 Project Structure

BC-Tour-planning/
│
├── backend/ # FastAPI backend for route optimization
├── al-app/ # AL extension for Business Central
├── test-data/ # Sample requests and responses
├── docs/ # API documentation
└── .github/ # CI/CD (GitHub Actions)

## 🚀 Setup

### 🔧 Backend (Python + FastAPI)

cd backend
python -m venv venv
source venv/bin/activate # On Windows: venv\Scripts\activate
pip install -r requirements.txt
cp .env.example .env # Add your OpenRouteService API key to the .env file

uvicorn main:app --reload

# → Your API will be available at:

# http://localhost:8000/route

### 🧩 AL Extension (Business Central)

1. Open the al-app/ folder in Visual Studio Code
2. Set up your connection to a Business Central sandbox or Docker container
3. Press F5 or use the "AL: Publish" command

→ After publishing, new actions are available in:

- Customer List
- Sales Orders
- → Action: "Plan Route"

## 📡 API Reference

### POST /route

#### Example Request

{
"stops": [
{"name": "Brandenburg Gate, Berlin"},
{"name": "Alexanderplatz, Berlin"}
],
"optimize": true
}

#### Example Response

{
"optimized_route": {
"order": ["Brandenburg Gate", "Alexanderplatz"],
"distance_km": 2.5,
"duration_min": 7.0,
"path": [[52.5163, 13.3777], [52.5219, 13.4132]]
}
}

## ⚙️ CI/CD (GitHub Actions)

Automatically triggered on each push or pull request:

- ✅ Backend: Dependency install, lint check (flake8), optional tests
- 🛠️ AL App: (optional, build with Docker + license file if needed)

## 🧪 Test Data

See the test-data/ folder:

- test-request.json
- sample-response.json

## 📄 License

MIT (feel free to modify)

---

## 👤 Author

**Publisher:** Freitagabend  
**Project Name:** BC-Tour-planning  
**Repository:** https://github.com/Freitagabend/BC-Tour-planning/
