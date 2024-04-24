package tv.dainBramage.test.user;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import tv.dainbramage.backend.user.UserRepository;
import tv.dainbramage.backend.user.User;
import java.time.LocalDate;
import java.util.Optional;

@Service
@Transactional
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    @Autowired
    public UserService(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }
    public User registerNewUserAccount(String username, String password, String email, LocalDate dateRegistered, LocalDate dateOfBirth) throws Exception {
        if (userRepository.existsByUsername(username)) {
            throw new Exception("There is an account with that username: " + username);
        }
        if (userRepository.existsByEmail(email)) {
            throw new Exception("There is an account with that email address: " + email);
        }

        User newUser = new User(username, passwordEncoder.encode(password), email, dateRegistered, dateOfBirth);
        return userRepository.save(newUser);
    }

    public Optional<User> authenticateUser(String username, String password) {
        return userRepository.findByUsername(username)
                .filter(user -> passwordEncoder.matches(password, user.getPassword()));
    }

}