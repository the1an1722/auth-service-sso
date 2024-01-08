package com.shengliangyu.sso.controller;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@RestController
@EnableAutoConfiguration
@RequestMapping(value="/sso")
public class SSOController {

    // Using ConcurrentHashMap for thread safety during concurrent access.
    private Map<String, String> tokenStore = new ConcurrentHashMap<>();

    // User login endpoint
    @PostMapping("/login")
    public ResponseEntity<?> loginUser(@RequestBody Map<String, String> credentials) {
        // Assuming a method to validate user credentials exists
        if (validateCredentials(credentials.get("username"), credentials.get("password"))) {
            // If credentials are valid, generate a token
            String token = generateToken(credentials.get("username"));
            // Store the token and username mapping
            tokenStore.put(token, credentials.get("username"));
            // Return the token to the user
            return ResponseEntity.ok(token);
        } else {
            // If credentials are invalid, return an error
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid credentials");
        }
    }

    // User logout endpoint
    @PostMapping("/logout")
    public ResponseEntity<?> logoutUser(@RequestParam String token) {
        // Remove the token
        if (tokenStore.remove(token) != null) {
            // If logout is successful
            return ResponseEntity.ok("Logged out successfully");
        } else {
            // If the token is invalid or expired
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid or expired token");
        }
    }

    // Token validation endpoint
    @GetMapping("/validateToken")
    public ResponseEntity<?> validateToken(@RequestParam String token) {
        // Check if the token is valid
        if (tokenStore.containsKey(token)) {
            // If the token is valid
            return ResponseEntity.ok("Token is valid");
        } else {
            // If the token is invalid
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid or expired token");
        }
    }

    // Validate user credentials
    private boolean validateCredentials(String username, String password) {
        // Implement user validation logic, which may involve a database query
        return "admin".equals(username) && "adminpass".equals(password);
    }

    // Generate token
    private String generateToken(String username) {
        return username + "_" + System.currentTimeMillis();
    }
}