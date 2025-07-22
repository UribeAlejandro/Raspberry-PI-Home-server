echo "PG_PASS=$(openssl rand -base64 36 | tr -d '\n')" >> .env && \
echo "AUTHENTIK_SECRET_KEY=$(openssl rand -base64 60 | tr -d '\n')" >> .env && \
echo "SPEEDTEST_TRACKER_APP_KEY=base64:$(openssl rand -base64 32 | tr -d '\n')" >> .env

