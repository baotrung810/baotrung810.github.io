/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.project_final.security;

import com.mycompany.project_final.entities.AccountEntity;
import com.mycompany.project_final.entities.AccountRoleEntity;
import com.mycompany.project_final.service.AccountService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

/**
 *
 * @author AnhLe
 */
@Component
public class CustomAuthenticationProvider
        implements AuthenticationProvider {

    @Autowired
    private AccountService accountService;

    @Override
    public Authentication authenticate(Authentication a) throws AuthenticationException {
        String email = a.getName().trim();
        String password = a.getCredentials().toString().trim();
        if (!StringUtils.isEmpty(email)
                && !StringUtils.isEmpty(password)) {
            AccountEntity acc
                    = accountService.findAccountByEmailAndPassword(email, password);
            if (acc != null && acc.getId() > 0) {
                List<GrantedAuthority> authoritys = new ArrayList<>();
                for (AccountRoleEntity accountRole : acc.getAccountRoles()) {
                    authoritys.add(new SimpleGrantedAuthority(
                            accountRole.getRoles().toString().trim()
                    ));
                }
                return new UsernamePasswordAuthenticationToken(acc, email, authoritys);
            } else {
                return null;
            }
        } else {
            return null;
        }
    }

    @Override
    public boolean supports(Class<?> type) {
        return type.equals(UsernamePasswordAuthenticationToken.class);
    }

}
