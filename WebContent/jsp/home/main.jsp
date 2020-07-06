<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	@import url('https://fonts.googleapis.com/css?family=Roboto:700');

.slider {
  margin-top:30%;
}
.slides {
    padding: 0;
    width: 1024px;
    height: 576px;
    display: block;
    margin: 0 auto;
    position: relative;
}

.slides * {
    user-select: none;
    -ms-user-select: none;
    -moz-user-select: none;
    -khtml-user-select: none;
    -webkit-user-select: none;
    -webkit-touch-callout: none;
}

.slides input { display: none; }

.slide-container { display: block; }

.slide {
    top: 0;
    opacity: 0;
    width: 1024px;
    height: 576px;
    display: block;
    position: absolute;

    transform: scale(0);

    transition: all .7s ease-in-out;
}

.slide img {
    width: 100%;
    height: 100%;
}

.nav label {

    width: 100px;
    height: 100%;
    display: none;
    position: absolute;

  	opacity: 0;
    z-index: 9;
    cursor: pointer;

    transition: opacity .2s;

    color: #FFF;
    font-size: 156pt;
    text-align: center;
    line-height: 500px;
    font-family: "Varela Round", sans-serif;
    background-color: rgba(255, 255, 255, .3);
    text-shadow: 0px 0px 15px rgb(119, 119, 119);
}

.slide:hover + .nav label { opacity: 0.5;}

.nav label:hover { opacity: 1; }

.nav .next { right: 0; }

input:checked + .slide-container  .slide {
    opacity: 1;

    transform: scale(1);

    transition: opacity 1s ease-in-out;
}

input:checked + .slide-container .nav label { display: block}

.nav-dots {
	width: 100%;
	bottom: 9px;
	height: 11px;
	display: block;
	position: absolute;
	text-align: center;
}

.nav-dots .nav-dot {
	top: -5px;
	width: 11px;
	height: 11px;
	margin: 0 4px;
	position: relative;
	border-radius: 100%;
	display: inline-block;
	background-color: #afafaf;
}

.nav-dots .nav-dot:hover {
	cursor: pointer;
	background-color: rgba(0, 0, 0, 0.8);
}

input#img-1:checked ~ .nav-dots label#img-dot-1,
input#img-2:checked ~ .nav-dots label#img-dot-2,
input#img-3:checked ~ .nav-dots label#img-dot-3,
input#img-4:checked ~ .nav-dots label#img-dot-4,
input#img-5:checked ~ .nav-dots label#img-dot-5,
input#img-6:checked ~ .nav-dots label#img-dot-6 {
	background: rgba(0, 0, 0, 0.8);
}


@keyframes showTopText {
  0% { transform: translate3d(0, 100%, 0); }
  40%, 60% { transform: translate3d(0, 50%, 0); }
  100% { transform: translate3d(0, 0, 0); }
  90% {opacity: 1;}
  100% {opacity: 0;}
}
@keyframes showBottomText {
  0% { transform: translate3d(0, -100%, 0); }
  100% { transform: translate3d(0, 0, 0); }
  90% {opacity: 1;}
  100% {opacity: 0;}
}

@-webkit-keyframes fadein {
    from { opacity: 0; }
    to   { opacity: 1; }
  70% {opacity: 1;}
  100% {opacity: 0;}
}

.animated-title {
  color: #222;
  font-family: Roboto, Arial, sans-serif;
  height: 400px;
  left: 50%;
  position: absolute;
  top: 60%;
  transform: translate(-50%, -50%);
  width: 90vmin;
}
.animated-title > div {
  height: 50%;
  overflow: hidden;
  position: absolute;
  width: 100%;
}
.animated-title > div div {
  font-size: 8vmin;
  padding: 2vmin 0;
  position: absolute;
}
.animated-title > div div span {
  display: block;
}
.animated-title > div.text-top {
  border-bottom: 1vmin solid #000;
  top: 0;
}
.animated-title > div.text-top div {
  animation: showTopText 1s;
  animation-delay: 1s;
  animation-fill-mode: forwards;
  animation-duration:4s;
  
  animation-iteration-count: infinite;
  bottom: 0;
  transform: translate(0, 100%);  

}
.animated-title > div.text-top div span:first-child {
  color: #2193b0;
}
.animated-title > div.text-bottom {
  bottom: 0;
}
.animated-title > div.text-bottom div {
  animation: showBottomText 0.5s;
  animation-delay: 2s;
  animation-fill-mode: forwards;
  animation-duration:4s;
  animation-iteration-count: infinite;
  top: 0;
  transform: translate(0, -100%);
  color:#134E5E;
}

