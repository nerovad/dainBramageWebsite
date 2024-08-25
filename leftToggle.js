document.addEventListener('DOMContentLoaded', function() {
    const toggleButton = document.getElementById('toggle-button-left');
    const trendingChannels = document.getElementById('trending-channels-left');

    toggleButton.addEventListener('click', () => {
        trendingChannels.classList.toggle('open');
        toggleButton.classList.toggle('open');
    });
});
