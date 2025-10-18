echo "SPEEDTEST_TRACKER_APP_KEY=base64:$(openssl rand -base64 32 | tr -d '\n')" >> .env && \
echo "MYSQL_ROOT_PASSWORD=$(openssl rand -base64 36 | tr -d '\n')" >> .env && \
echo "MYSQL_PASSWORD=$(openssl rand -base64 36 | tr -d '\n')" >> .env && \
echo "SEARXNG_SECRET=$(openssl rand -base64 32 | tr -d '\n')" >> .env
