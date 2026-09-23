package com.shopmilk.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.shopmilk.service.UserService;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserService userService;

    @Autowired
    private PasswordEncoder passwordEncoder; // inject bean từ PasswordConfig

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        // Set dịch vụ tìm User và PasswordEncoder
        auth.userDetailsService(userService).passwordEncoder(passwordEncoder);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.csrf().disable()
            .authorizeRequests()
            
            // các resource không cần xác thực
            .antMatchers("/css/**", "/js/**", "/img/**", "/vendor/**",
                         "/fonts/**", "/summernote-0.8.18-dist/**").permitAll()

            // các url /admin/** cần đăng nhập
            .antMatchers("/admin/**").authenticated()

            .and()
            .logout()
            .logoutUrl("/perform_logout")
            .logoutSuccessUrl("/home")
            .invalidateHttpSession(true)
            .deleteCookies("JSESSIONID")
            .permitAll()

            .and()
            .formLogin()
            .loginPage("/login")
            .loginProcessingUrl("/perform_login")
            .defaultSuccessUrl("/home", true)
            .failureUrl("/login?login_error=true")
            .permitAll();
    }

    // đổi pass thật sang hash code tại đây
    public static void main(String[] args) {
        System.out.println("encrypt password: ");
        System.out.println(new org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder(8).encode("123456"));
    }
}