FROM ubuntu:20.04
RUN apt-get update -y
RUN apt-get install -y libglew2.0
RUN wget -q "https://github.com/deepmind/mujoco/releases/download/2.1.1/mujoco-2.1.1-linux-x86_64.tar.gz"
RUN wget -q "https://github.com/deepmind/mujoco/releases/download/2.1.1/mujoco-2.1.1-linux-x86_64.tar.gz.sha256"
ENV MUJOCO_DIR = '$HOME/.mujoco'
RUN mkdir -p "{MUJOCO_DIR}"
RUN tar -zxf {MUJOCO_ARCHIVE} -C "{MUJOCO_DIR}"
ENV MUJOCO_GL=glfw
RUN pip install  git+https://github.com/navidyou/dm_control.git#egg=dm_control>=0.0.416848645
ENTRYPOINT ["python"]
CMD ["main.py"]
