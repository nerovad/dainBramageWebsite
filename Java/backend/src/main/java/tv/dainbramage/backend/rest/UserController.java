package tv.dainbramage.backend.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import tv.dainbramage.backend.DTO.UserLoginRequest;
import tv.dainbramage.backend.DTO.UserRegistrationRequest;
import tv.dainbramage.backend.servicePackage.UserService;
import tv.dainbramage.backend.user.User;

import java.util.Optional;

@RestController
@RequestMapping("/api")
//@RequestMapping("/users")
public class UserController {


    /*@RequestMapping("/greeting")
    public String getGreeting() {
        return "Hi it's me, Matthew!";
    }*/
   @Autowired
    private UserService userService;

    @PostMapping("/register")
    public ResponseEntity<?> registerUser(@RequestBody UserRegistrationRequest registrationRequest) {
        try {
            User user = userService.registerNewUserAccount(
                    registrationRequest.getUsername(),
                    registrationRequest.getEmail(),
                    registrationRequest.getPassword(),
                    registrationRequest.getDateOfBirth()
            );
            return ResponseEntity.ok(user);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PostMapping("/login")
    public ResponseEntity<?> loginUser(@RequestBody UserLoginRequest loginRequest) {
        Optional<User> authenticatedUser = userService.authenticateUser(
                loginRequest.getUsername(),
                loginRequest.getPassword()
        );

        if (authenticatedUser.isPresent()) {
            return ResponseEntity.ok("Login successful!");
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid username or password");
        }
    }

}
