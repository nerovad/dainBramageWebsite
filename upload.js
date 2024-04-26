document.querySelector('.uploadform').addEventListener('submit', function(event) {
    event.preventDefault(); // Prevent the form from submitting via the browser
  
    const usernameUpload = document.getElementById('username-upload').value;
    const emailUpload = document.getElementById('email-upload').value;
    const projectLinkUpload = document.getElementById('project-link').value;
    const descriptionUpload = document.getElementById('upload-description').value;
  
    axios.post('http://localhost:8080/api/v1/auth', {
        username: usernameUpload,
        email: emailUpload,
        projectLink: projectLinkUpload,
        description: descriptionUpload
    })
    .then(response => {
        console.log('Submission Success:', response.data);
        window.location.href = 'index.html'; 
    })
    .catch(error => {
        console.error('Submission Error:', error);
        const errorMessageSubmission = document.getElementById('error-message-submission');
      errorMessageRegistrationSubmission.innerText = 'Submission failed. Please try again.';
      errorMessageRegistrationSubmission.style.display = 'block'
    });
  });