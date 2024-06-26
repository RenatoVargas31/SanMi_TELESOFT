package com.example.sanmi_telesoft.filters;

import java.util.regex.Pattern;

public class Sanitizer {

    private static final Pattern[] PATTERNS = new Pattern[]{
            Pattern.compile("<"),
            Pattern.compile(">"),
            Pattern.compile("\""),
            Pattern.compile("'"),
            Pattern.compile("&")
    };

    private static final String[] REPLACEMENTS = new String[]{
            "&lt;",
            "&gt;",
            "&quot;",
            "&#x27;",
            "&amp;"
    };

    public static String sanitize(String input) {
        if (input == null) {
            return null;
        }
        String sanitized = input;
        for (int i = 0; i < PATTERNS.length; i++) {
            sanitized = PATTERNS[i].matcher(sanitized).replaceAll(REPLACEMENTS[i]);
        }
        return sanitized;
    }
}
