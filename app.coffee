Framer.Extras.Preloader.enable()
Framer.Extras.Hints.disable()

Screen.backgroundColor = "hsl(210,5%,90%)"

Utils.insertCSS('@import url(https://fonts.googleapis.com/css?family=Montserrat)')
Montserrat = Utils.loadWebFont("Montserrat")
Lato = Utils.loadWebFont("Lato")
NunitoSans = Utils.loadWebFont("Nunito+Sans")
Playfair = Utils.loadWebFont("Playfair Display")
Avenir = Utils.loadWebFont("Avenir")
Inter = Utils.loadWebFont("Inter")


Framer.Defaults.style = 
	fontFamily: Inter
	fontWeight: 600

Framer.Defaults.animationOptions = 
	curve: "ease"
	time: 0.3

default_animationOptions = {curve: "ease",time:0.3}


highlight_gradient = new Gradient
	start: "#F16F8D"
	end: "#F78C71"

# ------------------------------------ 


btn_press_effect_scale = (btn) ->
	btn.onTouchStart ->
		@.animate
			brightness: 110
			scale: 1.2
			options: {curve: "ease",time:0.2}
			
	btn.onTouchMove ->
		@.animate
			brightness: 100
			scale: 1
			options: {curve: "ease",time:0.2}
	btn.onTouchEnd ->
		@.animate
			brightness: 100
			scale: 1
			options: {curve: "ease",time:0.2}	

# ------------------------------------ 

canvas_frame_ratio = Canvas.frame.width / Screen.width
web_ratio = Framer.Device.screen.width / 375

# print canvas_frame_ratio
# print Canvas.frame.width
# print Framer.Device.screen.width
# print Framer.Device.screen.y

# print web_ratio

getEventPoint = (event) ->
	myTouchEvent = Events.touchEvent(event)
# 	print myTouchEvent.contextPoint.x
	touchX = myTouchEvent.clientX / canvas_frame_ratio
	touchY = myTouchEvent.clientY / canvas_frame_ratio
	
	if Utils.isDesktop()
		touchX = myTouchEvent.point.x * 1
		touchY = myTouchEvent.point.y * 1
	
	point = {x:touchX,y:touchY}
	return point



circle_vis = false
# circle_vis = true
circle_size = 56

circle = new Layer
	size: circle_size
	borderRadius: circle_size/2
	backgroundColor: "rgba(255,255,255,1)"
	shadow1: 
		blur: 10
		color: "rgba(0,0,0,0.1)"
	opacity: 1
# 	visible: false
	z: 10

if circle_vis is false
	circle.visible = false


Framer.Device.screen.onTouchStart (event) ->
	if circle_vis is false
		circle.visible = false
	else
		circle.visible = true

	point = getEventPoint event
	circle.midX = point.x / 3
	circle.midY = point.y / 3
	circle.opacity = 0.7
# 	circle.animate time: .01, properties: scale: 1, opacity: 0.7, midX: point.x, midY: point.y
	circle.bringToFront()


Framer.Device.screen.onTouchMove (event) ->
	point = getEventPoint event
	circle.midX = point.x / 3
	circle.midY = point.y / 3
	
Framer.Device.screen.onTouchEnd (event) ->
	circle.animate time: .15, delay: .1, curve: "ease-out", properties: scale: .8, opacity: 0




# ------------------------------------

screen_ratio = Screen.height/Screen.width

iPhoneX_related_ratio_array = [812/375, 896/414, 844/390, 926/428]
# print Math.floor(r*100) for r in iPhoneX_related_ratio_array
iPhoneX_related_ratio = Math.floor(812/375*100)

# if screen_ratio is 812/375 or screen_ratio is 896/414 or screen_ratio is 844/390
if Math.floor(screen_ratio*100) is iPhoneX_related_ratio
	safe_area_top = 44
	safe_area_bottom = 34
	screen_width = Screen.width
	screen_height = Screen.height - safe_area_top - safe_area_bottom
else
	safe_area_top = 0
	safe_area_bottom = 0
	screen_width = Screen.width
	screen_height = Screen.height

screen_y = safe_area_top

nav_h = 44
# nav_h = 64

# ------------------------------------

