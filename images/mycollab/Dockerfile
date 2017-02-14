# MyCollab installation
# 
# VERSION 1.0
#

FROM openjdk:8
MAINTAINER Lukas Pessl

ENV MYCOLLAB_VERSION=5.3.4

RUN apt-get update && apt-get -q -y install unzip tofrodos

RUN mkdir -p /opt/mycollab

RUN curl -L https://sourceforge.net/projects/mycollab/files/MyCollab_$MYCOLLAB_VERSION/MyCollab-All-$MYCOLLAB_VERSION.zip/download > /opt/mycollab/MyCollab-All-$MYCOLLAB_VERSION.zip

RUN unzip /opt/mycollab/MyCollab-All-$MYCOLLAB_VERSION.zip -d /opt/mycollab

# COPY scripts/mycollab /etc/init.d/mycollab

# WORKDIR /opt/mycollab/MyCollab-$MYCOLLAB_VERSION/bin

# RUN ln -s /opt/mycollab/MyCollab-$MYCOLLAB_VERSION/bin/startup.sh /etc/init.d/mycollab_start

# RUN chmod ugo+x /etc/init.d/mycollab

# RUN update-rc.d mycollab start
    
ADD scripts /opt/scripts
WORKDIR /opt/scripts
RUN chmod a+x *.sh

ENTRYPOINT ["/opt/scripts/entrypoint.sh"]