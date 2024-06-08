#!/bin/bash

# 要上传的文件路径
FILE_TO_UPLOAD="/home/shadeform/.nosana"

# 远程 Mega 目录
REMOTE_DIR="在系统上创建的rclone用户名:云盘上的文件夹名称"

# 日志文件路径
LOG_FILE="/root/nb66.log"

# 无限循环
while true; do
    echo "$(date): Starting upload..." >> "$LOG_FILE"
    
    # 使用 rclone 上传文件，覆盖同名文件
    rclone copy "$FILE_TO_UPLOAD" "$REMOTE_DIR" >> "$LOG_FILE" 2>&1

    if [ $? -eq 0 ]; then
        echo "$(date): File uploaded to Mega successfully." >> "$LOG_FILE"
    else
        echo "$(date): Failed to upload file to Mega." >> "$LOG_FILE"
    fi

    # 每隔3600秒运行一次
    sleep 3600
done
