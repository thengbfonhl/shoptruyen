package com.shopmilk.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
public class WebMVCConfig implements WebMvcConfigurer {

    @Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/jsp/");
        resolver.setSuffix(".jsp");
        return resolver;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // Phục vụ static resources
        registry.addResourceHandler("/static/**")
                .addResourceLocations("classpath:/static/");
        // Nếu cần css riêng
        // registry.addResourceHandler("/css/**").addResourceLocations("classpath:/css/").setCachePeriod(31556926);
    }

    // Không cần configureDefaultServletHandling
}