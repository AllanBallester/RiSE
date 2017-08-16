// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require underscore
//= require gmaps/google
//= require_tree .

// $("#ButtonGeoloc").submit(function(event){
//   // I trigger the AJAX query
//   event.preventDefault()
//   var input = $("#exampleInputName2").val()
//   $.ajax( {
//     type: "GET",
//     url: "https://maps.googleapis.com/maps/api/geocode/json?address=" + input,
//     success : function( data ) {
//         console.log( data );
//         // Access to the long and lat
//     var latitude = data.results[0].geometry.location.lat
//     var longitude = data.results[0].geometry.location.lng
//     $("#latitude").text(latitude)
//     $("#longitude").text(longitude)
//     pinMap (latitude, longitude)
//     }
// } );

  //console.log what you get back from the API (success callback )
// });
