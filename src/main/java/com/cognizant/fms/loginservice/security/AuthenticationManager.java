package com.cognizant.fms.loginservice.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.ReactiveAuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import com.cognizant.fms.loginservice.service.MyUserDetailsService;
import com.cognizant.fms.loginservice.util.JwtUtil;

import reactor.core.publisher.Mono;

@Component
public class AuthenticationManager implements ReactiveAuthenticationManager {

	@Autowired
	private JwtUtil jwtUtil;
	
	@Autowired
    private MyUserDetailsService userDetailsService;
	
	@Autowired
	private UserDetails userDetails;
	
	@Override
	public Mono<Authentication> authenticate(Authentication authentication) {
		
		String authToken = authentication.getCredentials().toString();
		
		String username;
		
		try {
			username = jwtUtil.extractUsername(authToken);
		} catch (Exception e) {
			username = null;
		}
		
		Mono<UserDetails> userDetails = this.userDetailsService.findByUsername(username);
		
		if (username != null && jwtUtil.validateToken(authToken, userDetails)) {
			Claims claims = jwtUtil.getAllClaimsFromToken(authToken);
			List<String> rolesMap = claims.get("role", List.class);
			List<Role> roles = new ArrayList<>();
			for (String rolemap : rolesMap) {
				roles.add(Role.valueOf(rolemap));
			}
			UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(
				username,
				null,
				roles.stream().map(authority -> new SimpleGrantedAuthority(authority.name())).collect(Collectors.toList())
			);
			return Mono.just(auth);
		} else {
			return Mono.empty();
		}
		}
	}

}
