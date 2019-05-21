var el = document.getElementsByTagName('ytd-playlist-video-renderer');

for (i = 0; i < el.length; i++) {
  el[i].getElementsByTagName('button')[0].click();
  document.getElementsByTagName('ytd-menu-service-item-renderer')[1].click();
}
