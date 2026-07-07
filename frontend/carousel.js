document.addEventListener("DOMContentLoaded", () => {
  fetchStories();
});

async function fetchStories() {
  try {
    const response = await fetch("/api/stories");
    if (!response.ok) throw new Error("Lỗi kết nối API");

    const stories = await response.json();
    renderDesktopCarousel(stories);
    renderMobileList(stories);
  } catch (error) {
    console.error("Không lấy được dữ liệu:", error);
    const errorMsg = "<p style='padding: 20px; color: red;'>Lỗi kết nối Server!</p>";
    const track = document.getElementById("feedTrack");
    const list = document.getElementById("mobileStoriesList");
    if (track) track.innerHTML = errorMsg;
    if (list) list.innerHTML = errorMsg;
  }
}

/* ---- bố cục máy tính: carousel ngang ---- */
function renderDesktopCarousel(stories) {
  const track = document.getElementById("feedTrack");
  if (!track) return;

  track.innerHTML = "";

  if (stories.length === 0) {
    track.innerHTML = "<p style='padding: 20px; color: #777;'>Hiện chưa có bài viết nào.</p>";
    return;
  }

  // thẻ đệm đầu - không có tiêu đề, chỉ để carousel có thể canh giữa
  // cả bài viết đầu tiên và cuối cùng
  track.appendChild(createEndCard());

  stories.forEach(story => {
    track.appendChild(createStoryCard(story));
  });

  track.appendChild(createEndCard());

  initScrollEffect(track);
}

/* ---- bố cục điện thoại: danh sách dọc, trang riêng ---- */
function renderMobileList(stories) {
  const list = document.getElementById("mobileStoriesList");
  if (!list) return;

  list.innerHTML = "";

  if (stories.length === 0) {
    list.innerHTML = "<p style='color: #777;'>Hiện chưa có bài viết nào.</p>";
    return;
  }

  stories.forEach(story => {
    list.appendChild(createMobileStoryItem(story));
  });

  // thẻ đệm cuối - giống bên carousel máy tính, báo hiệu hết bài viết
  list.appendChild(createMobileEndItem());
}

function createMobileEndItem() {
  const wrap = document.createElement("div");
  wrap.className = "mobile-story-link";
  wrap.innerHTML = `
    <div class="mobile-story-thumb mobile-story-thumb--end">?</div>
    <div class="mobile-story-caption"></div>
  `;
  return wrap;
}

function createMobileStoryItem(story) {
  const link = document.createElement("a");
  link.href = story.path_page;
  link.className = "mobile-story-link";

  const styleThumb = story.thumbnail ? `style="background-image: url('${story.thumbnail}')"` : "";

  link.innerHTML = `
    <div class="mobile-story-thumb" ${styleThumb}></div>
    <div class="mobile-story-caption">${story.title}</div>
  `;
  return link;
}

function createStoryCard(story) {
  const cardLink = document.createElement("a");
  cardLink.href = story.path_page;
  cardLink.className = "card-link";

  const styleThumb = story.thumbnail ? `style="background-image: url('${story.thumbnail}')"` : "";

  cardLink.innerHTML = `
    <div class="card">
      <div class="card-thumb" ${styleThumb}></div>
      <div class="card-caption">${story.title}</div>
    </div>
  `;
  return cardLink;
}

function createEndCard() {
  const wrap = document.createElement("div");
  wrap.className = "card-link";
  wrap.innerHTML = `
    <div class="card card--end">
      <div class="card-thumb">?</div>
      <div class="card-caption"></div>
    </div>
  `;
  return wrap;
}

function initScrollEffect(track) {
  const cards = Array.from(track.querySelectorAll(".card"));

  function updateActiveCard() {
    const trackRect = track.getBoundingClientRect();
    const centerX = trackRect.left + trackRect.width / 2;

    let closest = null;
    let minDist = Infinity;

    cards.forEach(function (card) {
      const r = card.getBoundingClientRect();
      const cardCenter = r.left + r.width / 2;
      const dist = Math.abs(cardCenter - centerX);
      if (dist < minDist) {
        minDist = dist;
        closest = card;
      }
    });

    cards.forEach(function (card) {
      if (card === closest) {
        card.style.transform = "scale(1.12)";
        card.style.zIndex = "2";
      } else {
        card.style.transform = "scale(1)";
        card.style.zIndex = "1";
      }
    });
  }

  track.addEventListener("scroll", updateActiveCard, { passive: true });
  updateActiveCard();
}
