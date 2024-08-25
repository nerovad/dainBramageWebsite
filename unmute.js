document.getElementById('unmute-button').addEventListener('click', function() {
    var video = document.getElementById('myvideo');
    video.muted = false; // Unmute the video
    this.style.display = 'none'; // Hide the button
});
