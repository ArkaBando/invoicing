<script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="../plugins/fastclick/fastclick.min.js"></script>
<!-- AdminLTE App -->
<script src="../dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../dist/js/demo.js"></script>
<!-- PHP brush scripts-->
<script src="../dist/js/shCore.js"></script>
<script src="../dist/js/shBrushPhp.js"></script>
<script type="text/javascript">
    SyntaxHighlighter.all();
    jQuery(".sidebar-menu li a").each(function ($) {
        var path = window.location.href;

        var current = path.substring(path.lastIndexOf('/') + 1);
        var url = jQuery(this).attr('href');
        if (url == current) {
            jQuery(this).parent().addClass("active");
            jQuery(this).parents("ul").css({"display": "block"});
        }
    });

</script>    
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-83741356-1', 'auto');
  ga('send', 'pageview');
  ga('send', 'event', 'Video', 'play', 'cats.mp4');

</script>