.slider-header {
    text-align: center;
	padding:30px;
	animation: fadein 5s;
	animation-delay: 2s;
	animation-iteration-count: infinite;
}

.slider-header > span {
	font-size:3rem;
}
.slider-header > span:first-child {
	color:#134E5E;
}

.slider-header > span:last-child {
	color:#0082c8
}

.slider-footer {
	text-align: center;
	padding:30px;
	animation: fadein 5s;
	animation-delay: 2s;
	animation-iteration-count: infinite;
	margin-bottom:100px;
}

.slider-footer > span {
	font-size:3rem;
}
.slider-footer > span:first-child {
	color:#0082c8;
}

.slider-footer > span:last-child {
	color:#134E5E;
}	

.mobile-image > img {
	text-align:center;
	width:390px;
	padding:10px;
}

</style>

<%@ include file="/jsp/part/head.jspf"%>

<div class="mobile-image visible-on-sm-down">
	<img src="https://thumbs.gfycat.com/DifficultDiligentCobra-size_restricted.gif"/>
</div>


<div class="animated-title con">
	<div class="text-top">
		<div>
			<span>WELCOME TO</span> <span>MY BLOG</span>
		</div>
	</div>
	<div class="text-bottom">
		<div>by SAM LEE</div>
	</div>
</div>


<div class="slider visible-on-md-up con">
	<div class="slider-header">
		<span>MY PERSONAL </span> <span>RECOMMENDATION 🎮</span>
	</div>

	<ul class="slides">
		<input type="radio" name="radio-btn" id="img-1" checked />
		<li class="slide-container">
			<div class="slide">
				<img
					src="https://wallpapercave.com/wp/wp3326225.jpg" />
			</div>
			<div class="nav">
				<label for="img-6" class="prev">&#x2039;</label> <label for="img-2"
					class="next">&#x203a;</label>
			</div>
		</li>

		<input type="radio" name="radio-btn" id="img-2" />
		<li class="slide-container">
			<div class="slide">
				<img
					src="https://wallup.net/wp-content/uploads/2016/05/24/369096-Dark_Souls_III-Dark_Souls-video_games.jpg" />
			</div>
			<div class="nav">
				<label for="img-1" class="prev">&#x2039;</label> <label for="img-3"
					class="next">&#x203a;</label>
			</div>
		</li>

		<input type="radio" name="radio-btn" id="img-3" />
		<li class="slide-container">
			<div class="slide">
				<img
					src="https://i.redd.it/3zkukvllfc711.jpg" />
			</div>
			<div class="nav">
				<label for="img-2" class="prev">&#x2039;</label> <label for="img-4"
					class="next">&#x203a;</label>
			</div>
		</li>

		<input type="radio" name="radio-btn" id="img-4" />
		<li class="slide-container">
			<div class="slide">
				<img
					src="https://dyom.gtagames.nl/53/55084/screen.jpg" />
			</div>
			<div class="nav">
				<label for="img-3" class="prev">&#x2039;</label> <label for="img-5"
					class="next">&#x203a;</label>
			</div>
		</li>

		<input type="radio" name="radio-btn" id="img-5" />
		<li class="slide-container">
			<div class="slide">
				<img
					src="https://images3.alphacoders.com/671/thumb-1920-671846.jpg" />
			</div>
			<div class="nav">
				<label for="img-4" class="prev">&#x2039;</label> <label for="img-6"
					class="next">&#x203a;</label>
			</div>
		</li>

		<input type="radio" name="radio-btn" id="img-6" />
		<li class="slide-container">
			<div class="slide">
				<img
					src="https://generacionxbox.com/wp-content/uploads/2018/09/sekiro-shadows-die-twice-gx.jpg" />
			</div>
			<div class="nav">
				<label for="img-5" class="prev">&#x2039;</label> <label for="img-1"
					class="next">&#x203a;</label>
			</div>
		</li>

		<li class="nav-dots"><label for="img-1" class="nav-dot"
			id="img-dot-1"></label> <label for="img-2" class="nav-dot"
			id="img-dot-2"></label> <label for="img-3" class="nav-dot"
			id="img-dot-3"></label> <label for="img-4" class="nav-dot"
			id="img-dot-4"></label> <label for="img-5" class="nav-dot"
			id="img-dot-5"></label> <label for="img-6" class="nav-dot"
			id="img-dot-6"></label></li>
	</ul>
	<div class="slider-footer ">
		<span>PLENTY TO PLAY, </span> <span>BUT GOT NO TIME 😭</span>
	</div>
</div>

<%@ include file="/jsp/part/foot.jspf"%>