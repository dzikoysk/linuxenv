# LinuxEnv
Modify JVM environment variables on Linux at runtime

#### Usage
Add generated jar file as a library to your Java project 
and put liblinuxenv.so in application's working directory 
(or in the specifed custom location by `-Djava.library.path` VM option)

```java
public class LinuxEnvTest {

    public static void main(String[] args) {
        LinuxJVMEnvironment linuxJVMEnvironment = new LinuxJVMEnvironment();
        linuxJVMEnvironment.setJVMEnvironmentVariable("Buka", "ZAŻÓŁĆ GĘŚLĄ JAŹŃ", 1); // UTF-8 Support
        
        String var = linuxJVMEnvironment.getJVMEnvironmentVariable("Buka");
        System.out.println(var);
    }

}
```

LinuxEnv changes JVM environment variables. `System.getenv()` contains their copy 
which is loaded when our application starts. You can manually update that map 
by reflections after any modifications to maintain consistency. 
However, it's not necessary if you don't want to use these variables from Java.

#### Build
* Linux Environment
* JDK8

Default JDK8 location in the configuration section of `build.sh` file is set to:
```bash
JDK_LOCATION = /usr/lib/jvm/java-8-oracle
```

You can execute `build.sh` manually or by maven build. Generated files are placed in `dist` directory. 
