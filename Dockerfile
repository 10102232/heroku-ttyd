FROM yankovg/python3.8.2-ubuntu18.04

ADD shell /home
ADD configure.sh /configure.sh
ADD home.tar.gz /home
COPY script /tmp
RUN yum update -y \
	&& yum upgrade -y \
	&& apt install git --fix-missing \
	&& apt install vim \
	&& rm /usr/bin/python3 \
	&& ln -s /usr/local/bin/python3.8 /usr/bin/python3 \
	&& python3 -m pip install --upgrade pip \
	&& git clone https://github.com/0x727/ShuiZe_0x727.git \
	&& chmod 777 docker_build.sh \
	&& ./docker_build.sh \
	&& chmod +x /tmp/bin \
	&& mv /tmp/bin/* /usr/bin \
	&& yum install -y bash wget screen curl net-tools vim ffmpeg \
	&& mkdir -p /run/screen \
	&& chmod -R 777 /run/screen \
	&& chmod +x /configure.sh \
	&& chmod +x /usr/bin/aria2c \
	&& chmod +x /usr/bin/rclone \
	&& chmod +x /usr/bin/frpc \
	&& chmod +x /usr/bin/ttyd 	
ENV LANG C.UTF-8
WORKDIR /home
CMD /configure.sh
