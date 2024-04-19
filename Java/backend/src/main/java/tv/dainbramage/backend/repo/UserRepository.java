package tv.dainbramage.backend.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import tv.dainbramage.backend.user.User;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {
    boolean existsByUsername(String username);
    boolean existsByEmail(String email);
    Optional<User> findByUsername(String username);
}
