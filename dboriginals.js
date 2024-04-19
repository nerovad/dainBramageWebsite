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

//HTTP Requests --------------------------

import axios from 'axios';

document.getElementById('registerform').addEventListener('submit', function(event) {
  event.preventDefault(); // Prevent the form from submitting via the browser

  const username = document.getElementById('username').value;
  const email = document.getElementById('email').value;
  const password = document.getElementById('password').value;
  const dob = document.getElementById('dateOfBirth').value

  axios.post('http://localhost:8080/api/users/register', {
      username: username,
      email: email,
      password: password,
      dateOfBirth: dob
  })
  .then(response => {
      console.log('Registration Success:', response.data);
      // Handle further logic here, such as redirecting the user
  })
  .catch(error => {
      console.error('Registration Error:', error);
      // Handle errors here, such as displaying a notification
  });
});