main_page = new Layer
	width: Screen.width
	height: Screen.height
	backgroundColor: "hsl(30,10%,90%)"
	backgroundColor: "hsl(0,0%,96%)"

main_nav_h = 56
main_nav_h = 1
main_nav = new Layer
	parent: main_page
	width: main_page.width
	height: main_nav_h
	y: screen_y
	backgroundColor: ""

nav_btn_size = 32


# btn_main_nav_left = new TextLayer
# 	parent: main_nav
# 	text: "Left"
# 	fontSize: 16
# 	x: 16
# 	backgroundColor: "hsl(30,10%,90%)"
# 	padding: 
# 		vertical: 4
# 		horizontal: 12
# btn_main_nav_left.y = Align.center
# btn_main_nav_left.borderRadius = btn_main_nav_left.height/2
# 
# btn_main_nav_right = new TextLayer
# 	parent: main_nav
# 	text: "Right"
# 	fontSize: 16
# 	backgroundColor: "hsl(30,10%,90%)"
# 	padding: 
# 		vertical: 4
# 		horizontal: 12
# btn_main_nav_right.y = Align.center
# btn_main_nav_right.x = Align.right -16
# btn_main_nav_right.borderRadius = btn_main_nav_right.height/2


# ==================================
	
# CANVAS 
canvas_x = 24 * 2
canvas_y = main_nav.maxY + 8
canvas_w = Screen.width-canvas_x*2
canvas_h = canvas_w * 4/4

main_canvas = new Layer
	parent: main_page
	width:  canvas_w
	height: canvas_h
	x: canvas_x
	y: canvas_y
	borderRadius: 4
	clip: true
	backgroundColor: "ccc"
	shadow1:
		y: 1
		blur: 8
		spread: 0,
		color: "hsla(30,10%,10%,0.05)"
	

# ==================================

# LAYER 

collages = [
	{
		name: "collage_1"
		background: "8FC0C8"
		canvas_ratio: 4/3
		scraps: [
			{
				x: 0.3, y: 0.25, width: 0.4, height: 0.3
				backgroundColor: "5169AE", type: "image"
			},
			{
				x: 0.75, y: 0.35, width: 0.35, height: 0.4
				backgroundColor: "5169AE", type: "image"
			},
			{
				x: 0.3, y: 0.6, width: 0.3, height: 0.4
				backgroundColor: "5169AE", type: "image"
			},
			{
				x: 0.7, y: 0.72, width: 0.3, height: 0.4
				backgroundColor: "5169AE", type: "image"
			},
# 			{
# 				x: 0.5, y: 0.5, width: 0.25, height: 0.25
# 				backgroundColor: "000000", type: "image"
# 			},
			{
				x: 0.13, y: 0.12, width: 0.2, height: 0.2
				backgroundColor: "C16AAF", type: "sticker"
			},
			{
				x: 0.57, y: 0.48, width: 0.18, height: 0.18
				backgroundColor: "C16AAF", type: "sticker"
			},
			{
				x: 0.82, y: 0.88, width: 0.24, height: 0.24
				backgroundColor: "C16AAF", type: "sticker"
			},
			{
				x: 0.28, y: 0.88, width: 0.5, height: 0.2
				backgroundColor: "7359A6", type: "text", text: "Wednesday"
				color: "white", fontSize: 24
			},
			{
				x: 0.75, y: 0.11, width: 0.35, height: 0.16
				backgroundColor: "7359A6", type: "text", text: "2021/10/13"
				color: "white", fontSize: 16
			},
		]
	}
]

scrap_all = []

update_collage = (data = collages, index = 0, canvas = main_canvas) ->
	
	canvas_w = canvas.width
	canvas_h = canvas_w * data[index].canvas_ratio
	canvas.height = canvas_h
	canvas.backgroundColor = data[index].background
# 	print canvas_w
	for i in [0...data[index].scraps.length]
		scrap = new Layer
			parent: canvas
# 			text: ""
			width: data[index].scraps[i].width * canvas_w
			height: data[index].scraps[i].height * canvas_w
			midX: data[index].scraps[i].x * canvas_w
			midY: data[index].scraps[i].y * canvas_h
			backgroundColor: data[index].scraps[i].backgroundColor
			borderColor: "hsla(0,0%,0%,0.3)"
			borderWidth: 2
			borderRadius: 2
