package com.gyull.cookivel.security.provider;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.gyull.cookivel.security.domain.CustomUser;
import com.gyull.cookivel.security.filter.AjaxAuthenticationToken;
import com.gyull.cookivel.security.service.CustomUserDetailsService;

public class AjaxAuthenticationProvider implements AuthenticationProvider {

    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {

        String username = authentication.getName();
        String password = (String)authentication.getCredentials();

        CustomUser customUser = (CustomUser)userDetailsService.loadUserByUsername(username);

        if(!passwordEncoder.matches(password, customUser.getMember().getMem_pw())){
            throw new BadCredentialsException("BadCredentialException");
        }
        return new AjaxAuthenticationToken(customUser.getMember(), null, customUser.getAuthorities());
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(AjaxAuthenticationToken.class);
    }
}
