
const video = document.getElementById('myvideo');
const videoControls = document.getElementById('video-controls');
const nextButton = document.getElementById('next-button');
const thumbnail = document.querySelector('.thumbnail');
const powerButton = document.querySelector('.power-button');
const newsTicker = document.querySelector('.news-ticker')
const trendingChannels = document.querySelector('.trending-channels')
const videoLinks = [
  { src: 'videos/Color_Bars_DB_Web.mp4', channel: '' },
  { src: 'https://dainbramage.tv:8088/channel2/channel2.m3u8', channel: 'Channel 2: Dain Bramage' },
  { src: 'videos/Color_Bars_DB_Web.mp4', channel: '' },
  { src: 'https://dainbramage.tv:8088/channel17/channel17.m3u8', channel: 'Channel 17: Music' },
  { src: 'videos/Color_Bars_DB_Web.mp4', channel: '' },
  { src: 'https://dainbramage.tv:8088/channel29/channel29.m3u8', channel: 'Channel 29: Skateboarding' },
  { src: 'videos/Color_Bars_DB_Web.mp4', channel: '' },
  { src: 'https://dainbramage.tv:8088/channel31/channel31.m3u8', channel: 'Channel 31: Horror' }
];

let currentVideoIndex = -1;
let channelTimeout;
let hls;
let isTVOn = false;

function turnOnTV() {
  isTVOn = true;
  powerButton.style.display = 'none';
  video.style.display = 'block';
  goToNextVideo();
}

function goToNextVideo() {
  if (!isTVOn) return;

  currentVideoIndex = (currentVideoIndex + 1) % videoLinks.length;
  const videoSource = videoLinks[currentVideoIndex].src;
  
  if (hls) {
    hls.destroy();
  }

  if (videoSource.endsWith('.m3u8')) {
    if (Hls.isSupported()) {
      hls = new Hls();
      hls.loadSource(videoSource);
      hls.attachMedia(video);
      hls.on(Hls.Events.MANIFEST_PARSED, function() {
        video.play();
      });
    } else if (video.canPlayType('application/vnd.apple.mpegurl')) {
      video.src = videoSource;
      video.addEventListener('loadedmetadata', function() {
        video.play();
      });
    }
  } else {
    video.src = videoSource;
    video.load();
    video.play();
  }

    thumbnail.style.display = 'none';
    powerButton.style.display = 'none';
    newsTicker.style.display = 'none';
    trendingChannels.style.display = 'none';
 
  const channelNumber = document.getElementById('channel-number');
  channelNumber.innerText = videoLinks[currentVideoIndex].channel;

  clearTimeout(channelTimeout);

  channelTimeout = setTimeout(() => {
    channelNumber.innerText = '';
  }, 7000);
}

function goToPreviousVideo() {
  if (!isTVOn) return;

  currentVideoIndex = (currentVideoIndex - 2 + videoLinks.length) % videoLinks.length;
  const videoSource = videoLinks[currentVideoIndex].src;

  if (hls) {
    hls.destroy();
  }

  if (videoSource.endsWith('.m3u8')) {
    if (Hls.isSupported()) {
      hls = new Hls();
      hls.loadSource(videoSource);
      hls.attachMedia(video);
      hls.on(Hls.Events.MANIFEST_PARSED, function() {
        video.play();
      });
    } else if (video.canPlayType('application/vnd.apple.mpegurl')) {
      video.src = videoSource;
      video.addEventListener('loadedmetadata', function() {
        video.play();
      });
    }
  } else {
    video.src = videoSource;
    video.load();
    video.play();
  }

    thumbnail.style.display = 'none';
    powerButton.style.display = 'none';
    newsTicker.style.display = 'none';
    trendingChannels.style.display = 'none';

  const channelNumber = document.getElementById('channel-number');
  channelNumber.innerText = videoLinks[currentVideoIndex].channel;

  clearTimeout(channelTimeout);

  channelTimeout = setTimeout(() => {
    channelNumber.innerText = '';
  }, 7000);
}


// Event listeners

powerButton.addEventListener('click', turnOnTV);

document.addEventListener('keydown', function(event) {
  if (!isTVOn) return;
  if (event.key === "ArrowUp") {
    goToNextVideo();
  } else if (event.key === "ArrowDown") {
    goToPreviousVideo();
  } else if (event.key === 'm') {
    video.muted = !video.muted;
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






