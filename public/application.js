$(document).ready(function() {
  $('#p1-play').click(function() {
    $.post('/move', { 'player' : 'p1',
                        'cell' : $('#p1-move').val() });
    location.reload();
  });
  $('#p2-move').click(function() {
    $.post('/move', { 'player' : 'p2',
                        'cell' : $('#p2-move').val() });
    location.reload();
  });
});
