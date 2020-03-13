<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="css/login.css">
	<!-- 팝오버 -->
<%--	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">--%>
<%--	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>--%>
<%--	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>--%>

	
	<script type="text/javascript">
	$(document).ready(function(){

// 		//minimum 8 characters
// 		var bad = /(?=.{8,}).*/;
// 		//Alpha Numeric plus minimum 8
// 		var good = /^(?=\S*?[a-z])(?=\S*?[0-9])\S{8,}$/;
// 		//Must contain at least one upper case letter, one lower case letter and (one number OR one special char).
// 		var better = /^(?=\S*?[A-Z])(?=\S*?[a-z])((?=\S*?[0-9])|(?=\S*?[^\w\*]))\S{8,}$/;
// 		//Must contain at least one upper case letter, one lower case letter and (one number AND one special char).
// 		var best = /^(?=\S*?[A-Z])(?=\S*?[a-z])(?=\S*?[0-9])(?=\S*?[^\w\*])\S{8,}$/;

// 		$('#inputPassword').on('keyup', function () {
// 		    var password = $(this);
// 		    var pass = password.val();
// 		    var passLabel = $('[for="password"]');
// 		    var stength = 'Weak';
// 		    var pclass = 'danger';
// 		    if (best.test(pass) == true) {
// 		        stength = 'Very Strong';
// 		        pclass = 'success';
// 		    } else if (better.test(pass) == true) {
// 		        stength = 'Strong';
// 		        pclass = 'warning';
// 		    } else if (good.test(pass) == true) {
// 		        stength = 'Almost Strong';
// 		        pclass = 'warning';
// 		    } else if (bad.test(pass) == true) {
// 		        stength = 'Weak';
// 		    } else {
// 		        stength = 'Very Weak';
// 		    }

// 		    var popover = password.attr('data-content', stength).data('bs.popover');

// 		    popover.setContent();
// 		    popover.$inputPassword.addClass(popover.options.placement).removeClass('danger success info warning primary').addClass(pclass);
// 		});
			

				var loadDiv = '';
				loadDiv +='<div id="popover-password">';
				loadDiv +='<p>Password Strength: <span id="result"> </span></p>';
				loadDiv +='<div class="progress">';
				loadDiv +='<div id="password-strength" class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:0%">';
				loadDiv +='</div>';
				loadDiv +='</div>';
				loadDiv +='<ul class="list-unstyled">';
				loadDiv +='<li class=""><span class="low-upper-case"><i class="fa fa-times" aria-hidden="true"></i></span>&nbsp; 1 lowercase &amp; 1 uppercase</li>';
				loadDiv +='<li class=""><span class="one-number"><i class="fa fa-times" aria-hidden="true"></i></span> &nbsp;1 number (0-9)</li>';
				loadDiv +='<li class=""><span class="one-special-char"><i class="fa fa-times" aria-hidden="true"></i></span> &nbsp;1 Special Character (!@#$%^&*).</li>';
				loadDiv +='<li class=""><span class="eight-character"><i class="fa fa-times" aria-hidden="true"></i></span>&nbsp; Atleast 8 Character</li>';
				loadDiv +='</ul>';
				loadDiv +='</div>';
				
				
		
				
				$('#inputPassword').keyup(function(){
					
					var password = $('#inputPassword').val();
					console.log(password);
					
					function checkStrength(password){
						
						var strength = 0;
						
			            //If password contains both lower and uppercase characters, increase strength value.
			            if (password.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/)) {
			                strength += 1;
			                $('.low-upper-case').addClass('text-success');
			                $('.low-upper-case i').removeClass('fa-times').addClass('fa-check');
			                $('#popover-password-top').addClass('hide');


			            } else {
			                $('.low-upper-case').removeClass('text-success');
			                $('.low-upper-case i').addClass('fa-times').removeClass('fa-check');
			                $('#popover-password-top').removeClass('hide');
			            }

			            //If it has numbers and characters, increase strength value.
			            if (password.match(/([a-zA-Z])/) && password.match(/([0-9])/)) {
			                strength += 1;
			                $('.one-number').addClass('text-success');
			                $('.one-number i').removeClass('fa-times').addClass('fa-check');
			                $('#popover-password-top').addClass('hide');

			            } else {
			                $('.one-number').removeClass('text-success');
			                $('.one-number i').addClass('fa-times').removeClass('fa-check');
			                $('#popover-password-top').removeClass('hide');
			            }

			            //If it has one special character, increase strength value.
			            if (password.match(/([!,%,&,@,#,$,^,*,?,_,~])/)) {
			                strength += 1;
			                $('.one-special-char').addClass('text-success');
			                $('.one-special-char i').removeClass('fa-times').addClass('fa-check');
			                $('#popover-password-top').addClass('hide');

			            } else {
			                $('.one-special-char').removeClass('text-success');
			                $('.one-special-char i').addClass('fa-times').removeClass('fa-check');
			                $('#popover-password-top').removeClass('hide');
			            }

			            if (password.length > 7) {
			                strength += 1;
			                $('.eight-character').addClass('text-success');
			                $('.eight-character i').removeClass('fa-times').addClass('fa-check');
			                $('#popover-password-top').addClass('hide');

			            } else {
			                $('.eight-character').removeClass('text-success');
			                $('.eight-character i').addClass('fa-times').removeClass('fa-check');
			                $('#popover-password-top').removeClass('hide');
			            }


			            // If value is less than 2

			            if (strength < 2) {
			                $('#result').removeClass()
			                $('#password-strength').addClass('progress-bar-danger');

			                $('#result').addClass('text-danger').text('Very Week');
			                $('#password-strength').css('width', '10%');
			            } else if (strength == 2) {
			                $('#result').addClass('good');
			                $('#password-strength').removeClass('progress-bar-danger');
			                $('#password-strength').addClass('progress-bar-warning');
			                $('#result').addClass('text-warning').text('Week')
			                $('#password-strength').css('width', '60%');
			                return 'Week'
			            } else if (strength == 4) {
			                $('#result').removeClass()
			                $('#result').addClass('strong');
			                $('#password-strength').removeClass('progress-bar-warning');
			                $('#password-strength').addClass('progress-bar-success');
			                $('#result').addClass('text-success').text('Strength');
			                $('#password-strength').css('width', '100%');

			                return 'Strong'
			            }
						
					}
					
					$('#inputPassword').popover({				
						content : loadDiv
						,trigger : 'hover'
					})

						

					
				})


				
				
				
	});
	
	</script>


</head>
<body>

<div class="container">
    <div class="row mt-15">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-signin my-5">
                <div class="card-body">
                    <h5 class="card-title text-center">Join</h5>
                    <form class="form-signin" method="post" action="/joinProc">
                        <div class="form-label-group">
                            <input type="email" id="inputEmail" name="email" class="form-control" placeholder="email"
                                   required autofocus>
                            <label for="inputEmail">아이디 name@example.com</label>
                        </div>

                        <div class="form-label-group">
                            <input type="password" id="inputPassword" name="pwd" class="form-control" placeholder="Password"
                                   required
  									data-toggle="popover" data-placement="right" 
  									data-container="body" data-html="true">
                            <label for="inputPassword">암호</label>                            
                        </div>
                        
                        <div class="form-label-group">
                            <input type="password" id="inputPassword2" name="pwd2" class="form-control" placeholder="Password"
                                   required>
                            <label for="inputPassword2">암호 확인</label>
                        </div>

					    <div class="form-label-group">
                            <input type="text" id="inputNick" name="nickname" class="form-control" placeholder="nickname"
                                   required>
                            <label for="inputNick">닉네임</label>
                        </div>

						<div class="form-label-group">
                            <input type="text" id="inputPhone" name="phone" class="form-control" placeholder="phone"
                                   required>
                            <label for="inputPhone">핸드폰 번호</label>
                        </div>

                        <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">JOIN
                        </button>
                        <hr class="my-4">
						

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>