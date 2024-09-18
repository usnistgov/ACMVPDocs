(function ($) {
  $(document).ready(function () {
    // Mark external (non-nist.gov) A tags with class "external"
    // If the address starts with https and ends with nist.gov
    var re_nist = new RegExp('^https?:\/\/((^\/)*\.)*nist\\.gov(\/|$)'); 
    // Regex to find address that start with https
    var re_absolute_address = new RegExp('^((https?:)?\/\/)');
    $("a").each(function () {
      var url = $(this).attr('href');
      if (re_nist.test(url) || !re_absolute_address.test(url)) {
        $(this).addClass('local');
      } else {
        //This a href appears to be external, so tag it
        $(this).addClass('external');
      }
    });
    // Add leaveNotice to external A elements
    $('a.external').leaveNotice({
      siteName: "Implementing a Zero Trust Architecture Project"
    });
  });
})(jQuery);
