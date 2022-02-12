FROM ubuntu:20.04
#FROM alpine:3.14
#RUN apt-get update && apt-get install -qq -y libglew2.0
#ENV HOME /root
ENV TZ=Canada/Pacific
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update -y && apt-get install -y\
 default-jdk\
 libfindbin-libs-perl\
 unzip
RUN apt-get install -y wget
RUN wget -q "https://github.com/deepmind/mujoco/releases/download/2.1.1/mujoco-2.1.1-linux-x86_64.tar.gz"
RUN wget -q "https://github.com/deepmind/mujoco/releases/download/2.1.1/mujoco-2.1.1-linux-x86_64.tar.gz.sha256"
ENV MUJOCO_DIR = '$HOME/.mujoco'
RUN mkdir -p "{MUJOCO_DIR}"
RUN tar -zxf "mujoco-2.1.1-linux-x86_64.tar.gz" -C "{MUJOCO_DIR}"
ENV LD_LIBRARY_PATH='$HOME/.mujoco/mujoco211_linux/bin/'
# ~/.mujoco/mujoco211_linux/bin/
ENV MUJOCO_GL=glfw
RUN set -xe \
    && apt-get update -y \
    && apt-get install -y python3-pip
RUN pip install --upgrade pip
#RUN pip install  git+https://github.com/navidyou/dm_control.git#egg=dm_control>=0.0.416848645
RUN pip install -q dm_control>=0.0.416848645
COPY . /walkerwalks
WORKDIR $HOME
RUN echo $HOME
ENTRYPOINT ["python3"]
CMD ["/walkerwalks/main.py"]