# 			textAlign: "center"
			index: i
			
		scrap_all.push(scrap)
		
		scrap_info = new TextLayer
			parent: scrap
			text: i
			color: "hsla(0,0%,100%,0.3)"
			fontSize: 14
			textAlign: "center"
			point: Align.center
			index: i
		
		if data[index].scraps[i].type is "sticker"
			scrap.borderRadius = scrap.height/2
		
		if data[index].scraps[i].type is "text"
			scrap_info.x = Align.right
			scrap_info.y = Align.top
			scrap_text = new TextLayer
				parent: scrap
				text: data[index].scraps[i].text
				color: data[index].scraps[i].color
				fontSize: data[index].scraps[i].fontSize
				textAlign: "center"
				point: Align.center
		

update_collage(data = collages, index = 0, canvas = main_canvas)


# ==================================



layer_ani_data = [
	{
		name: "FadeIn"
		properties: { 
			start: 
				opacity: 0
			end: 
				opacity: 1
		}
		options: 
			curve: "ease"
			time: 0.8
		loop: false
	},
	{
		name: "FadeInUp"
		properties: { 
			start: 
				opacity: 0
			end: 
				opacity: 1
		}
		options: 
			curve: "ease"
			time: 0.8
		loop: false
	},
	{
		name: "MoveToRight"
		properties: {}
		options: 
			curve: "ease"
			time: 0.3
		loop: false
	},
	{
		name: "ToCenter"
		properties: {}
		options: 
			curve: "Spring(damping: 0.8)"
			time: 1.0
		loop: false
	},
	{
		name: "StopMo"
		properties: {}
		options: 
			curve: "Linear"
			time: 0.03
		loop: false
	},
	{
		name: "Pulse"
		properties: {
			start: 
				scale: 1
			end: 
				scale: 1.1
		}
		options: 
			curve: "ease"
			time: 3.0
		loop: true
	},
	{
		name: "PhotoZoom"
		properties: {
			start: 
				opacity: 0
				scale: 0
			end: 
				opacity: 1.5
				scale: 1
		}
		options: 
			curve: "ease"
			time: 0.5
		loop: false
	},
]



page_animations = [
	{
		name: "Fade In"
		clips: ["FadeIn"]
		show_type: "1by1"
		order: "index"
		interval: 0.2
		loop: false
	},
	{
		name: "Fade In Up"
		clips: ["FadeInUp"]
		show_type: "1by1"
		order: "index"
		interval: 0.05
		loop: false
	},
	{
		name: "To Right"
		clips: ["MoveToRight"]
		show_type: "1by1"
		order: "index"
		interval: 0.1
		loop: false
	},
	{
		name: "To Center"
		clips: ["ToCenter"]
		show_type: "same"
		order: "index"
		interval: 0.3
		loop: false
	},
	{
		name: "Stop Mo"
		clips: ["StopMo"]
		show_type: "1by1"
		order: "index"
		interval: 0.2
		loop: false
	},
	{
		name: "Pulse"
		clips: ["Pulse"]
		show_type: "1by1"
		order: "index"
		interval: 0.3
		loop: true
	},
	{
		name: "PhotoZoom"
		clips: ["PhotoZoom"]
		show_type: "1by1"
		order: "index"
		interval: 0.15
		loop: true
	},
]




# print layer_ani_data.FadeIn.properties.start
loop_animations = []

