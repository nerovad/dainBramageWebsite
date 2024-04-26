function toggleHamburger() {
    var hamburgerList = document.querySelector('.hamburger-list');
    
    if (hamburgerList.style.transform === 'translateX(0px)') {
      hamburgerList.style.transform = 'translateX(100%)'; // Move out of view
    } else {
      hamburgerList.style.display = 'block'; // Ensure it's block before sliding in
      hamburgerList.style.transform = 'translateX(0px)'; // Slide into view
    }
}

document.querySelector('.close-button').addEventListener('click', function() {
  var hamburgerList = document.querySelector('.hamburger-list');
  var hamburgerButton = document.querySelector('.hamburger-button');
  hamburgerList.style.transform = 'translateX(100%)'; // Slide out of view
  hamburgerButton.style.transform = 'translateX(0px)'; // Reset button position
});