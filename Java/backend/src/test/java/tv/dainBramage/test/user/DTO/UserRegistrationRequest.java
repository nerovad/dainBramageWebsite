package tv.dainBramage.test.user.DTO;

import java.time.LocalDate;

public class UserRegistrationRequest {
    private String username;
    private String password;
    private String email;
    private LocalDate dateRegistered;
    private LocalDate dateOfBirth;

    // No-argument constructor
    public UserRegistrationRequest() {
        // Default constructor
    }

    // Parameterized constructor
    public UserRegistrationRequest(String username, String password, String email, LocalDate dateRegistered, LocalDate dateOfBirth) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.dateRegistered = dateRegistered;
        this.dateOfBirth = dateOfBirth;
    }

    // Getters and setters
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public LocalDate getDateRegistered() {
        return dateRegistered;
    }

    public void setDateRegistered(LocalDate dateRegistered) {
        this.dateRegistered = dateRegistered;
    }
    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
}
