package com.gyull.cookivel.security.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import com.gyull.cookivel.security.service.CustomUserDetailsService;

import lombok.Setter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Setter(onMethod_ = {@Autowired})
	private DataSource dataSource;
	
	@Bean
	public UserDetailsService customUserDetailsService() {
		return new CustomUserDetailsService();
	}	

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/css/**", "/js/**");
    }
	
	@Override
	  protected void configure(HttpSecurity http) throws Exception {
	      
		http.csrf().disable();
		
		http
	              .authorizeRequests()
	              .antMatchers("/freeSeries").permitAll()
	              .antMatchers("/premium").permitAll()
	              .antMatchers("/review").permitAll()
	              .antMatchers("/events").permitAll()
	              .antMatchers("/bookshelf").access("hasAnyAuthority('user','manager')")
	              .antMatchers("/login").anonymous()
	              .antMatchers("/register").anonymous()
	              .antMatchers("/logout").authenticated()
	              .antMatchers("/**/**").permitAll()
	              .antMatchers("/**").permitAll()
	              .antMatchers("/").permitAll()
	              .anyRequest().authenticated();
	      
	    http.formLogin()//Form 로그인 인증 기능이 작동함
	     .loginPage("/login")//사용자 정의 로그인 페이지
	     .defaultSuccessUrl("/")//로그인 성공 후 이동 페이지
	     .failureUrl("/login?error=true")// 로그인 실패 후 이동 페이지
	     .usernameParameter("mem_email")//아이디 파라미터명 설정
	     .passwordParameter("mem_pw")//패스워드 파라미터명 설정
	     .loginProcessingUrl("/login")//로그인 Form Action Url
		 .permitAll(); //사용자 정의 로그인 페이지 접근 권한 승인
		
		http.logout()
		.logoutUrl("/logout")
		.invalidateHttpSession(true)
		.deleteCookies("remember-me", "JSESSION_ID");
		
		http.rememberMe()
		.tokenRepository(persistentTokenRepository())
		.tokenValiditySeconds(604800);
	  }
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public PersistentTokenRepository persistentTokenRepository() {
		JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
		repo.setDataSource(dataSource);
		return repo;
	}
}
