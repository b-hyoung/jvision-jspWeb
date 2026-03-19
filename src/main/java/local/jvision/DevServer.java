package local.jvision;

import java.io.File;
import java.io.IOException;
import java.net.ServerSocket;

import org.apache.catalina.Context;
import org.apache.catalina.startup.Tomcat;

public final class DevServer {

    private DevServer() {
    }

    public static void main(String[] args) throws Exception {
        int requestedPort = Integer.parseInt(System.getProperty("port", "8080"));
        int port = findAvailablePort(requestedPort);
        String contextPath = System.getProperty("contextPath", "/BookMark");

        File webappDir = new File("src/main/webapp").getAbsoluteFile();
        if (!webappDir.isDirectory()) {
            throw new IllegalStateException("Webapp directory not found: " + webappDir);
        }

        Tomcat tomcat = new Tomcat();
        File workDir = new File("build/tomcat");
        workDir.mkdirs();
        tomcat.setBaseDir(workDir.getAbsolutePath());
        tomcat.setPort(port);
        tomcat.getConnector();

        Context context = tomcat.addWebapp(contextPath, webappDir.getAbsolutePath());
        context.setReloadable(true);

        tomcat.start();
        if (port != requestedPort) {
            System.out.println("Port " + requestedPort + " is busy, using " + port);
        }
        System.out.println("JSP server started");
        System.out.println("URL: http://localhost:" + port + contextPath + "/");
        tomcat.getServer().await();
    }

    private static int findAvailablePort(int startingPort) {
        for (int port = startingPort; port < startingPort + 20; port++) {
            try (ServerSocket ignored = new ServerSocket(port)) {
                return port;
            } catch (IOException ignored) {
            }
        }
        throw new IllegalStateException("No available port found from " + startingPort + " to " + (startingPort + 19));
    }
}
