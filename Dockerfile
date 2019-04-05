FROM ubuntu:18.04
RUN apt-get update && apt-get install -y software-properties-common && add-apt-repository -y ppa:webupd8team/java
RUN apt-get update && echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && apt-get install -y oracle-java8-installer
RUN apt-get install -y vim && apt-get install -y net-tools && apt-get install -y iputils-ping && apt-get -y install git-core
ADD apache-ant-1.10.5-bin.tar.gz /opt
ADD apache-maven-3.6.0-bin.tar.gz /opt/
RUN ln -s /opt/apache-ant-1.10.5 /opt/ant && \
ln -s /opt/apache-maven-3.6.0 /opt/maven && \
echo '\
export ANT_HOME=/opt/ant\n\
export PATH=${ANT_HOME}/bin:${PATH}\n\
' > /etc/profile.d/ant.sh && chmod +x /etc/profile.d/ant.sh && \
echo '\
export M2_HOME=/opt/maven\n\
export MAVEN_HOME=/opt/maven\n\
export PATH=${M2_HOME}/bin:${PATH}\n\
' > /etc/profile.d/maven.sh && chmod +x /etc/profile.d/maven.sh && \
echo '\
if [ -z $JAVA_HOME ]; then\n\
	. /etc/profile.d/jdk.sh\n\
fi\n\
if [ -z $ANT_HOME ]; then\n\
	. /etc/profile.d/ant.sh\n\
fi\n\
if [ -z $M2_HOME ]; then\n\
	. /etc/profile.d/maven.sh\n\
fi\n\
' >> /root/.bashrc

