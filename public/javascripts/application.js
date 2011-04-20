function setup_replay_link(idx, col) {
  $('#'+col).click(function() {
    $('#'+col).toggleClass('off on');
    $.ajax(
    {
      url:"simon/replay/"+idx+"/"+col,
      type: 'POST'
    });
    $('#game-pad').children().unbind('click');
  });
}

function setup_replay_links(idx) {
  setup_replay_link(idx, 'green');
  setup_replay_link(idx, 'red');
  setup_replay_link(idx, 'yellow');
  setup_replay_link(idx, 'blue');
}
