// Select elements here
const video = document.getElementById('myvideo');
const videoControls = document.getElementById('video-controls');
const nextButton = document.getElementById('next-button');
const thumbnail = document.getElementById('thumbnail');
const videoLinks = [
  'videos/Color_Bars_DB_Web.mp4',
  'videos/Dain_Bramage_Channel.mp4',
  'videos/Color_Bars_DB_Web.mp4',
  'videos/Music_Video_Channel.mp4',
  'videos/Color_Bars_DB_Web.mp4',
  'videos/Commericals_Channel.mp4'
];

let currentVideoIndex = 0;

function goToNextVideo() {
  currentVideoIndex = (currentVideoIndex + 1) % videoLinks.length;
  video.src = videoLinks[currentVideoIndex];
  video.play();
}

function goToPreviousVideo() {
  currentVideoIndex = (currentVideoIndex - 1 + videoLinks.length) % videoLinks.length;
  video.src = videoLinks[currentVideoIndex];
  video.play();
}


function thumbnailDisappear(){
  if (event.button === 0) { // Left click
    goToNextVideo();
  } else if (event.button === 2) { // Right click
    goToPreviousVideo();
  }
  thumbnail.style.display = "none";
  document.querySelector('.video-container-dboriginals').style.background = "transparent";
  video.style.display = "block";
  video.play();
}
 

// eventlisteners here------------------
video.addEventListener('loadedmetadata', function() {
  if ('disablePictureInPicture' in video) {
    video.disablePictureInPicture = true;
  }
});

document.addEventListener('contextmenu', function(event) {
  event.preventDefault();
});

video.addEventListener('ended', goToNextVideo);
nextButton.addEventListener('click', goToNextVideo);

//thumbnail.addEventListener('click', thumbnailDisappear)

function openNav() {
  document.getElementById("mySidebar").style.width = "325px";
  
}

function closeNav() {
  document.getElementById("mySidebar").style.width = "0";
  
} 

//upload description box--------------
document.getElementById('uploadDescription').addEventListener('input', function() {
  if (this.value.length > this.maxLength) {
      this.value = this.value.slice(0, this.maxLength);
  }
});

//Registration Form --------------------------

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

//Login Form --------------------------

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
      window.location.href = 'index.html'; 
  })
  .catch(error => {
      console.error('Login Error:', error);
      const errorMessageLogin = document.getElementById('error-message-login');
        errorMessageLogin.innerText = 'Login failed. Please try again.';
        errorMessageLogin.style.display = 'block';
  });
});

//Submission Form --------------------------

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



