document.addEventListener("DOMContentLoaded", function() {
    // Wait for DOM content to be fully loaded
        

    function checkTokenValidity(token) {
        const headers = {
            Authorization: `Bearer ${token}`
        };
        // Include 'inputToken' parameter in the request URL query string
        return axios.get('http://localhost:8080/api/v1/auth/validateToken?inputToken=' + token)
        .then(response => {
            return response.data.isValid;
        })
        .catch(error => {
            console.error('Token validation error:', error);
            return false;
        });
    }

    function updateButtonVisibility() {
        const loginButton = document.getElementById('login-button-id');
        const profileButton = document.getElementById('profile-button-id');
        console.log('Updating button visibility...');
        // Retrieve JWT token from local storage
        const jwt = localStorage.getItem('jwt');
        console.log('JWT token:', jwt);
        if (jwt) {
            // If JWT token exists, check its validity
            checkTokenValidity(jwt).then(isValid => {
                // Update button visibility based on token validity
                loginButton.style.display = isValid ? 'none' : 'block';
                profileButton.style.display = isValid ? 'block' : 'none';
            });
        } else {
            // If JWT token doesn't exist, show login button and hide profile button
            loginButton.style.display = 'block';
            profileButton.style.display = 'none';
        }
    }

    // Call the function to update button visibility
    updateButtonVisibility();
});

  
