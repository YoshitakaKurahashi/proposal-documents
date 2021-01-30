import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `
      <div>
        <div class="mt-2 comment-comment">
          ${ data.content.comment }
        </div>
        <div class="comment-info">
          ${ data.content.user }
          ${ data.content.created_at }
        </div>
      </div>
    `;
    const comments = document.getElementById('comments');
    const newComment = document.getElementById('comment_comment');
    comments.insertAdjacentHTML('afterbegin', html);
    newComment.value='';
  }
});
