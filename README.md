# Reverse proxy for chen-henry.org

This setup routes:
- chess.chen-henry.org -> port 8001
- math.chen-henry.org -> port 8000
- app.chen-henry.org -> port 3000

## DNS
Create these A records on your domain provider for the server IP:
- chess.chen-henry.org -> <SERVER_IP>
- math.chen-henry.org -> <SERVER_IP>
- app.chen-henry.org -> <SERVER_IP>

## Run
1. Make sure your apps are already running on ports 8001 and 8000.
2. Start the proxy:
   docker compose up -d
3. Verify:
   docker compose ps
   docker compose logs --tail=100 nginx

If your apps are not running on the same machine as Docker, replace `host.docker.internal` in `nginx/nginx.conf` with the actual IP address of the machine that hosts the apps.
