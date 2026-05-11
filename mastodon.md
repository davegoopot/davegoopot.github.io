---
layout: default
title: "Mastodon - Dave Potts"
---

<div id="mastodon-feed">
  <h2>Loading latest posts from <a href="https://mastodon.org.uk/@davepotts">@davepotts@mastodon.org.uk</a>...</h2>
  <div id="posts"></div>
</div>

<style>
  .mastodon-post {
    border-bottom: 1px solid #eee;
    padding: 15px 0;
    margin-bottom: 15px;
  }
  .mastodon-post:last-child {
    border-bottom: none;
  }
  .mastodon-post .date {
    color: #666;
    font-size: 0.9em;
    margin-bottom: 5px;
  }
  .mastodon-post .content {
    line-height: 1.6;
  }
  .mastodon-post .content p {
    margin: 0 0 10px 0;
  }
  .mastodon-post .content p:last-child {
    margin-bottom: 0;
  }
  .mastodon-post .meta {
    font-size: 0.85em;
    color: #888;
    margin-top: 8px;
  }
  .mastodon-post .meta a {
    color: #888;
  }
  .mastodon-post .reblogged {
    font-style: italic;
    color: #666;
    border-left: 3px solid #ccc;
    padding-left: 10px;
  }
</style>

<script>
  async function fetchMastodonPosts() {
    const postsEl = document.getElementById('posts');
    
    try {
      // First, lookup the account to get the ID
      const lookupResponse = await fetch('https://mastodon.org.uk/api/v1/accounts/lookup?acct=davepotts@mastodon.org.uk');
      const account = await lookupResponse.json();
      
      // Then fetch the latest statuses (including reblogs)
      const statusesResponse = await fetch(`https://mastodon.org.uk/api/v1/accounts/${account.id}/statuses?limit=5&exclude_replies=true`);
      const statuses = await statusesResponse.json();
      
      if (statuses.length === 0) {
        postsEl.innerHTML = '<p>No posts found.</p>';
        return;
      }
      
      postsEl.innerHTML = '';
      
      for (const status of statuses.slice(0, 5)) {
        const postEl = document.createElement('div');
        postEl.className = 'mastodon-post';
        
        // Use the actual post (status.reblog if boosted, otherwise status)
        const post = status.reblog || status;
        const accountInfo = post.account;
        const isReblog = status.reblog !== null;
        
        const dateStr = new Date(post.created_at).toLocaleString('en-GB', {
          year: 'numeric',
          month: 'short',
          day: 'numeric',
          hour: '2-digit',
          minute: '2-digit'
        });
        
        // Sanitize content (remove scripts, etc.)
        const contentHtml = post.content || '(No content)';
        
        // Build the HTML
        const boostPrefix = isReblog ? `<div class="reblogged">Boosted by @${account.username}</div>` : '';
        
        const accountLink = `<a href="${accountInfo.url}" target="_blank">@${accountInfo.acct}</a>`;
        
        postEl.innerHTML = `
          <div class="date">${dateStr}</div>
          ${boostPrefix}
          <div class="content">${contentHtml}</div>
          <div class="meta">
            Posted by ${accountLink}
            | <a href="${post.url}" target="_blank">View on Mastodon</a>
            ${post.sensitive ? '<span class="sensitive">| Sensitive content</span>' : ''}
          </div>
        `;
        
        postsEl.appendChild(postEl);
      }
      
    } catch (error) {
      console.error('Error fetching Mastodon posts:', error);
      postsEl.innerHTML = `
        <p>Error loading posts. You can also view them directly at 
        <a href="https://mastodon.org.uk/@davepotts">@davepotts@mastodon.org.uk</a>.</p>
      `;
    }
  }
  
  // Fetch posts when page loads
  fetchMastodonPosts();
</script>
