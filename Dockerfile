FROM ubuntu:18.04

RUN apt-get -y dist-upgrade
RUN apt-get update

RUN apt-get install cmake python python-pip yasm nasm doxygen wget unzip default-jdk pkg-config git
RUN pip install pystache six

#NDK
RUN wget -O android_ndk_r20.zip https://dl.google.com/android/repository/android-ndk-r20-linux-x86_64.zip?hl=zh-cn

RUN unzip android_ndk_r20.zip

ENV PATH=/android-ndk-r20:$PATH

RUN mkdir /android_sdk

#SDK tools
RUN wget -O sdk-tools.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip

RUN unzip -o sdk-tools.zip -d /android_sdk/

#Platform tools
RUN wget -O platform-tools.zip https://dl.google.com/android/repository/platform-tools-latest-linux.zip

RUN unzip -o platform-tools.zip -d /android_sdk/

#licenses
RUN mkdir /android_sdk/licenses
COPY android-sdk-license /android_sdk/licenses

ENV ANDROID_HOME=/platform_sdk

ENV PATH=$ANDROID_HOME:$PATH

#Time
ENV TW=Asia/Taipei
RUN ln -snf /usr/share/zoneinfo/$TW /etc/localtime && echo $TW > /etc/timezone

COPY entrypoint.sh /
