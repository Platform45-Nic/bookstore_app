$(document).on('turbolinks:load', function() {
  if ($(".single-post-card").length) {
      // set a solid background color style
      if (mode == 1) {
          $(".single-post-card").each(function() {
              $(this).addClass("solid-color-mode");
              $(this).css('background-color', randomColor());
          });
      }
      // set a border color style
      else {
          $(".single-post-card").each(function() {
              $(this).addClass("border-color-mode");
              $(this).css('border', '5px solid ' + randomColor());
          });
      }	
  }


  $('#feed').on( 'mouseenter', '.single-post-list', function() {
      $(this).css('border-color', randomColor());	
  });

  $('#feed').on( 'mouseleave', '.single-post-list', function() {
      $(this).css('border-color', 'rgba(0, 0 , 0, 0.05)');	
  });

});

var colorSet = randomColorSet();
var mode = Math.floor(Math.random() * 2);

// Randomly returns a color scheme
function randomColorSet() {
  var colorSet1 = ['#DCDCDC', '#D3D3D3', '#C0C0C0', '#A9A9A9', '#808080'];
  var colorSet2 = ['#696969', '#778899', '#708090', '#2F4F4F', '#B0C4DE'];
  var randomSet = [colorSet1, colorSet2];
  return randomSet[Math.floor(Math.random() * randomSet.length )];
}

// Randomly returns a color from an array of colors
function randomColor() {
  var color = colorSet[Math.floor(Math.random() * colorSet.length)];
  return color;
}