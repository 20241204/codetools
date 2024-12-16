#!/bin/bash

# 定义GitLab用户名和个人访问令牌
GITLAB_USER="UiLgNoDkOoLtUo"
GITLAB_TOKEN="xxxxx-IVv-7xV4C0GsXL3LzwD4"

# 配置Git全局用户信息
git config --global user.email "UiLgNoD-kOoLtUo@outlook.com"
git config --global user.name "UiLgNoDkOoLtUo"

# 定义要创建的仓库名称数组
REPO_NAMES=("UiLgNoDkOoLtUo" "Beauty-pictures-crawling" "Boss-Direct-Hiring-Batch-Communication-Script" "Divination-python-script-for-I-Ching" "Proxy-script-for-system" "Sing-Box-Ubuntu-CI_CD-Pipelines" "codetools" "docker-amd64-custom-ubuntu-topfreeproxies" "docker-amd64-ubuntu-resilio-sync" "docker-arch-miniforge-jupyter" "docker-arch-pyenv-jupyter" "docker-arch-samba" "docker-arch-test" "golearn" "mihomo-script-for-system" "s-c-f-serv00" "virtual-qemu-raspberry-script")

# 循环遍历每个仓库名称
for REPO_NAME in "${REPO_NAMES[@]}"
do
    # 创建GitLab公开仓库
    curl --header "Private-Token: $GITLAB_TOKEN" --data "name=$REPO_NAME&visibility=public" "https://gitlab.com/api/v4/projects"

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
    # gitlab 手动输入用户名密码认证推送
    # git remote add origin https://gitlab.com/$GITLAB_USER/$REPO_NAME.git
    # gitlab 配置好 ssh key 认证推送
    git remote add origin git@gitlab.com:$GITLAB_USER/$REPO_NAME.git
    git push -u origin master
    # 配置 gitlab 远程 URL
    git remote set-url origin git@gitlab.com:$GITLAB_USER/$REPO_NAME.git
    # 返回上一级目录
    cd ..
done
