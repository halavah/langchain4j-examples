#!/bin/sh

# 自动修复当前脚本的权限
if [ ! -x "$0" ]; then
    chmod +x "$0"
    echo "Fixed script permissions. Restarting..."
    exec "$0" "$@"
fi

# 获取脚本所在目录
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
GITHUB_DIR="$SCRIPT_DIR/.github"

# 主循环
while true; do
    clear
    echo ""
    echo "═══════════════════════════════════════════════════════════"
    echo "  项目管理"
    echo "═══════════════════════════════════════════════════════════"
    echo ""
    echo "  0. 部署到 Git        (deploy.sh)"
    echo "     → 自动提交并推送代码到远程仓库"
    echo ""
    echo "  1. 清理 Git 跟踪     (clear-ignore.sh)"
    echo "     → 根据 .gitignore 移除已跟踪的文件"
    echo ""
    echo "  2. 压缩 Git 仓库     (clear-git.sh)"
    echo "     → 优化 .git 目录，减小体积（保留所有历史）"
    echo ""
    echo "  3. 清理 Git 历史     (clear-history.sh)"
    echo "     → 删除旧提交，仅保留最近 N 个（需谨慎）"
    echo ""
    echo "═══════════════════════════════════════════════════════════"
    echo ""
    echo "  9. 退出"
    echo ""
    echo "═══════════════════════════════════════════════════════════"
    echo ""
    printf "请选择操作 [0-3,9] (默认: 0 - 部署): "
    read choice

    # 如果用户直接按回车，默认选择 0
    choice=${choice:-0}

    case "$choice" in
        0)
            clear
            echo "Starting Deploy..."
            echo ""
            bash "$GITHUB_DIR/deploy.sh"
            echo ""
            read -p "按 Enter 返回主菜单" dummy
            ;;
        1)
            clear
            echo "Starting Clear Ignore..."
            echo ""
            bash "$GITHUB_DIR/clear-ignore.sh"
            echo ""
            read -p "按 Enter 返回主菜单" dummy
            ;;
        2)
            clear
            echo "Starting Clear Git..."
            echo ""
            bash "$GITHUB_DIR/clear-git.sh"
            echo ""
            read -p "按 Enter 返回主菜单" dummy
            ;;
        3)
            clear
            echo "Starting Clear History..."
            echo ""
            bash "$GITHUB_DIR/clear-history.sh"
            echo ""
            read -p "按 Enter 返回主菜单" dummy
            ;;
        9)
            echo ""
            echo "再见！"
            exit 0
            ;;
        *)
            echo ""
            echo "错误: 无效的选项"
            sleep 2
            ;;
    esac
done
