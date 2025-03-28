# BC-Tour-planning

Tour planning system for Microsoft Dynamics 365 Business Central with a Python FastAPI backend.  
The AL extension allows dynamic generation and optimization of delivery routes based on customers, sales orders, or shipments.  
The backend uses OpenRouteService for geocoding and route optimization.

---

## 📁 Project Structure

- backend/ – FastAPI backend for route optimization
- al-app/ – AL extension for Microsoft Business Central
- test-data/ – Sample request/response JSON files
- docs/ – API documentation
- .github/ – CI/CD workflow (GitHub Actions)

---

## 🚀 Setup

### 🔧 Backend (Python + FastAPI)

1. Navigate to the backend directory:

   ```
   cd backend
   ```

2. Create and activate virtual environment:

   - macOS/Linux:
     ```
     python -m venv venv
     source venv/bin/activate
     ```
   - Windows:
     ```
     python -m venv venv
     venv\Scripts\activate
     ```

3. Install dependencies:

   ```
   pip install -r requirements.txt
   ```

4. Copy example environment file and add your OpenRouteService API key:

   ```
   cp .env.example .env
   ```

5. Run the API:
   ```
   uvicorn main:app --reload
   ```

API will be available at: http://localhost:8000/route

---

### 🧩 AL Extension (Business Central)

1. Open `al-app/` in Visual Studio Code
2. Connect to your BC sandbox or container
3. Press `F5` or use `AL: Publish`

After publishing, new actions will be available in:

- Customer List
- Sales Orders  
  → Action: "Plan Route"

---

## 📡 API Reference

### POST /route

**Example Request**

```json
{
  "stops": [
    { "name": "Brandenburg Gate, Berlin" },
    { "name": "Alexanderplatz, Berlin" }
  ],
  "optimize": true
}
```

**Example Response**

```json
{
  "optimized_route": {
    "order": ["Brandenburg Gate", "Alexanderplatz"],
    "distance_km": 2.5,
    "duration_min": 7.0,
    "path": [
      [52.5163, 13.3777],
      [52.5219, 13.4132]
    ]
  }
}
```
