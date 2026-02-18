package com.githubaction.controller;

import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;



@RestController
public class TestController {
   

     @GetMapping
    public Map message(){
        Map<String,String> obj=new HashMap<>();
        obj.put("Name", "Navanth doke");
        obj.put("status", "sucesss");
        return obj;
    }

}
