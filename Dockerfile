FROM debian:jessie

ENV AIR_SDK_VERSION=23.0.0.57
ENV AIR_SDK_DOWNLOAD_URL=http://airdownload.adobe.com/air/win/download/23.0/AIRSDK_Compiler.zip

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list.d/webupd8team-java.list \
	&& apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886 \
	&& dpkg --add-architecture i386 \
	&& apt-get update \
	&& echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
	&& apt-get install -y \
		oracle-java8-installer \
		unzip \
		wget \
		wine \
		wine32 \
	&& mkdir /opt/air_sdk && cd /opt/air_sdk \
	&& wget ${AIR_SDK_DOWNLOAD_URL} -O archive.zip \
	&& unzip archive.zip && rm archive.zip

COPY ./adl /opt/air_sdk/bin/

