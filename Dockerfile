FROM alpine:3.5

# Install necessary tools using apk
RUN apk update && apk add curl

# Create the directory for Ant
RUN mkdir -p /opt/ant/

# Download Ant using curl
RUN curl -L http://archive.apache.org/dist/ant/binaries/apache-ant-1.9.8-bin.tar.gz -o /opt/ant/apache-ant-1.9.8-bin.tar.gz

# Unpack Ant
RUN tar -xvzf /opt/ant/apache-ant-1.9.8-bin.tar.gz -C /opt/ant/

# Remove tar file
RUN rm -f /opt/ant/apache-ant-1.9.8-bin.tar.gz
#Drop Sonarqube lib
RUN wget http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-ant-task/2.3/sonar-ant-task-2.3.jar -P /opt/ant/apache-ant-1.9.8/lib/
#Install JDK 1.8
RUN apk --update add openjdk8
#Install GIT
RUN apk --update add git
#Install Curl
RUN apk --update add curl
#Setting Ant Home
ENV ANT_HOME=/opt/ant/apache-ant-1.9.8
#Setting Ant Params
ENV ANT_OPTS="-Xms256M -Xmx512M"
#Updating Path
ENV PATH="${PATH}:${HOME}/bin:${ANT_HOME}/bin"
