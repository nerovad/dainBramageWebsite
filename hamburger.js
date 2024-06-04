function toggleHamburger() {
    var hamburgerList = document.querySelector('.hamburger-list');
    
    if (hamburgerList.style.transform === 'translateX(0px)') {
      hamburgerList.style.transform = 'translateX(100%)'; 
    } else {
      hamburgerList.style.display = 'block';
      hamburgerList.style.transform = 'translateX(0px)'; 
    }
}

document.querySelector('.close-button').addEventListener('click', function() {
  var hamburgerList = document.querySelector('.hamburger-list');
  var hamburgerButton = document.querySelector('.hamburger-button');
  hamburgerList.style.transform = 'translateX(100%)'; 
  hamburgerButton.style.transform = 'translateX(0px)'; 
});