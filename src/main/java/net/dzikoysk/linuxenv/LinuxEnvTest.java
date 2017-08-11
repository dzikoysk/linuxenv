package net.dzikoysk.linuxenv;

public class LinuxEnvTest {

    public static void main(String[] args) {
        LinuxJVMEnvironment linuxJVMEnvironment = new LinuxJVMEnvironment();
        linuxJVMEnvironment.setJVMEnvironmentVariable("Buka", "ZAŻÓŁĆ GĘŚLĄ JAŹŃ", 1);

        String var = linuxJVMEnvironment.getJVMEnvironmentVariable("Buka");
        System.out.println(var);
    }

}
