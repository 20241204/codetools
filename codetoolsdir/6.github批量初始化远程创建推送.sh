#!/bin/bash

# 定义GitHub用户名和个人访问令牌
GITHUB_USER="UiLgNoDkOoLtUo"
GITHUB_TOKEN="ghp_v7xV4C0GsXL3LzwD4IVv7xV4C0GsXL3LzwD4"

# 配置Git全局用户信息
git config --global user.email "UiLgNoD-kOoLtUo@outlook.com"
git config --global user.name "UiLgNoDkOoLtUo"

# 定义要创建的仓库名称数组
REPO_NAMES=("20241204" "BeautyFetcher" "BossMatchJobHunter" "DivinationMaster" "ProxyScriptSingbox" "ProxyBridge" "codetools" "docker-arch-sub-topfreeproxies" "docker-amd64-ubuntu-resilio-sync" "docker-arch-miniforge-jupyter" "docker-arch-pyenv-jupyter" "docker-arch-samba" "docker-arch-test" "golearn" "ProxyScriptMihomo" "s-c-f-serv00" "virtual-qemu-raspberry-script")

# 循环遍历每个仓库名称
for REPO_NAME in "${REPO_NAMES[@]}"
do
    # 创建GitHub仓库
    curl -u "$GITHUB_USER:$GITHUB_TOKEN" https://api.github.com/user/repos -d "{\"name\":\"$REPO_NAME\"}"

    # 初始化本地Git仓库
    mkdir -pv $REPO_NAME
    git config --global --add safe.directory $REPO_NAME
    cd $REPO_NAME
    git init

    # 添加README文件
    echo "# $REPO_NAME" > README.md
    git add README.md
    git commit -m "Initial commit"

    # 添加远程仓库并推送
    # github 手动输入用户名密码认证推送
    # git remote add origin https://github.com/$GITHUB_USER/$REPO_NAME.git
    # github 配置好 ssh key 认证推送
    git remote add origin git@github.com:$GITHUB_USER/$REPO_NAME.git
    git push -u origin master
    # 配置 github 远程 URL
    git remote set-url origin git@github.com:$GITHUB_USER/$REPO_NAME.git
    # 返回上一级目录
    cd ..
done
