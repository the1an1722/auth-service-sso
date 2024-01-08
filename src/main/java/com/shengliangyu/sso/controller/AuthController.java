package com.shengliangyu.sso.controller;

import com.shengliangyu.sso.dto.JwtAuthenticationResponse;
import com.shengliangyu.sso.dto.LoginRequest;
import com.shengliangyu.sso.security.JwtTokenProvider;
import com.shengliangyu.sso.service.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
public class AuthController {
    private final JwtTokenProvider tokenProvider;
    private final UserService userService;

    public AuthController(JwtTokenProvider tokenProvider, UserService userService) {
        this.tokenProvider = tokenProvider;
        this.userService = userService;
    }

    @PostMapping("/login")
    public ResponseEntity<?> authenticateUser(@RequestBody LoginRequest loginRequest) {
        if (userService.validateUser(loginRequest.getUsername(), loginRequest.getPassword())) {
            String jwt = tokenProvider.generateToken(loginRequest.getUsername());

            JwtAuthenticationResponse response = new JwtAuthenticationResponse();
            response.setToken(jwt);

            return ResponseEntity.ok(response);
        } else {
            // Handle login failure case
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Login failed: Invalid username or password");
        }
    }
}