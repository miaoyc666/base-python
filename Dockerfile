FROM python:3.9.2
MAINTAINER miaoyongchao "miaoyc1989@hotmail.com"

WORKDIR /home/s/apps/
COPY . .
RUN set -x \
    && echo "Asia/Shanghai" > /etc/timezone \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && cp -f sources.list /etc/apt/ \
    && apt-get update \
    && apt-get install -y vim \
    && apt-get install -y lrzsz \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /usr/share/doc && rm -rf /usr/share/man \
    && apt-get clean \
    && cp .bashrc ~ \
    && pip install -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt

CMD ["bash"]