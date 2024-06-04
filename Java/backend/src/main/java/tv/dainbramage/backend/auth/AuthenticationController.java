package tv.dainbramage.backend.auth;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.bind.annotation.*;
import tv.dainbramage.backend.servicePackage.JwtService;
import tv.dainbramage.backend.token.TokenRepository;
import tv.dainbramage.backend.user.UserRepository;

@RestController
@RequestMapping("/api/v1/auth")
@RequiredArgsConstructor
public class AuthenticationController {

    private final AuthenticationService service;
    private final TokenRepository tokenRepository;
    private final JwtService jwtService;
    private final UserRepository userRepository;
    private final UserDetailsService userDetailsService;

    @PostMapping("/register")
    public ResponseEntity<AuthenticationResponse> Register(
            @RequestBody RegisterRequest request
    ) {
        return ResponseEntity.ok(service.register(request));
    }

    @PostMapping("/authenticate")
    public ResponseEntity<AuthenticationResponse> Register(
            @RequestBody AuthenticationRequest request
    ) {
        return ResponseEntity.ok(service.authenticate(request));
    }

    @GetMapping("/validateToken")
    public ResponseEntity<Void> validateToken(HttpServletRequest request) {
        // Retrieve the currently authenticated user's username
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();

        // Load UserDetails by username
        UserDetails userDetails = userDetailsService.loadUserByUsername(username);

        // Check if the token is valid
        String token = request.getHeader("Authorization");
        if (token != null && token.startsWith("Bearer ")) {
            token = token.substring(7); // Remove "Bearer " prefix
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build(); // Invalid token format
        }

        if (jwtService.isTokenValid(token, userDetails)) {
            return ResponseEntity.ok().build(); // Token is valid
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build(); // Token is invalid
        }
    }
}
