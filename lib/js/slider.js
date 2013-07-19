<script>
  jQuery(function($) {
      $('#slideClick').toggle(function() {
          $(this).parent().animate({left:'0px'}, {queue:false, duration: 500});
          }, function() {
          $(this).parent().animate({left:'-290px'}, {queue:false, duration: 500});
          });
       });
</script>

