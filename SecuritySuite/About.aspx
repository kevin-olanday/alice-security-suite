<%@ Page Title="Welcome" Language="C#" MasterPageFile="~/Alice.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="AliceOnline.Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<!DOCTYPE html>


<body class="animsition" >

<!-- Burger menu 
================================================== -->
<a href="javascript:;" id="burger-menu" class="burger-menu">
	<span></span>
	<span></span>
	<span></span>
</a>

<!-- Main navigation section
================================================== -->
<nav id="navigation">
	<div class="inner-table">
		<div class="inner-cell">
			<div class="nav-wrapper">
				
				<a href="javascript:;" id="close-menu">
					<span></span>
					<span></span>
				</a>

				<div class="row">
					<div class="col-md-4 col-md-offset-4">
						
						<ul>
							<li>
								<a href="index.html" class="active at-link">
									<i class="fa fa-home"></i>
									<span>About</span>
								</a>
							</li>
							<li>
								<a href="profile.html" class="at-link">
									<i class="fa fa-user"></i>
									<span>Profile</span>
								</a>
							</li>
							<li>
								<a href="resume.html" class="at-link">
									<i class="fa fa-file-text-o"></i>
									<span>Resume</span>
								</a>
							</li>

							<li>
								<a href="portfolio.html" class="at-link">
									<i class="fa fa-briefcase"></i>
									<span>Portfolio</span>
								</a>
							</li>

							<li>
								<a href="blog.html" class="at-link">
									<i class="fa fa-file-text-o"></i>
									<span>Blog</span>
								</a>
							</li>
							<li>
								<a href="contacts.html" class="at-link">
									<i class="fa fa-phone"></i>
									<span>Contact us</span>
								</a>
							</li>
						</ul>

						<h4>Home</h4>

					</div>
				</div>

			</div>
		</div>
	</div>
</nav>



<!-- Header -->
<header id="header">
	<div class="container">
		<div class="row">
			<div class="col-xs-10">
				
				<a href="./" id="logo" class="at-link">Kevin</a>

				<div class="page-title">
					<div class="title-wrap">
						<h1>Profile</h1>
						<p class="lead">About Myself</p>
					</div>
				</div>

			</div>
			<div class="col-xs-2 text-right">
				<div class="burger-menu-wrapper">
					<a href="javascript:;" class="burger-menu">
						<span></span>
						<span></span>
						<span></span>
					</a>
				</div>
			</div>
		</div>
	</div>
</header>
<!--End of Header -->


