// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require material

document.addEventListener('turbolinks:load', function() {
    componentHandler.upgradeDom();
    
    if ( $('.mdl-snackbar').length ){
        console.log('Made it here...');
        var snackbarContainer = document.querySelector('.mdl-snackbar');
        var msg = $('.notice-text').text();
        
        var data = {
            message: msg,
            actionText: "Dismiss",
            actionHandler: function(event){
                $(".mdl-snackbar--active").removeClass("mdl-snackbar--active");
            }
        };
        snackbarContainer.MaterialSnackbar.showSnackbar(data);
    }
});

jQuery(document).ready(function($) {
    $(".mdl-snackbar__text").append("<i class='material-icons'>close</i>");
    $(".clickable-row").click(function() {
        var url = $(this).data("href");
        console.log(url);
        window.location.href = url;
        console.log(window.location);
    });
});