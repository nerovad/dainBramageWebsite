package tv.dainbramage.backend.servicePackage;

import org.springframework.stereotype.Service;
import tv.dainbramage.backend.Api.ApiKey;
import tv.dainbramage.backend.repo.ApiKeyRepository;

@Service
public class ApiKeyService {
    private final ApiKeyRepository apiKeyRepository;

    public ApiKeyService(ApiKeyRepository apiKeyRepository) {
        this.apiKeyRepository = apiKeyRepository;
    }

    public ApiKey findApiKeyByValue(String value) {
        return apiKeyRepository.findByValue(value);
    }
}