apply_layer_animation = (ani_layer=scrap_all[3], prop=layer_ani_data[1]) ->
# 	prop_key = Object.keys(prop.properties.start)[0]
	ani_layer.animateStop()
	ani_layer.stateSwitch("default")
	if prop.name is "MoveToRight"
		ani_layer.states.start = 
			x: ani_layer.states.default.x - 300
		ani_layer.states.end = 
			x: ani_layer.states.default.x
	else if prop.name is "ToCenter"
		dist = 6
		start_x = (ani_layer.parent.width/2 - ani_layer.midX) * -dist
		start_y = (ani_layer.parent.height/2 - ani_layer.midY) * -dist
		ani_layer.states.start = 
			midX: start_x
			midY: start_y
		ani_layer.states.end = 
			x: ani_layer.states.default.x
			y: ani_layer.states.default.y
	else if prop.name is "FadeInUp"
		ani_layer.states.start = 
			y: ani_layer.states.default.y + 50
			opacity: 0
		ani_layer.states.end = 
			y: ani_layer.states.default.y
			opacity: 1
	else if prop.name is "StopMo"
		dist = 1.7
		dist_2 = 1.2
		dist_3 = 1.1
		ani_layer_mid_x = ani_layer.states.default.x+ani_layer.width/2
		if ani_layer_mid_x > ani_layer.parent.width/2
			scrap_to_center = (ani_layer_mid_x+(ani_layer.midX-ani_layer.parent.width/2))
			start_x = scrap_to_center * dist
			inbetween_x = scrap_to_center * dist_2
			inbetween_x2 = scrap_to_center * dist_3
		else
			scrap_to_center = (ani_layer_mid_x-(ani_layer.parent.width/2 - ani_layer.midX))
			start_x = scrap_to_center * dist
			inbetween_x = scrap_to_center * dist_2
			inbetween_x2 = scrap_to_center * dist_3
		
		ani_layer_mid_y = ani_layer.states.default.y+ani_layer.height/2
		if ani_layer_mid_y > ani_layer.parent.height/2
			scrap_to_center = (ani_layer_mid_y+(ani_layer.midY-ani_layer.parent.height/2)) 
			start_y = scrap_to_center * dist
			inbetween_y = scrap_to_center * dist_2
			inbetween_y2 = scrap_to_center * dist_3
		else
			scrap_to_center = (ani_layer_mid_y-(ani_layer.parent.height/2 - ani_layer.midY))
			start_y = scrap_to_center * dist
			inbetween_y = scrap_to_center * dist_2
			inbetween_y2 = scrap_to_center * dist_3
		
# 		if ani_layer.index is 0
# 			print "start_x: " + start_x
# 			print "inbetween_x: " + inbetween_x
# 			print "inbetween_x2: " + inbetween_x2
# 			print "end_x: " + ani_layer.states.default.x + ani_layer.states.default.width/2
		
# 		s_x = start_x - ani_layer.states.default.width/2
# 		s_y = start_y - ani_layer.states.default.height/2
		ani_layer.states.start = 
			midX: start_x
			midY: start_y
# 			x: s_x
# 			y: s_y
		ani_layer.states.inbetween = 
			midX: inbetween_x
			midY: inbetween_y
		ani_layer.states.inbetween2 = 
			midX: inbetween_x2
			midY: inbetween_y2
		ani_layer.states.end = 
			x: ani_layer.states.default.x
			y: ani_layer.states.default.y
	else if prop.name is "Pulse"
		ani_layer.states.start = 
			prop.properties.start
		ani_layer.states.end = 
			prop.properties.end
		ani_layer.stateCycle(["start", "end"])
		if prop.loop is true
			ani_end = new Animation ani_layer,
				prop.properties.end
			ani_start = ani_end.reverse()

			ani_end.on Events.AnimationEnd, ani_start.start
			ani_start.on Events.AnimationEnd, ani_end.start
			
			loop_animations.push(ani_end) 
# 			ani_end.start()
	else
		ani_layer.states.start = 
			prop.properties.start
		ani_layer.states.end = 
			prop.properties.end
	
	ani_layer.stateSwitch("start")



play_layer_animation = (ani_layer=scrap_all[3], prop=layer_ani_data[1]) ->
	if prop.name is "StopMo"
		ani_layer.animate "inbetween",
		options: prop.options
		Utils.delay prop.options.time*5, ->
			ani_layer.animate "inbetween2",
			options: prop.options
			Utils.delay prop.options.time*5, ->
				ani_layer.animate "end",
				options: prop.options
	else
		if prop.loop is true
# 			print loop_animations.length
			i = ani_layer.index
			loop_animations[i].start() if loop_animations[i] isnt undefined
		else
			ani_layer.animate "end",
			options: prop.options

# apply_layer_animation(ani_layer=scrap_all[3], prop=layer_ani_data.MoveToRight)
# play_layer_animation(ani_layer=scrap_all[3], prop=layer_ani_data.MoveToRight)







