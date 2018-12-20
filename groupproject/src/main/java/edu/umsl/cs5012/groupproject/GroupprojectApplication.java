package edu.umsl.cs5012.groupproject;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@SpringBootApplication
public class GroupprojectApplication implements WebMvcConfigurer{

	public static void main(String[] args) {
		SpringApplication.run(GroupprojectApplication.class, args);
	}
	
	

}
