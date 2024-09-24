document.addEventListener('DOMContentLoaded', function() {
    const urlParams = new URLSearchParams(window.location.search);
    let currentPage = parseInt(urlParams.get('page')) || 1;
    const totalPages = 50; // Remplacer ce nombre par le nombre total réel de pages

    function loadMedia(page) {
        fetch(`/get_videos?page=${page}&per_page=10`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(medias => {
                const container = document.getElementById('video-container');
                container.innerHTML = ''; // Clear existing videos

                const items = [];

                medias.forEach(media => {
                    const url = media.url;
                    const mediaCard = document.createElement('div');
                    mediaCard.classList.add('card1');

                    if (url) {
                        const mediaLink = document.createElement('a');
                        mediaLink.href = `/video_detail.html?video=${media.video_id}`;

                        if (url.match(/\.(jpeg|jpg|gif|png)$/)) {
                            const imgElement = document.createElement('img');
                            imgElement.src = url;
                            imgElement.style.width = '100%';
                            imgElement.style.height = '150px';
                            imgElement.style.objectFit = 'cover';
                            mediaLink.appendChild(imgElement);
                        } else if (url.match(/\.(mp4|webm)$/)) {
                            const videoElement = document.createElement('video');
                            videoElement.src = url;
                            videoElement.style.width = '100%';
                            videoElement.style.height = '150px';
                            videoElement.style.objectFit = 'cover';
                            videoElement.preload = "none"; // Ensure video doesn't preload
                            videoElement.muted = true; // Ensure video is muted

                            videoElement.addEventListener('mouseover', () => {
                                videoElement.play();
                            });

                            videoElement.addEventListener('mouseout', () => {
                                videoElement.pause();
                                videoElement.currentTime = 0; // Reset video to start
                            });

                            mediaLink.appendChild(videoElement);
                            videoElement.pause(); // Ensure video is paused initially
                        }

                        const cardInfo = document.createElement('div');
                        cardInfo.classList.add('card-info');

                        const publicationDate = document.createElement('p');
                        publicationDate.textContent = `Date de publication: ${media.publication_date || 'undefined'}`;

                        const artistName = document.createElement('p');
                        artistName.textContent = `Artist: ${media.artist_name || 'undefined'}`;

                        const animeTitle = document.createElement('p');
                        animeTitle.textContent = `Anime: ${media.anime_title || 'undefined'}`;

                        cardInfo.appendChild(publicationDate);
                        cardInfo.appendChild(artistName);
                        cardInfo.appendChild(animeTitle);

                        mediaCard.appendChild(mediaLink);
                        mediaCard.appendChild(cardInfo);
                    }

                    items.push(mediaCard);
                });

                while (items.length < 16) {
                    const emptyCard = document.createElement('div');
                    emptyCard.classList.add('card1', 'empty-card');
                    items.push(emptyCard);
                }

                items.forEach(item => container.appendChild(item));

                renderPagination(totalPages, currentPage);
            })
            .catch(error => {
                console.error('Failed to fetch media:', error);
                alert('Failed to load media: ' + error.message);
            });
    }

    function renderPagination(totalPages, currentPage) {
        const paginationContainer = document.getElementById('pagination');
        paginationContainer.innerHTML = ''; // Clear existing pagination

        if (totalPages <= 1) return;

        const createPageLink = (page) => {
            const pageLink = document.createElement('button');
            pageLink.classList.add('page-link');
            pageLink.textContent = page;
            if (page === currentPage) {
                pageLink.classList.add('active');
            }
            pageLink.addEventListener('click', () => {
                currentPage = page;
                updateURL(currentPage);
                loadMedia(currentPage);
            });
            return pageLink;
        };

        const createPageInput = () => {
            const pageInputContainer = document.createElement('div');
            pageInputContainer.classList.add('page-input-container');

            const pageInput = document.createElement('input');
            pageInput.type = 'number';
            pageInput.min = 1;
            pageInput.max = totalPages;
            pageInput.placeholder = '...';
            pageInput.classList.add('page-input');

            pageInput.addEventListener('keydown', (e) => {
                if (e.key === 'Enter') {
                    const page = parseInt(pageInput.value);
                    if (page >= 1 && page <= totalPages) {
                        currentPage = page;
                        updateURL(currentPage);
                        loadMedia(currentPage);
                    }
                }
            });

            pageInputContainer.appendChild(pageInput);
            return pageInputContainer;
        };

        // Add first few pages
        for (let i = 1; i <= Math.min(3, totalPages); i++) {
            paginationContainer.appendChild(createPageLink(i));
        }

        if (totalPages > 3) {
            if (currentPage > 3) {
                paginationContainer.appendChild(createPageInput());
            }

            // Add current, previous, and next pages
            for (let i = Math.max(4, currentPage - 1); i <= Math.min(totalPages - 3, currentPage + 1); i++) {
                paginationContainer.appendChild(createPageLink(i));
            }

            if (currentPage < totalPages - 3) {
                paginationContainer.appendChild(createPageInput());
            }

            // Add last few pages
            for (let i = Math.max(totalPages - 2, currentPage + 2); i <= totalPages; i++) {
                paginationContainer.appendChild(createPageLink(i));
            }
        }
    }

    function updateURL(page) {
        const url = new URL(window.location);
        url.searchParams.set('page', page);
        window.history.pushState({ page: page }, '', url);
    }

    document.getElementById('prev-page').addEventListener('click', () => {
        if (currentPage > 1) {
            currentPage--;
            updateURL(currentPage);
            loadMedia(currentPage);
        }
    });

    document.getElementById('next-page').addEventListener('click', () => {
        if (currentPage < totalPages) {
            currentPage++;
            updateURL(currentPage);
            loadMedia(currentPage);
        }
    });

    window.addEventListener('popstate', (event) => {
        if (event.state && event.state.page) {
            currentPage = event.state.page;
            loadMedia(currentPage);
        }
    });

    // Initial load
    updateURL(currentPage); // Ensure URL is updated on initial load
    loadMedia(currentPage);

    // Menu toggle logic
    const navToggle = document.getElementById('nav-toggle');
    const navMenu = document.getElementById('nav-menu');
    const navClose = document.getElementById('nav-close');

    if (navToggle) {
        navToggle.addEventListener('click', () => {
            if (navMenu) {
                navMenu.classList.toggle('show-menu');
            }
        });
    }

    if (navClose) {
        navClose.addEventListener('click', () => {
            if (navMenu) {
                navMenu.classList.remove('show-menu');
            }
        });
    }
});
document.addEventListener('DOMContentLoaded', function() {
    const navToggle = document.getElementById('nav-toggle');
    const navMenu = document.getElementById('nav-menu');

    if (navToggle) {
        navToggle.addEventListener('click', () => {
            if (navMenu) {
                navMenu.classList.toggle('show-menu');
            }
        });
    }
});

