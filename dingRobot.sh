#!/bin/bash

WEBHOOK_URL=$1

echo "$WEBHOOK_URL"

START_DATE="2025-03-05"
START_NUM=1920
INCREMENT=60
CURRENT_DATE=$(date +"%Y-%m-%d")
DAYS_DIFF=$(( ( $(date -d "$CURRENT_DATE" +%s) - $(date -d "$START_DATE" +%s) ) / 86400 ))
NEW_NUM=$(( START_NUM + DAYS_DIFF * INCREMENT ))

JSON_PAYLOAD=$(cat <<EOF
{
    "msgtype": "text",
    "text": {
        "content": "【LEMON】\n今天日期是$CURRENT_DATE\n今天的雀魂签到成功啦\n理论上目前有 $NEW_NUM 魂玉，明天再来吧~"
    }
}
EOF
)

response=$(curl -s -X POST "$WEBHOOK_URL" \
    -H "Content-Type: application/json" \
    -d "$JSON_PAYLOAD")

echo "Response: $response"
