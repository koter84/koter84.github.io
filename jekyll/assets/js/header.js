var navigation = $('header.blog-header');
var main = $('main.content');

var offset = 200; // ToDo - make this variable to height of header.teaserimage

$(window).scroll(function(){
	checkMenu();
});

function checkMenu()
{
	if( $(window).scrollTop() > offset )
	{
		if(!navigation.hasClass('is-fixed'))
		{
			navigation.addClass('is-fixed');
			main.css('padding-top', '70px'); // ToDo - make this variable to height of header.blog-header
		}
	}
	else if(navigation.hasClass('is-fixed'))
	{
		navigation.removeClass('is-fixed');
		main.css('padding-top', '0px');
	}
}
