document.querySelector('.loginform').addEventListener('submit', function(event) {
    event.preventDefault(); // Prevent the form from submitting via the browser
  
    const usernameLogin = document.getElementById('username-login').value;
    const passwordLogin = document.getElementById('password-login').value;
  
    axios.post('http://localhost:8080/api/v1/auth/authenticate', {
        username: usernameLogin,
        password: passwordLogin
    })
    .then(response => {
        console.log('Login Success:', response.data);
        localStorage.setItem('jwt', response.data.jwt); // Store JWT
        window.location.href = 'index.html'; 
    })
    .catch(error => {
        console.error('Login Error:', error);
        const errorMessageLogin = document.getElementById('error-message-login');
          errorMessageLogin.innerText = 'Login failed. Please try again.';
          errorMessageLogin.style.display = 'block';
    });
  });

  // Function to check if the token is valid
  function checkTokenValidity() {
    console.log('Checking token validity...');
    const jwt = localStorage.getItem('jwt'); 
    if (jwt) {
        
        axios.get('http://localhost:8080/api/v1/auth/authenticate', {
                params: {
                    token: jwt
                }
            })
            .then(response => {
                const isValid = response.data.isValid;
                if (isValid) {
                    
                    document.getElementById('profile-button').style.display = 'block';
                    document.getElementById('loginButton').style.display = 'none';
                } else {
                    
                    document.getElementById('profile-button').style.display = 'none';
                    document.getElementById('loginButton').style.display = 'block';
                }
            })
            .catch(error => {
                console.error('Token validation error:', error);
                
            });
    } else {
        
        document.getElementById('profile-button').style.display = 'none';
        document.getElementById('loginButton').style.display = 'block';
    }
}

// Call the function to check token validity when the page is loaded
checkTokenValidity();