//package com.shengliangyu.sso.controller;
//
//import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.List;
//
//@RestController
//@EnableAutoConfiguration
//@RequestMapping(value="api/test")
//public class Test {
//
//    @GetMapping(path="/message", produces={"application/json"})
//    public ResponseEntity<String> getTestMessage() {
//        String resString = "Hello, World";
//        return ResponseEntity.badRequest().body(resString);
////        return ResponseEntity.ok(resString);
//    }
//
//    @GetMapping(path="/Message", produces={"application/json"})
//    public String getTestMessage2() {
//        String resString = "Hello, World, again!";
//        return resString;
//    }
//
//    @GetMapping(path="/add", produces={"application/json"})
//    public String addTestMessage(
//            @PathVariable(name = "userId") int userId) {
//        String res;
//        if (userId > 10) {
//            res = "Id is too large";
//        } else {
//            res = "Id is good";
//        }
//
//        res += " -:- " + userId;
//
//        return res;
//    }
//}
