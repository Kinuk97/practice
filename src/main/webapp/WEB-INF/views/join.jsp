<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" crossorigin="anonymous"></script>


	<link rel="stylesheet" href="css/login.css">
	<!-- 팝오버 -->
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

	
	<script type="text/javascript">
	$(document).ready(function(){

		//minimum 8 characters
		var bad = /(?=.{8,}).*/;
		//Alpha Numeric plus minimum 8
		var good = /^(?=\S*?[a-z])(?=\S*?[0-9])\S{8,}$/;
		//Must contain at least one upper case letter, one lower case letter and (one number OR one special char).
		var better = /^(?=\S*?[A-Z])(?=\S*?[a-z])((?=\S*?[0-9])|(?=\S*?[^\w\*]))\S{8,}$/;
		//Must contain at least one upper case letter, one lower case letter and (one number AND one special char).
		var best = /^(?=\S*?[A-Z])(?=\S*?[a-z])(?=\S*?[0-9])(?=\S*?[^\w\*])\S{8,}$/;

		$('#password').on('keyup', function () {
		    var password = $(this);
		    var pass = password.val();
		    var passLabel = $('[for="password"]');
		    var stength = 'Weak';
		    var pclass = 'danger';
		    if (best.test(pass) == true) {
		        stength = 'Very Strong';
		        pclass = 'success';
		    } else if (better.test(pass) == true) {
		        stength = 'Strong';
		        pclass = 'warning';
		    } else if (good.test(pass) == true) {
		        stength = 'Almost Strong';
		        pclass = 'warning';
		    } else if (bad.test(pass) == true) {
		        stength = 'Weak';
		    } else {
		        stength = 'Very Weak';
		    }

		    var popover = pwd.attr('data-content', stength).data('bs.popover');
		    popover.setContent();
		    popover.$tip.addClass(popover.options.placement).removeClass('danger success info warning primary').addClass(pclass);

		});

		$('input[data-toggle="popover"]').popover({
		    placement: 'top',
		    trigger: 'focus'
		});

		})
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
  									data-toggle="popover" data-placement="right" data-content="비밀번호를 입력해주세요" title="비밀번호 안전도">
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