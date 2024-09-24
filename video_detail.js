document.addEventListener('DOMContentLoaded', function() {
    const urlParams = new URLSearchParams(window.location.search);
    const videoId = urlParams.get('video');

    // Charger les détails de la vidéo
    fetch(`/get_video_details?id=${videoId}`)
        .then(response => response.json())
        .then(data => {
            // Afficher les informations de la vidéo
            document.getElementById('video-title').textContent = data.title;
            document.getElementById('video-artist').textContent = data.artist;
            document.getElementById('video-anime').textContent = data.anime;
            document.getElementById('video-description').textContent = data.description;

            const videoPlayer = document.getElementById('video-player');
            videoPlayer.src = data.video_url;
        })
        .catch(error => console.error('Error fetching video details:', error));

    // Charger les commentaires
    function loadComments() {
        fetch(`/get_comments?video_id=${videoId}`)
            .then(response => response.json())
            .then(comments => {
                const commentsContainer = document.getElementById('comments');
                commentsContainer.innerHTML = '';

                comments.forEach(comment => {
                    const commentElement = document.createElement('div');
                    commentElement.classList.add('comment');
                    commentElement.innerHTML = `
                        <p><strong>${comment.author}:</strong> ${comment.text}</p>
                    `;
                    commentsContainer.appendChild(commentElement);
                });
            })
            .catch(error => console.error('Error fetching comments:', error));
    }

    // Poster un nouveau commentaire
    const commentForm = document.getElementById('comment-form');
    commentForm.addEventListener('submit', function(event) {
        event.preventDefault();
        const commentInput = document.getElementById('comment-input');
        const commentText = commentInput.value;

        fetch(`/post_comment`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                video_id: videoId,
                text: commentText
            })
        })
        .then(response => response.json())
        .then(result => {
            if (result.success) {
                commentInput.value = '';
                loadComments();
            } else {
                console.error('Error posting comment:', result.message);
            }
        })
        .catch(error => console.error('Error posting comment:', error));
    });

    // Charger les commentaires au démarrage
    loadComments();
});