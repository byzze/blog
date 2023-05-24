#!/bin/bash

# 使用hugo编译生成public文件夹, 提供public文件内容即可部署博客内容, 本次使用github提供的byzze.github.io部署博客, 需要将public的文件内容上传到指定仓库git@github.com:byzze/byzze.github.io.git, 即可访问https://byzze.github.io/

# 迁移文件夹
cp -r public ../ && cd ../public

# 填写 Git 仓库信息
GIT_REPO="git@github.com:byzze/byzze.github.io.git"
GIT_BRANCH="master"
GIT_USERNAME="byzze"

# # 提交信息
COMMIT_MESSAGE="自动提交于 $(date)"
git init
# # 添加所有更改文件到 git
git add .

# # 提交更改
git commit -m "$COMMIT_MESSAGE"

# # 推送到远程分支
git push $GIT_REPO $GIT_BRANCH -f

# 设置作者信息
# git config user.name $GIT_USERNAME
# git config user.email $GIT_EMAIL

cd -
rm -rf public