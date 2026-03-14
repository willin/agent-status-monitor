#!/bin/bash
# check-cursor.sh - 检查 Cursor IDE 运行状态
# 用法：./check-cursor.sh

set -e

COLOR_RESET="\033[0m"
COLOR_GREEN="\033[32m"
COLOR_YELLOW="\033[33m"
COLOR_BLUE="\033[34m"

echo -e "${COLOR_BLUE}--- Cursor IDE 状态 ---${COLOR_RESET}"

# 检查进程（排除系统进程）
# 真正的 Cursor IDE 进程会包含 "Code Helper" 或路径中有 "Cursor.app"
CURSOR_PROCS=$(ps aux | grep -i "cursor" | grep -v grep | grep -E "(Cursor\.app|Code Helper|cursor\.exe)" | wc -l | tr -d ' ')

if [ "$CURSOR_PROCS" -gt 0 ]; then
    echo -e "${COLOR_GREEN}● Cursor IDE${COLOR_RESET}: 运行中 ($CURSOR_PROCS 个进程)"
else
    echo -e "${COLOR_YELLOW}○ Cursor IDE${COLOR_RESET}: 未运行"
fi
