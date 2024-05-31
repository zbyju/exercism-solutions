public class LogLevels {
    public static String message(String logLine) {
        String[] parts = logLine.split(": ", 2);
        if (parts.length > 1) {
            return parts[1].trim();
        }
        return "";
    }

    public static String logLevel(String logLine) {
        String[] parts = logLine.split("]: ", 2);
        if (parts.length > 0) {
            return parts[0].substring(1).toLowerCase();
        }
        return "";
    }

    public static String reformat(String logLine) {
        String message = message(logLine);
        String logLevel = logLevel(logLine);
        return String.format("%s (%s)", message, logLevel);
    }
}