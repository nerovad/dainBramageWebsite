const remoteButton = document.getElementById('remote-button-id');
const remoteMenu = document.getElementById('remote-menu-id');
const tooltipText = remoteButton.nextElementSibling;

remoteButton.addEventListener('click', toggleRemote);

function toggleRemote() {
    if (remoteMenu.classList.contains('active')) {
        remoteMenu.classList.remove('active'); // Hide the menu
        remoteMenu.style.opacity = '0';
        remoteMenu.style.transform = 'translateY(-100%)';
        setTimeout(() => {
            remoteMenu.style.display = 'none';
            tooltipText.classList.remove('hidden'); // Show the tooltip
        }, 300); // Match the duration of the CSS transition
    } else {
        remoteMenu.style.display = 'block'; // Ensure it's block before sliding in
        tooltipText.classList.add('hidden'); // Hide the tooltip
        setTimeout(() => {
            remoteMenu.classList.add('active'); // Show the menu
            remoteMenu.style.opacity = '1';
            remoteMenu.style.transform = 'translateY(0)';
        }, 0); // Allow display to be set before transitioning
    }
}