#!/bin/bash

#------------------#
#      CONFIG      #
#------------------#

# JDK 8 location
if [ ! -v JDK_LOCATION ]; then
  if [ -d /usr/lib/jvm/default ]; then
    JDK_LOCATION="/usr/lib/jvm/default"
  elif [ -d /usr/lib/jvm/java-8-oracle]; then
    JDK_LOCATION="/usr/lib/jvm/java-8-oracle"
  elif [ -d /usr/lib/jvm/java-8-openjdk]; then
    JDK_LOCATION="/usr/lib/jvm/java-8-openjdk"
  else
    echo "Cannot find jdk location."
    exit 1
  fi
fi


#-------------------#
#       BUILD       #
#-------------------#

# Compile jni interface
mkdir -p dist/production
javac -d dist/production src/main/java/net/dzikoysk/linuxenv/LinuxJVMEnvironment.java

# Generate jni header
cd dist
javah -cp production -d production net.dzikoysk.linuxenv.LinuxJVMEnvironment

# Generate jar & native library
jar cvf LinuxEnv.jar production/net/dzikoysk/linuxenv/LinuxJVMEnvironment.class
g++ -I"$JDK_LOCATION/include" -I"$JDK_LOCATION/include/linux" -o liblinuxenv.so -shared ../src/main/native/net_dzikoysk_linuxenv_LinuxJVMEnvironment.cc -fPIC -lstdc++
