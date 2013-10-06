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
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require twitter/bootstrap

$(document).ready(function() {
	$('.nav-toggle').click(function(){
		//get collapse content selector
		var collapse_content_selector = $(this).attr('href');					
 
		//make the collapse content to be shown or hide
		var toggle_switch = $(this);
		$(collapse_content_selector).toggle(function(){
			if($(this).css('display')=='none'){
            	//change the button label to be 'Formatting Help'
				toggle_switch.html('Formatting Help');
			}else{
                //change the button label to be 'Hide Help'
				toggle_switch.html('Hide Help');
			  }
		});
	});
});