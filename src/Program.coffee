#= require Like
#= require Header
#= require ContentHelper

class Program
	@debug = true
	@OAuthKey = "v9UrevHg6LXweUdAjasr06NsdY4"

	@run = ->
		console.log "Initialize Oauth.js" if @debug
		OAuth.initialize(Program.OAuthKey, {"cache" : true})
		window.Tumblr = OAuth.create 'tumblr'
		if (!Tumblr)
			window.location = "/"
		Header.setUserInfo()
		ContentHelper.createColumns()
		Like.get(2)
		infiniteScroll()

	infiniteScroll = ->
		win = $(window)
		win.scroll ->
			if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight)
				Like.get(2)

window.Program = Program