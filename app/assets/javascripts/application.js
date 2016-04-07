// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  $('.likes-link').on('click', function(event) {
    event.preventDefault();
    var likeCount = $(this).siblings('likes_count');
    $.post(this.href, function(response) {
      likeCount.text(response.new_like_count);
    });

  });
});

$( document ).ready(function() {

    $("#imagefile").change(function (){
         $("#img").show();
         $("#img").attr("src",'test.gif');
         if (typeof(FileReader)!="undefined"){
           
            var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png)$/;
            $($(this)[0].files).each(function () {
                 var getfile = $(this);
                 if (regex.test(getfile[0].name.toLowerCase())) {
                     var reader = new FileReader();
                     reader.onload = function (e) {
                         $("#img").attr("src",e.target.result);
                     }
                     reader.readAsDataURL(getfile[0]);
                 } else {
                     alert(getfile[0].name + " is not image file.");
                     return false;
                 }
            });
         }
         else {
             alert("Browser does not supportFileReader.");
         }
    });
});
