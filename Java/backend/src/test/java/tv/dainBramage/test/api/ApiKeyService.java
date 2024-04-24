package tv.dainBramage.test.api;

import jakarta.transaction.Transactional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class ApiKeyService {

    @Autowired
    private ApiKeyProperties apiKeyProperties;
    private final Logger logger = LoggerFactory.getLogger(ApiKeyService.class);
    private final ApiKeyRepository apiKeyRepository;


    public ApiKeyService(ApiKeyRepository apiKeyRepository) {
        this.apiKeyRepository = apiKeyRepository;
    }

    public ApiKey findApiKeyByValue(String value) {
        return apiKeyRepository.findByValue(value);
    }

    public ApiKey saveApiKey(ApiKey apiKey) {
        if (apiKeyProperties.isEnabled()) {
            // Generate and save API key if generation is enabled
            logger.info("Attempting to store API key: {}", apiKey.getValue());
            ApiKey savedApiKey = null;
            try {
                savedApiKey = apiKeyRepository.save(apiKey);
                logger.info("API key stored successfully with ID: {}", savedApiKey.getId());
            } catch (Exception e) {
                logger.error("Failed to store API key: {}", e.getMessage(), e);
                throw e; // Rethrow to allow transaction rollback and further handling up the stack
            }
            return savedApiKey;
        } else {
            logger.warn("API key generation is disabled. Not saving the API key.");
            return null; // Or handle as needed when API key generation is disabled
        }
    }


}
