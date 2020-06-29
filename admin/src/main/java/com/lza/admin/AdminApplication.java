package com.lza.admin;

import com.lza.common.feign.annotation.EnableZaFeignClients;
import com.lza.common.security.annotation.EnableZaResourceServer;

import org.springframework.boot.SpringApplication;

import org.springframework.cloud.client.SpringCloudApplication;


@SpringCloudApplication
@EnableZaResourceServer
@EnableZaFeignClients

public class AdminApplication {

    public static void main(String[] args) {
        SpringApplication.run(AdminApplication.class, args);
    }

}
