# 基于基础镜像构建：java8_centos7.4
FROM harbor.eniot.io/envisioniot/java8:latest

# MAINTAINER 
MAINTAINER xiaomin.zhou <xiaomin.zhou@envision-digital.com>

# 定义环境变量
ENV APP_NAME ecp-service
ENV APP_HOME /home/envuser

# 创建APP相关目录，请根据实际情况修改
RUN mkdir -p $APP_HOME/bin $APP_HOME/logs $APP_HOME/conf

# 复制文件夹
COPY ./target/* $APP_HOME/bin/
COPY ./startup.sh $APP_HOME/

# 指定工作目录
WORKDIR $APP_HOME

# 执行命令，改变文件权限
RUN chmod 755 startup.sh

ENTRYPOINT ["bash","./startup.sh"]
