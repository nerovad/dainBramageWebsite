package tv.dainBramage.test.api;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;
import tv.dainbramage.backend.servicePackage.ApiKeyService;

import java.io.IOException;

@Component
public class ApiKeyAuthenticationFilter extends OncePerRequestFilter {
    private final ApiKeyService apiKeyService;

    public ApiKeyAuthenticationFilter(ApiKeyService apiKeyService) {
        this.apiKeyService = apiKeyService;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        String apiKeyValue = extractApiKey(request);

        if (apiKeyValue != null && isValidApiKey(apiKeyValue)) {
            // Valid API key
            filterChain.doFilter(request, response);
        } else {
            // Invalid API key
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("Invalid API key");
        }
    }

    private String extractApiKey(HttpServletRequest request) {
        // Extract API key from request headers or query parameters
        return request.getParameter("apiKey");
    }

    private boolean isValidApiKey(String apiKeyValue) {
        // Validate API key against stored keys in the database
        // Use ApiKeyService to find the API key by its value
        ApiKey apiKey = apiKeyService.findApiKeyByValue(apiKeyValue);
        return apiKey != null;
    }
}

