from fastapi import FastAPI, Response
from fastapi.responses import FileResponse, PlainTextResponse
from prometheus_client import Counter, generate_latest, CONTENT_TYPE_LATEST
from datetime import datetime
import pytz

app = FastAPI()

# counters
gandalf_counter = Counter("gandalf_requests_total", "Total requests to /gandalf")
colombo_counter = Counter("colombo_requests_total", "Total requests to /colombo")

@app.get("/gandalf")
def get_gandalf():
    gandalf_counter.inc()
    return FileResponse("gandalf.jpg")

@app.get("/colombo")
def get_colombo_time():
    colombo_tz = pytz.timezone("Asia/Colombo")
    now = datetime.now(colombo_tz)
    colombo_counter.inc()
    return PlainTextResponse(now.strftime("%Y-%m-%d %H:%M:%S"))

@app.get("/metrics")
def metrics():
    return Response(generate_latest(), media_type=CONTENT_TYPE_LATEST)