ani_scraps = []
ready_to_play = []
ani_duration = 0

apply_page_animation = (source_scraps=scrap_all, p_ani = page_animations[0]) ->
	ani_scraps = []
	loop_animations = []
	

	for i in [0...source_scraps.length]
		ani_scraps.push(source_scraps[i])
	
	s = ani_scraps.length

	layer_ani_index = 0
	for i in [0...layer_ani_data.length]
		if layer_ani_data[i].name is p_ani.clips[0]
			layer_ani_index = i
	
	if p_ani.show_type is "1by1"
		ani_duration = p_ani.interval * source_scraps.length
	else
		ani_duration = layer_ani_data[layer_ani_index].options.time
	Utils.delay ani_duration, -> 
		ani_duration = 0
	
	for i in [0...ani_scraps.length]		
		if ani_scraps[i].isAnimating
			ani_scraps[i].animateStop()
			ani_scraps[i].stateSwitch("default")
		
		apply_layer_animation(ani_layer=ani_scraps[i],prop=layer_ani_data[layer_ani_index])
		
		if p_ani.show_type is "1by1"
			d_time = p_ani.interval * i
			Utils.delay d_time, -> 
				if s >= 0
					s -= 1
					j = (ani_scraps.length - 1) - s
					play_layer_animation(ani_scraps[j],prop=layer_ani_data[layer_ani_index])
					
		else if p_ani.show_type is "same"
			play_layer_animation(ani_scraps[i],prop=layer_ani_data[layer_ani_index])
		
# 	ani_scraps = []
		
# apply_page_animation(scrap_all,page_animations[2])



# ==================================



main_page_margin_h = 24
p_ani_option_scroll_w = Screen.width - main_page_margin_h*2
p_ani_option_w = 70
p_ani_option_h = p_ani_option_w

p_ani_option_scroll = new ScrollComponent
	parent: main_page
	width: p_ani_option_scroll_w
	height: p_ani_option_h
	x: Align.center
	y: main_canvas.maxY + 36
	scrollVertical: false
	clip: false
	directionLock: true

p_ani_option_scroll.content.clip = false

p_ani_option_margin = 12
p_ani_option_all = []

for i in [0...page_animations.length]
	p_ani_option = new Layer
		parent: p_ani_option_scroll.content
		width: p_ani_option_w
		height: p_ani_option_h
		x: ( p_ani_option_w + p_ani_option_margin) * i
		backgroundColor: "FF5185"
		borderRadius: 4
		index: i
	
	p_ani_option_all.push(p_ani_option)
	
	p_ani_option_text = new TextLayer
		parent: p_ani_option
		text: page_animations[i].name
		color: "hsla(0,0%,100%,1)"
		fontSize: 13
		textAlign: "center"
		point: Align.center
		index: i
	
	btn_press_effect_scale(p_ani_option)
	
	p_ani_option.onTap ->
		if ani_duration is 0
			apply_page_animation(scrap_all,page_animations[@.index])


# p_ani_option_scroll.scrollToLayer(p_ani_option_all[p_ani_option_all.length-1])








# scrap = new Layer
# 	size: 200
# 	backgroundColor: "blue"
# 	x: 50
# 	y: 500
# 	opacity: 0
# 	
# animationA = new Animation scrap,
# 	x: 40
# 	scale: 1.1
# 	opacity: 0.3
#  
# # animationB = animationA.reverse()
# animationB = new Animation scrap,
# 	x: 40
# 	scale: 1.3
# 	opacity: 1
# 	 
# # Alternate between the two animations 
# animationA.on Events.AnimationEnd, animationB.start
# animationB.on Events.AnimationEnd, animationA.start
#  
# animationA.start()






# scrap.states.add
# 	ori: 
# 		x: 50
# 		opacity: 0.3
# 	right:
# 		x: 150
# 		opacity: 1
# 
# scrap.states.animationOptions =
# 	curve: "ease"
# 	time: 0.5

# scrap.states.switch("right")






# scrap.animate
# 	x: 150
# 	opacity: 1
# 	options: 
# 		curve: "ease"
# 		time: 0.8
	




















