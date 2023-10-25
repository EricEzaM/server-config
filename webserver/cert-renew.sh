#!/bin/bash
docker start certbot-renew
docker wait certbot-renew
docker exec nginx nginx -s reload