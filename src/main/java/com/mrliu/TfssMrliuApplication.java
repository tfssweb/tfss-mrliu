package com.mrliu;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
//扫面mybatis mapper所在包(包含自动生成的mapper和手写的mapper)
@MapperScan("com.mrliu.*.mapper")
//扫描所有需要的包，包括工具类包
@ComponentScan(basePackages={"com.mrliu","org.n3r.idworker"})
//开启定时任务
@EnableScheduling
//开启异步调用
@EnableAsync
public class TfssMrliuApplication {

	public static void main(String[] args) {
		SpringApplication.run(TfssMrliuApplication.class, args);
	}
}
