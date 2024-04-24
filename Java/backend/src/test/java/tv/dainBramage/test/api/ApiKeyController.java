package tv.dainBramage.test.api;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import tv.dainbramage.backend.servicePackage.ApiKeyService;

import java.util.Random;

@RestController
@RequestMapping("/api/keys")
public class ApiKeyController {
    private final ApiKeyService apiKeyService;

    public ApiKeyController(ApiKeyService apiKeyService) {
        this.apiKeyService = apiKeyService;
    }

    @PostMapping("/generate")
    public ResponseEntity<String> generateApiKey() {
        // Generate a unique API key
        String apiKeyValue = generateUniqueApiKey();

        // Create an ApiKey object
        ApiKey apiKey = new ApiKey();
        apiKey.setValue(apiKeyValue); // Set the generated API key value

        // Save the generated API key
        ApiKey savedApiKey = apiKeyService.saveApiKey(apiKey);

        // Check if the API key was saved successfully
        if (savedApiKey != null) {
            return ResponseEntity.ok(savedApiKey.getValue());
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }


    private String generateUniqueApiKey() {
        // Define the characters allowed in the API key
        String allowedChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

        // Define the length of the API key
        int keyLength = 32;

        // Use StringBuilder to construct the API key
        StringBuilder apiKeyBuilder = new StringBuilder();

        // Generate random characters until the API key reaches the desired length
        Random random = new Random();
        for (int i = 0; i < keyLength; i++) {
            int randomIndex = random.nextInt(allowedChars.length());
            char randomChar = allowedChars.charAt(randomIndex);
            apiKeyBuilder.append(randomChar);
        }

        // Convert StringBuilder to String and return the generated API key
        return apiKeyBuilder.toString();
    }
}

