package tv.dainBramage.test.api;

import jakarta.persistence.*;

@Entity
@Table(name = "api_keys")
public class ApiKey {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true)
    private String value;

    public Long getId() {
        return id;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}

