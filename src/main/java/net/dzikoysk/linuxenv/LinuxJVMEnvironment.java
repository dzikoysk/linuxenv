package net.dzikoysk.linuxenv;

public class LinuxJVMEnvironment {

    public LinuxJVMEnvironment() {
        System.loadLibrary("linuxenv");
    }

    public native int unsetJVMEnvironmentVariable(String name);

    public native int setJVMEnvironmentVariable(String name, String value, int overwrite);

    public native String getJVMEnvironmentVariable(String name);

}