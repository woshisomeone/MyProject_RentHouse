<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>FAQs</title>
</head>
<body>
<%@ include file="menu.txt"%>
		<!---banner--->
		<div class="banner-section">
			<div class="container">
				<h2>FAQs</h2>
			</div>
		</div>
		<!---banner--->
		<div class="content">
			<div class="faq-section">
				<div class="container">
						<h3>问题解答</h3>
						<div class="test-list">
							<div class="tab1 wow bounceIn" data-wow-delay="0.4s">
								<ul>
									<li><span> </span></li>
									<li class="text">What does royalty free mean?</li>
								</ul>
								<p>Lorem ipsum dolor amet, libero turpis non cras ligula, id commodo, aenean est in volutpat amet sodales, 
									porttitor bibendum facilisi suspendisse, aliquam ipsum ante morbi sed ipsum mollis.</p>
								<p>Lorem ipsum dolor amet, libero turpis non cras ligula, id commodo, aenean est in volutpat amet sodales, 
									porttitor bibendum facilisi suspendisse, aliquam ipsum ante morbi sed ipsum mollis.</p>
							</div>
							<div class="tab2 wow bounceIn" data-wow-delay="0.4s">
								<ul>
									<li><span> </span></li>
									<li class="text">What does non-exclusive mean?</li>
								
								</ul>
								<p>Lorem ipsum dolor amet, libero turpis non cras ligula, id commodo, aenean est in volutpat amet sodales, 
									porttitor bibendum facilisi suspendisse, aliquam ipsum ante morbi sed ipsum mollis.</p>
								<p>Please note that there may be some limits placed on uses under the different license types available on the marketplaces, such as our photo and music licenses (see the PhotoDune and AudioJungle FAQs for more information)</p>
							</div>
							<div class="tab3 wow bounceIn" data-wow-delay="0.4s">
								<ul>
									<li><span> </span></li>
									<li class="text">How to install Wordpress</li>
									
								</ul>
								<p>Lorem ipsum dolor amet, libero turpis non cras ligula, id commodo, aenean est in volutpat amet sodales, 
									porttitor bibendum facilisi suspendisse, aliquam ipsum ante morbi sed ipsum mollis.</p>
								<p>Lorem ipsum dolor amet, libero turpis non cras ligula, id commodo, aenean est in volutpat amet sodales, 
									porttitor bibendum facilisi suspendisse, aliquam ipsum ante morbi sed ipsum mollis.</p>
							</div>
							<div class="tab4 wow bounceIn" data-wow-delay="0.4s">
								<ul>
									<li><span> </span></li>
									<li class="text">How to create new FAQ</li>
								</ul>
								<p>Lorem ipsum dolor amet, libero turpis non cras ligula, id commodo, aenean est in volutpat amet sodales, 
									porttitor bibendum facilisi suspendisse, aliquam ipsum ante morbi sed ipsum mollis.</p>
								<p>Lorem ipsum dolor amet, libero turpis non cras ligula, id commodo, aenean est in volutpat amet sodales, 
									porttitor bibendum facilisi suspendisse, aliquam ipsum ante morbi sed ipsum mollis.</p>
							</div>
							<div class="tab5 wow bounceIn" data-wow-delay="0.4s">
								<ul>
									<li><span> </span></li>
									<li class="text">How to install the demo Content</li>
								</ul>
								<p>Lorem ipsum dolor amet, libero turpis non cras ligula, id commodo, aenean est in volutpat amet sodales, 
									porttitor bibendum facilisi suspendisse, aliquam ipsum ante morbi sed ipsum mollis.</p>
								<p>Lorem ipsum dolor amet, libero turpis non cras ligula, id commodo, aenean est in volutpat amet sodales, 
									porttitor bibendum facilisi suspendisse, aliquam ipsum ante morbi sed ipsum mollis.</p>
							</div>
							<div class="tab6 wow bounceIn" data-wow-delay="0.4s">
								<ul>
									<li><span> </span></li>
									<li class="text">Can the Theme be translated?</li>
								</ul>
								<p>Lorem ipsum dolor amet, libero turpis non cras ligula, id commodo, aenean est in volutpat amet sodales, 
									porttitor bibendum facilisi suspendisse, aliquam ipsum ante morbi sed ipsum mollis.</p>
								<p>Please note that there may be some limits placed on uses under the different license types available on the marketplaces, such as our photo and music licenses (see the PhotoDune and AudioJungle FAQs for more information)</p>

							</div>
						</div>
						<!-- script for tabs -->
							<script>
								$(document).ready(function(){
									$(".tab1 p").hide();
									$(".tab2 p").hide();
									$(".tab3 p").hide();
									$(".tab4 p").hide();
									$(".tab5 p").hide();
									$(".tab6 p").hide();
									$(".tab1 ul").click(function(){
										$(".tab1 p").slideToggle(300);
										$(".tab2 p").hide();
										$(".tab3 p").hide();
										$(".tab4 p").hide();
										$(".tab5 p").hide();
										$(".tab6 p").hide();
									})
									$(".tab2 ul").click(function(){
										$(".tab2 p").slideToggle(300);
										$(".tab1 p").hide();
										$(".tab3 p").hide();
										$(".tab4 p").hide();
										$(".tab5 p").hide();
										$(".tab6 p").hide();
									})
									$(".tab3 ul").click(function(){
										$(".tab3 p").slideToggle(300);
										$(".tab4 p").hide();
										$(".tab2 p").hide();
										$(".tab1 p").hide();
										$(".tab5 p").hide();
										$(".tab6 p").hide();
									})
									$(".tab4 ul").click(function(){
										$(".tab4 p").slideToggle(300);
										$(".tab3 p").hide();
										$(".tab2 p").hide();
										$(".tab1 p").hide();
										$(".tab5 p").hide();
										$(".tab6 p").hide();									
									})	
									$(".tab5 ul").click(function(){
										$(".tab5 p").slideToggle(300);
										$(".tab3 p").hide();
										$(".tab2 p").hide();
										$(".tab1 p").hide();
										$(".tab4 p").hide();
										$(".tab6 p").hide();									
									})
									$(".tab6 ul").click(function(){
										$(".tab6 p").slideToggle(300);
										$(".tab3 p").hide();
										$(".tab2 p").hide();
										$(".tab1 p").hide();
										$(".tab5 p").hide();
										$(".tab4 p").hide();									
									})
								});
							</script>
						<!-- script for tabs -->
					</div>
				</div>
			</div>
		</div>
		<!---footer--->
			<div class="footer-section">
				<div class="container">
					<div class="footer-grids">
						<div class="col-md-3 footer-grid">
							<h4>About Real Homes</h4>
							<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
						</div>
						<div class="col-md-3 footer-grid">
							<h4>Recent Posts</h4>
							<ul>
								<li><a href="#">Lorem Post With Image Format</a></li>
								<li><a href="#">Example Video Blog Post</a></li>
								<li><a href="#">Example Post With Gallery Post </a></li>
								<li><a href="#">Example Video Blog Post</a></li>
								<li><a href="#">Lorem Post With Image Format</a></li>
								<li><a href="#">Example Video Blog Post</a></li>
							</ul>
						</div>
						<div class="col-md-3 footer-grid">
							<h4>Useful links</h4>
							<ul>
								<li><a href="terms.html">Terms of Use</a></li>
								<li><a href="privacy.html">Privacy Policy</a></li>
								<li><a href="contact.html">Contact Support </a></li>
								<li><a href="agents.html"> All Agents</a></li>
								<li><a href="blog.html">Blog</a></li>
								<li><a href="faqs.html">FAQs</a></li>
							</ul>
						</div>
						<div class="col-md-3 footer-grid">
							<h4>Get In Touch</h4>
							<p>8901 Marmora Road</p>
							<p>Glasgow, DO4 89GR.</p>
							<p>Freephone : +1 234 567 890</p>
							<p>Telephone : +1 234 567 890</p>
							<p>FAX : + 1 234 567 890</p>
							<p>E-mail : <a href="mailto:example@mail.com"> example@mail.com</a></p>
						</div>
						<div class="clearfix"> </div>
					</div>
				</div>
			</div>
	<%@ include file="footer.txt"%>
</body>
</html>