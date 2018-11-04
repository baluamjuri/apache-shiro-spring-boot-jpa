package com.brandix.shiro.realm;

import javax.persistence.PersistenceException;

import org.apache.shiro.authc.AccountException;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.brandix.shiro.dao.UserRepository;
import com.brandix.shiro.model.Role;
import com.brandix.shiro.model.User;

public class BrandixRealm extends AuthorizingRealm {

	@Autowired
	private UserRepository userRepository;
	
	@Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        User user = (User) principalCollection.getPrimaryPrincipal();

        user.getRoles()
        	.forEach(role -> {
        		authorizationInfo.addRole(role.getRole());
        		setPermissions(authorizationInfo, role);
        	});
        
        return authorizationInfo;
    }

	private void setPermissions(final SimpleAuthorizationInfo authorizationInfo, Role role) {
		role.getPermisssions()
			.forEach(permission -> authorizationInfo.addStringPermission(permission.getPermission()));
	}

	 @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
		UsernamePasswordToken upToken = (UsernamePasswordToken) authenticationToken;
        String username = upToken.getUsername();

        if (username == null) {
            throw new AccountException("UserName is required");
        }

        User user = null;
        try {
            user = userRepository.getOne(username);
            if (user == null) {
                throw new UnknownAccountException("No account found for userName [" + username + "]");
            }
        } catch (PersistenceException e) {
            final String message = "There was a SQL error while authenticating userName [" + username + "]";
            // Rethrow any SQL errors as an authentication exception
            throw new AuthenticationException(message, e);
        }
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
                user,
                user.getPassword(),
//                ByteSource.Util.bytes(user.getSalt()),
                getName()
        );
        return authenticationInfo;
    }
	 
	@Override
    public boolean supports(AuthenticationToken token) {
        return token.getClass().isAssignableFrom(UsernamePasswordToken.class);
    }

	@Override
    public void setCredentialsMatcher(CredentialsMatcher credentialsMatcher) {
        HashedCredentialsMatcher hashedCredentialsMatcher = new HashedCredentialsMatcher();
        hashedCredentialsMatcher.setHashAlgorithmName(Sha256Hash.ALGORITHM_NAME);
//        hashedCredentialsMatcher.setHashIterations(1024);
        super.setCredentialsMatcher(hashedCredentialsMatcher);
    }
}
