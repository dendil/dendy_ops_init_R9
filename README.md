[TOC]



## Get started
only for Cents7
## Install Git

```bash
yum install git -y
[ -L /tmp/dendy_ops_init_C7  ] && rm -fr /tmp/dendy_ops_init_C7
t_dir=`mktemp -d -t  den_ops.XXXXXX` &&  ln -s $t_dir /tmp/dendy_ops_init_C7
git clone https://github.com/dendil/dendy_ops_init_C7.git $t_dir
cd  /tmp/dendy_ops_init_C7
find . -name '*.sh' -exec chmod u+x {} \;

bash init.sh out


bash init.sh main        (国内)
bash init.sh out         (国外)
bash init.sh ssh_safe    (ssh 安全化)
bash init.sh ssh_FP      (ssh防爆破)
bash init.sh HideVersion (HideVersion)
bash init.sh synctime    (time_sync)
bash init.sh close_iptables
bash init.sh update_ops  (更新)
bash init.sh add_scan_sshd 







```



## Init centos7

初始化项目

 - 关闭selinux
 - 关闭防火墙
 - 安装本插件
 - 添加sudo用户
 - 更改sshd配置
 - 扩大文件描述符
 - 同步时间并启动时间同步服务chrony
 - 配置国内阿里yum源 epel
 - 安装工具　 lrzsz dos2unix ntp gcc bc rsync chrony vim wget bash-completion lrzsz nmap nc tree htop iftop net-tools python3  yum-utils curl bind-utils unzip mtr




## Set New Hostname
```bash

hostname-s  <newhostname>

```



### Install Nginx
```bash
#编译安装最新版nginx
install_nginx

/opt/dendyops/components/nginx/install_nginx.sh

```


### Use HW Yum repo

```bash

# 建议用华为源
use_hw_yum_repo

/opt/dendyops/components/yum/use_huawei_yum_repo.sh

```



### Install Docker CE

Install Docker latest version:

```bash
/opt/dendyops/components/docker/install_docker_ce.sh
/opt/dendyops/components/docker/install_docker_ce.sh /services
#国外服务器用out
/opt/dendyops/components/docker/install_docker_ce_out.sh 
/opt/dendyops/components/docker/install_docker_ce_out.sh  /services
```




### Install Docker Compose

```bash
# Install default Docker Compose (Docker Compose 1.24.0)
/opt/dendyops/components/docker-compose/install_docker_compose.sh

#国外服务器 from github
/opt/dendyops/components/docker-compose/install_docker_compose_from_github.sh
# Install specific Docker Compose version
# /opt/dendyops/components/docker-compose/install_docker_compose.sh 1.24.0
/opt/dendyops/components/docker-compose/install_docker_compose.sh <version>
```
### Add juna PublicKey
```bash
/opt/dendyops/components/juna/pubkey/add_keys.sh


```



### Install tools

Install some basic tools, e.g. wget, vim, etc.

```bash
/opt/dendyops/components/tools/install_tools.sh
```

## Increase ulimit

```bash
/opt/dendyops/components/utils/increase_ulimit.sh
```



### Set `ntp` time sync

```bash
# Recommend to set ntp time sync with chrony
/opt/dendyops/components/timedate/sync_timedate_chrony.sh

# Or set ntp time sync with ntp
/opt/dendyops/components/timedate/sync_timedate_ntp.sh
```



### Install OpenJDK

Install OpenJDK8:

```bash
/opt/dendyops/components/openjdk/install_openjdk8.sh
```

### Install Jenkins

> Make sure OpenJDK8 is installed

Install Jenkins by Jenkins Yum repo:

```bash
/opt/dendyops/components/jenkins/install_jenkins.sh
```



Or install Jenkins by Jenkins mirror:

```bash
/opt/dendyops/components/jenkins/install_jenkins_rpm.sh
```



### Install Build Tools

### Install Gradle

```bash
# Install default Gradle (Gradle5.4)
/opt/dendyops/components/gradle/install_gradle.sh

# Install specific Gradle version
# Example: /opt/dendyops/components/gradle/install_gradle.sh 4.6
/opt/dendyops/components/gradle/install_gradle.sh <version>
```



### Install Maven

```bash
# Install default Maven (Maven3.6.0)
/opt/dendyops/components/maven/install_maven.sh

# Install specific Maven version
# /opt/dendyops/components/maven/install_maven.sh 3.5.0
/opt/dendyops/components/maven/install_maven.sh <version>
```



### Install GitLab CE

Install GitLab CE with HTTP:

```bash
# /opt/dendyops/components/gitlab/install_gitlab_ce_http.sh gitlab.xdevops.cn
/opt/dendyops/components/gitlab/install_gitlab_ce_http.sh <gitlab_domain>
```



Install GitLab CE with HTTPS using manual SSL cert:

```bash
# /opt/dendyops/components/gitlab/install_gitlab_ce_https.sh gitlab.xdevops.cn "/C=CN/ST=Guangdong/L=Guangzhou/O=xdevops/OU=xdevops/CN=gitlab.xdevops.cn"
/opt/dendyops/components/gitlab/install_gitlab_ce_https.sh <gitlab_domain> <ssl_cert_subj>
```



Configure HTTPS for an existing HTTP GitLab CE using manual SSL cert:

```bash
# Set domain name mapping in host file if necessary
# echo "$(/opt/dendyops/components/utils/get_ip.sh) gitlab.xdevops.cn" >> /etc/hosts
echo "$(/opt/dendyops/components/utils/get_ip.sh) <gitlab_domain>" >> /etc/hosts

# /opt/dendyops/components/gitlab/configure_gitlab_ce_manual_ssl.sh gitlab.xdevops.cn "/C=CN/ST=Guangdong/L=Guangzhou/O=xdevops/OU=xdevops/CN=gitlab.xdevops.cn"
/opt/dendyops/components/gitlab/configure_gitlab_ce_manual_ssl.sh <gitlab_domain> <ssl_cert_subj>
```



> Even throuh GitLab integrate Letsencrypt natively, but I have encountered a Letsencrypt error when run `gitlab-ctl reconfigure` and haven't resolved it, so I have to use manual SSL cert at this moment.







### Install Harbor

```bash
# Install default Harbor (Harbor 1.8.0)
/opt/dendyops/components/harbor/install_harbor.sh

# Install specific Harbor version,e.g Harbor 1.7.5
# /opt/dendyops/components/harbor/install_harbor.sh 1.7 5
/opt/dendyops/components/harbor/install_harbor_in_k8s.sh 1.8 3 180 harbor.od.com harbor.od.com
/opt/dendyops/components/harbor/install_harbor.sh <major_version> <minor_version>
```



