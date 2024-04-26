document.querySelector('.registerform').addEventListener('submit', function(event) {
    event.preventDefault(); // Prevent the form from submitting via the browser
  
    const usernameReg = document.getElementById('username-register').value;
    const passwordReg = document.getElementById('password-register').value;
    const emailReg = document.getElementById('email-register').value;
    const dobReg = document.getElementById('dob-register').value;
  
    axios.post('http://localhost:8080/api/v1/auth/register', {
        username: usernameReg,
        password: passwordReg,
        email: emailReg,
        dateOfBirth: dobReg
    })
    .then(response => {
      console.log('Registration Success:', response.data);
      window.location.href = 'login.html'; 
  })
  .catch(error => {
      console.error('Registration Error:', error);
      // Display error message to the user
      const errorMessageRegistration = document.getElementById('error-message-registration');
      errorMessageRegistration.innerText = 'Registration failed. Please try again.';
      errorMessageRegistration.style.display = 'block';
  });
  });