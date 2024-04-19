package tv.dainbramage.backend.servicePackage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import tv.dainbramage.backend.repo.UserRepository;
import tv.dainbramage.backend.user.User;

import java.time.LocalDate;
import java.util.Optional;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;
    public User registerNewUserAccount(String username, String email, String password, LocalDate dateOfBirth) throws Exception {
        if (userRepository.existsByUsername(username)) {
            throw new Exception("There is an account with that username: " + username);
        }
        if (userRepository.existsByEmail(email)) {
            throw new Exception("There is an account with that email address: " + email);
        }

        User newUser = new User(username, email, passwordEncoder.encode(password), dateOfBirth);
        return userRepository.save(newUser);
    }

    public Optional<User> authenticateUser(String username, String password) {
        return userRepository.findByUsername(username)
                .filter(user -> passwordEncoder.matches(password, user.getPassword()));
    }

}