<!-- Content section
================================================== -->
<section class="content no-padding">

	<div class="row table-row">
		<div class="col-md-6 hidden-sm hidden-xs" data-bg-image="images/pages/about.jpg">
			
		</div>
		<div class="col-md-6">
			
			<div class="inner-wrapper">
				<h2 class="title-lg">ABOUT ME</h2>
				<p>
				  Engineer | Programmer | Writer | Pianist | Gamer | Armchair Philosopher				  
				</p>

				<p>
			      At the present, I am having a blast working for a global company as an Operations Specialist and Script Developer. My career has enabled me to work with multiple technology teams filled with talented people of diverse backgrounds where I have proven my technical aptitude and logical thinking.

				</p>
				
				<p>
				  Currently living in the Southern parts of Sunny Manila. Open to occassional overseas  business opportunities.
				</p>

				<br>
				<p>
					<a href="#" class="btn">Hire me now!</a>
				</p>
			</div>

		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			
			<div class="info-boxes">
				<div class="ib-item" data-bg-color="#343434">
					<img src="images/4x3.png" class="img-block">
					<span class="img-lg" style="background-image:url(images/pages/profile/icon-1.png);"></span>
					<div class="entry-box">
						<span class="icon-img" style="background-image:url(images/pages/profile/icon-1.png);"></span>
						<h3>Name</h3>
						<p>Kevin "Yad" Olanday</p>
					</div>
				</div>
				<div class="ib-item" data-bg-color="#3b3b3b">
					<img src="images/4x3.png" class="img-block">
					<span class="img-lg" style="background-image:url(images/pages/profile/icon-2.png);"></span>
					<div class="entry-box">
						<span class="icon-img" style="background-image:url(images/pages/profile/icon-2.png);"></span>
						<h3>Birthdate</h3>
						<p>July 27 1991</p>
					</div>
				</div>
				<div class="ib-item" data-bg-color="#343434">
					<img src="images/4x3.png" class="img-block">
					<span class="img-lg" style="background-image:url(images/pages/profile/icon-3.png);"></span>
					<div class="entry-box">
						<span class="icon-img" style="background-image:url(images/pages/profile/icon-3.png);"></span>
						<h3>Phone</h3>
						<p>+(63)9279814190</p>
					</div>
				</div>
				<div class="ib-item" data-bg-color="#3b3b3b">
					<img src="images/4x3.png" class="img-block">
					<span class="img-lg" style="background-image:url(images/pages/profile/icon-4.png);"></span>
					<div class="entry-box">
						<span class="icon-img" style="background-image:url(images/pages/profile/icon-4.png);"></span>
						<h3>Email</h3>
						<p>kevin.olanday@gmail.com</p>
					</div>
				</div>
				<div class="ib-item" data-bg-color="#343434">
					<img src="images/4x3.png" class="img-block">
					<span class="img-lg" style="background-image:url(images/pages/profile/icon-5.png);"></span>
					<div class="entry-box">
						<span class="icon-img" style="background-image:url(images/pages/profile/icon-5.png);"></span>
						<h3>Location</h3>
						<p>Currently in Manila</p>
					</div>
				</div>
			</div>

		</div>
	</div>



	<div class="container padding4x">
		<div class="row">
		
			<div class="col-md-12">
				<h2 class="title-md text-center">EXPERTISE</h2>
				<br>
				<br>
			</div>

			<div class="col-md-4">
				
				<div class="service-item">
					<div class="icon">
						<span style="background-image:url(images/pages/profile/s-1.png);"></span>
					</div>
					<div class="excerpt">
						<span class="icon-img" style="background-image:url(images/pages/profile/s-1.png);"></span>
						<h4>Electronics Engineering</h4>
						<p>
							Pushing the human race forward. License in Electronics and Communications Engineering. Passion for Robotics.  Work experience in an international Semiconductor Company. 
						</p>
					</div>
				</div>

			</div>

			<div class="col-md-4">
				
				<div class="service-item">
					<div class="icon">
						<span style="background-image:url(images/pages/profile/s-2.png);"></span>
					</div>
					<div class="excerpt">
						<span class="icon-img" style="background-image:url(images/pages/profile/s-2.png);"></span>
						<h4>Script Development</h4>
						<p>
							Faster.Simpler.More efficient. Why let humans do tasks machines can do better?. My cost-saving tools of the trade - Powershell. C#. VB. ASP. Javascript. 
						</p>
					</div>
				</div>

			</div>

			<div class="col-md-4">
				
				<div class="service-item">
					<div class="icon">
						<span style="background-image:url(images/pages/profile/s-3.png);"></span>
					</div>
					<div class="excerpt">
						<span class="icon-img" style="background-image:url(images/pages/profile/s-3.png);"></span>
						<h4>Windows Operations</h4>
						<p>
							Everything about the Windows Operating System - Active Directory. SCOM. SCCM. PKI. Clustering. File Services. VMWare. 
						</p>
					</div>
				</div>

			</div>
			
		</div>

		<div class="row">
			
			<div class="col-md-4">
				
				<div class="service-item">
					<div class="icon">
						<span style="background-image:url(images/pages/profile/s-4.png);"></span>
					</div>
					<div class="excerpt">
						<span class="icon-img" style="background-image:url(images/pages/profile/s-4.png);"></span>
						<h4>Workplace Operations</h4>
						<p>
							Managing the company channels - Sharepoint. Outlook. Exchange. Enterprise Vault. Citrix. XenApp. F5. OCS. Airwatch. BES for Blackberry. 
						</p>
					</div>
				</div>

			</div>

			<div class="col-md-4">
				
				<div class="service-item">
					<div class="icon">
						<span style="background-image:url(images/pages/profile/s-5.png);"></span>
					</div>
					<div class="excerpt">
						<span class="icon-img" style="background-image:url(images/pages/profile/s-5.png);"></span>
						<h4>Security Administration</h4>
						<p>
							Protecting Cyber Security Sytems and - Active Directory. LDAP. DB Artisan. BMC CONTROL-SA. SAPM. Vasco Identikey.
						</p>
					</div>
				</div>

			</div>

			<div class="col-md-4">
				
				<div class="service-item">
					<div class="icon">
						<span style="background-image:url(images/pages/profile/s-6.png);"></span>
					</div>
					<div class="excerpt">
						<span class="icon-img" style="background-image:url(images/pages/profile/s-6.png);"></span>
						<h4>Application Support</h4>
						<p>
							Making sure we don't lose money - high level support for application flow including configuration, scheduling control, and scripting.
						</p>
					</div>
				</div>

			</div>
			
		</div>
	</div>



	<div data-bg-color="#131313" class="padding4x">
		
		<div class="container">

			<div class="row">
				<div class="col-md-12">
					<h2 class="title-md text-center text-light">TESTIMONIALS</h2>
					<br>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					
					<!-- additional class testimonial with: color-normal -->
					<div class="testimonial">
						<div class="border-helper">
							<div class="left-side"></div>
							<div class="right-side"></div>
						</div>
						<div class="entry-item">
							<div class="avatar">
								<div class="radius-cutter">
									<div class="radius"></div>
								</div>
								<img src="images/pages/profile/thumb1.png" alt="author">
							</div>
							<blockquote>
								Kevin has shown his capacity well during his first 6 month stay with Wintel Team.
								He has exceeded tasks that were assigned to him.
								He has authored a drive C automated script that enables us to clean up drive C of servers every after patching.
								He has shown a very good communication skill as well by sending an accurate problem detail with resolution to our clients.
								He has joined multiple triage and showed his confidence in answering issues pertaining with the technologies we handled.
								I find Kevin as a future asset to Macquarie.
								<cite>MICHAEL CORCIEGA-Wintel Operations,Team Lead</cite>
							</blockquote>
						</div>
					</div>

				</div>

				<div class="col-md-6">
					
					<!-- additional class testimonial with: color-normal -->
					<div class="testimonial">
						<div class="border-helper">
							<div class="left-side"></div>
							<div class="right-side"></div>
						</div>
						<div class="entry-item">
							<div class="avatar">
								<div class="radius-cutter">
									<div class="radius"></div>
								</div>
								<img src="images/pages/profile/thumb2.png" alt="author">
							</div>
							<blockquote>
								Kevin has been with the PTR team for only ~4months. He has picked up Queue Management process required from him in a very quick manner, and excelled in learning new processes in a faster manner than expected from a grad.
								Kevin has a positive and cheery attitude to his work with shows and reflects positively on the team too.
								As a high achieving grad, Kevin is in a great position to assist the team by adding fresh eyes to existing processes, and questioning why we may do repetitive or redundant tasks that members of the team may be used to 'just doing'.
								Keep up the good work Kevin.
								<cite>ROBER WALKER-Business Application Support,Team Lead</cite>
							</blockquote>
						</div>
					</div>
				</div>
				
				<div class="col-md-6">
					
					<!-- additional class testimonial with: color-normal -->
					<div class="testimonial">
						<div class="border-helper">
							<div class="left-side"></div>
							<div class="right-side"></div>
						</div>
						<div class="entry-item">
							<div class="avatar">
								<div class="radius-cutter">
									<div class="radius"></div>
								</div>
								<img src="images/pages/profile/thumb2.png" alt="author">
							</div>
							<blockquote>
								In just 4 months of his graduate program to Workplace Ops Kevin has made significant contribution to the team.
								He has personally took an initiative to automate 1 of our manual process that has been around for more than 5 years ( or since I joined MGL), and in just 4 months Kevin has found a way to automate it. 
								This automation has significantly reduced the time of raising mailbox restore request. Great contribution from Kevin.
                            	He has received positive feedback from our Service Owner for his initiatives in creating a tool that would help the team manage the mailbox easily.
                                I commend Kevin for his contribution to workplace Ops in just a very short period of time.
								I know there is still a lot that we can improve and automate in Workplace Ops and with Kevin assistance it will be possible now. 
								I hope Kevin choose Workplace Ops as his permanent team.

								<cite>JOJO SOLIS-Workplace Operations,Team Lead</cite>
							</blockquote>
						</div>
					</div>
				</div>	
					
				<div class="col-md-6">
				
					<!-- additional class testimonial with: color-normal -->
					<div class="testimonial">
						<div class="border-helper">
							<div class="left-side"></div>
							<div class="right-side"></div>
						</div>
						<div class="entry-item">
							<div class="avatar">
								<div class="radius-cutter">
									<div class="radius"></div>
								</div>
								<img src="images/pages/profile/thumb2.png" alt="author">
							</div>
							<blockquote>
								Kevin has been a great addition to the team. His knowledge and expertise has benefited the team as a whole, especially for the task the requires scripting. Kevin has surpassed what is expected of him as Senior Associate, and has continuously work efficiently and methodically to drive improvements across Security Operations. In the next 6months, I expect that Kevin has fully implemented project Alice. 
                                Kevin has been an asset to the team and has a solid potential ahead of him. 
								<cite>ALEX TONGSON-Security Operations,Team Lead</cite>
							</blockquote>
						</div>
					</div>

				</div>

			</div>
		</div>

	</div>




	<div class="container padding4x">
		<div class="row">
			<div class="col-md-12">
				<h2 class="title-md text-center">CHOOSE YOUR PRICING PLANS</h2>
				<br>
			</div>
		</div>
		<div class="row">
			
			<div class="col-md-3 col-sm-6">
				
				<div class="price-box">
					<div class="entry-item">
						<div class="circle-label">
							<div class="inner-table">
								<div class="inner-cell">
									<h6>$50.00</h6>
									<p>Per Month</p>
								</div>
							</div>
						</div>

						<div class="box-info">
							<h4>web oriented</h4>
							<p>Photoshop To HTML Code</p>
							<p>Available For Customization</p>
							<p>Wordpress Conversation</p>
							<p>Logo Design</p>
							<p>Other Options</p>
							<p>
								<a href="#" class="btn">sign up</a>
							</p>
						</div>
					</div>
				</div>

			</div>

			<div class="col-md-3 col-sm-6">
				
				<div class="price-box">
					<div class="entry-item">
						<div class="circle-label">
							<div class="inner-table">
								<div class="inner-cell">
									<h6>$80.00</h6>
									<p>Per Month</p>
								</div>
							</div>
						</div>

						<div class="box-info">
							<h4>Marketing</h4>
							<p>Photoshop To HTML Code</p>
							<p>Available For Customization</p>
							<p>Wordpress Conversation</p>
							<p>Logo Design</p>
							<p>Other Options</p>
							<p>
								<a href="#" class="btn">sign up</a>
							</p>
						</div>
					</div>
				</div>

			</div>

			<div class="col-md-3 col-sm-6">
				
				<div class="price-box">
					<div class="entry-item">
						<div class="circle-label">
							<div class="inner-table">
								<div class="inner-cell">
									<h6>$120.00</h6>
									<p>Per Month</p>
								</div>
							</div>
						</div>

						<div class="box-info">
							<h4>Photography</h4>
							<p>Photoshop To HTML Code</p>
							<p>Available For Customization</p>
							<p>Wordpress Conversation</p>
							<p>Logo Design</p>
							<p>Other Options</p>
							<p>
								<a href="#" class="btn">sign up</a>
							</p>
						</div>
					</div>
				</div>

			</div>

			<div class="col-md-3 col-sm-6">
				
				<div class="price-box">
					<div class="entry-item">
						<div class="circle-label">
							<div class="inner-table">
								<div class="inner-cell">
									<h6>$200.00</h6>
									<p>Per Month</p>
								</div>
							</div>
						</div>

						<div class="box-info">
							<h4>Game Design</h4>
							<p>Photoshop To HTML Code</p>
							<p>Available For Customization</p>
							<p>Wordpress Conversation</p>
							<p>Logo Design</p>
							<p>Other Options</p>
							<p>
								<a href="#" class="btn">sign up</a>
							</p>
						</div>
					</div>
				</div>

			</div>


		</div>
	</div>


</section>



<!-- Footer section
================================================== -->
<footer id="footer" class="text-center">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<p>Copyright © <a href="#">Gary Raptish</a>. All rights reserved.</p>
				<p>Made with love by <a href="#">Themeton</a></p>

				<ul class="social">
					<li><a href="#"><i class="fa fa-facebook"></i></a></li>
					<li><a href="#"><i class="fa fa-twitter"></i></a></li>
					<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
					<li><a href="#"><i class="fa fa-tumblr"></i></a></li>
					<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
				</ul>
			</div>
		</div>
	</div>
</footer>
<!-- End of Footer -->


<!-- Scripts
================================================== -->
<script type="text/javascript" src="vendors/jquery.waypoints.min.js"></script>
<script type="text/javascript" src="vendors/isotope.pkgd.min.js"></script>
<script type="text/javascript" src="js/scripts.js"></script>


</body>

			
</asp:Content>