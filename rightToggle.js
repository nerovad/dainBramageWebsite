document.addEventListener('DOMContentLoaded', function() {
    const toggleButtonRight = document.getElementById('toggle-button-right');
    const chatBox = document.getElementById('chat-box-right');

    toggleButtonRight.addEventListener('click', () => {
        chatBox.classList.toggle('open');
        toggleButtonRight.classList.toggle('open');
    });
});