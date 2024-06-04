document.addEventListener('DOMContentLoaded', () => {
    const ticker = document.querySelector('.ticker p');
    const newsItems = [
        'Breaking News: Dain Bramage TV launches new features!',
        'New Festival starts next week!',
        'Submit your films now!'
    ];

    let index = 0;
    setInterval(() => {
        ticker.textContent = newsItems[index];
        index = (index + 1) % newsItems.length;
    }, 10000);
});