let currentSlide = 0;

function changeSlide(direction) {
    const slides = document.querySelector('.slides');
    const totalSlides = slides.children.length;

    currentSlide += direction;

    if (currentSlide < 0) {
        currentSlide = totalSlides - 1;
    } else if (currentSlide >= totalSlides) {
        currentSlide = 0;
    }

    const slideWidth = slides.children[0].clientWidth;
    slides.style.transform = `translateX(-${currentSlide * slideWidth}px)`;
}

window.addEventListener('resize', () => {
    const slides = document.querySelector('.slides');
    const slideWidth = slides.children[0].clientWidth;
    slides.style.transform = `translateX(-${currentSlide * slideWidth}px)`;
});
