
const video = document.getElementById('myvideo');
const videoControls = document.getElementById('video-controls');
const nextButton = document.getElementById('next-button');
const thumbnail = document.querySelector('.thumbnail');
const videoLinks = [
  { src: 'videos/Color_Bars_DB_Web.mp4', channel: '' },
  { src: 'rtmp://localhost/live/channel2', channel: '2' },
  { src: 'videos/Color_Bars_DB_Web.mp4', channel: '' },
  { src: 'rtmp://localhost/live/channel4', channel: '4' },
  { src: 'videos/Color_Bars_DB_Web.mp4', channel: '' },
  { src: 'rtmp://localhost/live/channel6', channel: '6' }
];

let currentVideoIndex = -1;
let channelTimeout;

function goToNextVideo() {
  currentVideoIndex = (currentVideoIndex + 1) % videoLinks.length;
  video.src = videoLinks[currentVideoIndex].src;
  video.play();
  thumbnail.style.display = 'none';
 
  const channelNumber = document.getElementById('channel-number');
  channelNumber.innerText = videoLinks[currentVideoIndex].channel;

  clearTimeout(channelTimeout);

  channelTimeout = setTimeout(() => {
    channelNumber.innerText = '';
  }, 7000);
}

function goToPreviousVideo() {
  currentVideoIndex = (currentVideoIndex - 2 + videoLinks.length) % videoLinks.length;
  video.src = videoLinks[currentVideoIndex].src;
  video.play();
  thumbnail.style.display = 'none';

  const channelNumber = document.getElementById('channel-number');
  channelNumber.innerText = videoLinks[currentVideoIndex].channel;

  clearTimeout(channelTimeout);

  channelTimeout = setTimeout(() => {
    channelNumber.innerText = '';
  }, 7000);
}


// Event listeners

document.addEventListener('keydown', function(event) {
  if (event.key === "ArrowRight") {
    goToNextVideo();
  } else if (event.key === "ArrowLeft") {
    goToPreviousVideo();
  }
});

video.addEventListener('ended', goToNextVideo);
nextButton.addEventListener('click', goToNextVideo);

document.addEventListener('contextmenu', function(event) {
  event.preventDefault();
  goToPreviousVideo();  
});

video.addEventListener('loadedmetadata', function() {
  if ('disablePictureInPicture' in video) {
    video.disablePictureInPicture = true;
  }
});



//thumbnail.addEventListener('click', thumbnailDisappear)

//document.addEventListener('contextmenu', function(event) {
  //event.preventDefault();
//});

//function openNav() {
  //document.getElementById("mySidebar").style.width = "325px";
  
//}

//function closeNav() {
  //document.getElementById("mySidebar").style.width = "0";
  
//} 







