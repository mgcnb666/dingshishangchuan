#!/bin/bash

# 要上传的文件夹路径
FOLDER_TO_UPLOAD="/home/user1/ceremonyclient/node/.config"

# 远程 Mega 目录
REMOTE_DIR="mega:fib2"

# 日志文件路径
LOG_FILE="/home/user1/nb66.log"

# 被排除的文件夹相对路径模式
EXCLUDE_PATTERN="store/**"

# 无限循环
while true; do
    echo "$(date): Starting upload..." >> "$LOG_FILE"
    
    # 打印调试信息
    echo "Excluding pattern: $EXCLUDE_PATTERN" >> "$LOG_FILE"
    echo "Source folder: $FOLDER_TO_UPLOAD" >> "$LOG_FILE"
    echo "Destination: $REMOTE_DIR" >> "$LOG_FILE"
    
    # 使用 rclone 上传文件夹，排除特定文件夹
    rclone copy "$FOLDER_TO_UPLOAD" "$REMOTE_DIR" --exclude "$EXCLUDE_PATTERN" >> "$LOG_FILE" 2>&1

    if [ $? -eq 0 ]; then
        echo "$(date): Folder uploaded to Mega successfully." >> "$LOG_FILE"
    else
        echo "$(date): Failed to upload folder to Mega." >> "$LOG_FILE"
    fi

    # 每隔10秒运行一次
    sleep 10
done
