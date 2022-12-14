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
	      
	    http.formLogin()//Form ????????? ?????? ????????? ?????????
	     .loginPage("/login")//????????? ?????? ????????? ?????????
	     .defaultSuccessUrl("/")//????????? ?????? ??? ?????? ?????????
	     .failureUrl("/login?error=true")// ????????? ?????? ??? ?????? ?????????
	     .usernameParameter("mem_email")//????????? ??????????????? ??????
	     .passwordParameter("mem_pw")//???????????? ??????????????? ??????
	     .loginProcessingUrl("/login")//????????? Form Action Url
		 .permitAll(); //????????? ?????? ????????? ????????? ?????? ?????? ??????
		
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
