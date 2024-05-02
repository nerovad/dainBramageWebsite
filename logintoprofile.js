document.addEventListener("DOMContentLoaded", function() {
  const loginButton = document.getElementById('loginButton');
  const profileButton = document.getElementById('profile-button');

  // Function to check if the token is valid
  function checkTokenValidity(token) {
    return fetch('http://localhost:8080/api/v1/auth/validateToken', {
        method: 'GET',
        headers: {
            'Authorization': 'Bearer ' + token
        }
    })
    .then(response => response.json())
    .catch(error => {
        console.error('Token validation error:', error);
        return false; // Assume token is invalid if there's an error
    });
}

  // Function to update button visibility based on token validity
  function updateButtonVisibility() {
      const token = localStorage.getItem('token');
      if (token) {
          checkTokenValidity(token)
              .then(isValid => {
                  if (isValid) {
                      loginButton.style.display = 'none';
                      profileButton.style.display = 'block';
                  } else {
                      loginButton.style.display = 'block';
                      profileButton.style.display = 'none';
                  }
              });
      } else {
          // No token found, show login button
          loginButton.style.display = 'block';
          profileButton.style.display = 'none';
      }
  }

  // Check and update button visibility on page load
  updateButtonVisibility();
});

