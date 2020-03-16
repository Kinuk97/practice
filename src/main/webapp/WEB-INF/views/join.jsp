D<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">

    <link rel="stylesheet" href="css/login.css">

    <script type="text/javascript">
        $(document).ready(function () {
        	
			//핸드폰 번호 양식
			$('#inputPhone').keydown(function(event){
				
				var key = event.charCode || event.keyCode || 0;
				$text = $(this);
				if(key !== 8 && key !==9){
					if($text.val().length === 3){
						$text.val($text.val() + '-');
					}
					if($text.val().length === 8){
						$text.val($text.val() + '-')
					}
				}
				return (key==8 || key==9 || key ==46 || (key >=48 && key <=57) || (key >=96 && key <= 105));
				
			});
        	
            // 비밀번호 안전도
            var strength = 0;

            // 팝오버 생성
            $('#inputPassword').popover({
                content: function () {
                    var content = $(this).attr("data-popover-content");
                    return $(content).children(".popover-body").html();
                }
                , trigger: 'focus'
                , placeholder: "right"
            });

            // submit 버튼 비활성화
            // $("#submitBtn").attr('disabled', true);

            // 팝오버 예제 검사 예시
            // $('#password').keyup(function() {
            //     var password = $('#password').val();
            //     if (checkStrength(password) == false) {
            //         $('#sign-up').attr('disabled', true);
            //     }
            // });

            // 비밀번호 확인 이벤트
            $('#confirm-password').blur(function() {
                if ($('#inputPassword').val() !== $('#confirm-password').val()) {
                    $('#popover-cpassword').attr('hidden', false);
                    $('#sign-up').attr('disabled', true);
                } else {
                    $('#popover-cpassword').attr('hidden', true);
                    $('#sign-up').attr('disabled', false);
                }
            });

            // 팝오버 생성 이벤트
            $('#inputPassword').on('shown.bs.popover', function() {
                checkStrength();
            });

            // 비밀번호 입력 이벤트
            $('#inputPassword').on("keyup", function() {
                checkStrength();
            });

            // 비밀번호 안전도 검사
            function checkStrength() {
                let password = $('#inputPassword').val();

                strength = 0;

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
                $('.pwdResult').removeClass("text-danger text-warning text-primary text-success");
                $('.progress-bar').removeClass('bg-danger bg-warning bg-primary bg-success');
                if (strength == 0) {
                    $('.pwdResult').addClass('text-danger').text('Need Password');

                    $('.progress-bar').css('width', '0%');

                } else if (strength == 1) {
                    $('.progress-bar').addClass('bg-danger');
                    $('.pwdResult').addClass('text-danger').text('Very Week');

                    $('.progress-bar').css('width', '10%');
                } else if (strength == 2) {
                    $('.progress-bar').addClass('bg-warning');
                    $('.pwdResult').addClass('text-warning').text('Week')
                    $('.progress-bar').css('width', '60%');

                } else if (strength == 3) {
                    $('.progress-bar').addClass('bg-primary');
                    $('.pwdResult').addClass('text-primary').text('Good')
                    $('.progress-bar').css('width', '80%');

                } else if (strength == 4) {
                    $('.progress-bar').addClass('bg-success');
                    $('.pwdResult').addClass('text-success').text('Strength');
                    $('.progress-bar').css('width', '100%');

                    return true;
                }
            }
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
                            <input type="password" id="inputPassword" name="pwd" class="form-control"
                                   placeholder="Password"
                                   required
                                   data-toggle="popover" data-placement="right" data-html="true"
                                   data-popover-content="#popover-password">
                            <label for="inputPassword">암호</label>

                            <div id="popover-password" hidden="hidden">
                                <div class="popover-body">
                                    <p>Password Strength: <span id="result" class="pwdResult"> </span></p>
                                    <div class="progress">
                                        <div id="password-strength" class="progress-bar"
                                             role="progressbar" aria-valuemin="0" aria-valuemax="100"
                                             style="width:0%">
                                        </div>
                                    </div>
                                    <ul class="list-unstyled">
                                        <li class=""><span class="low-upper-case"><i class="fa fa-times"
                                                                                     aria-hidden="true"></i></span>&nbsp;
                                            1 lowercase &amp; 1 uppercase
                                        </li>
                                        <li class=""><span class="one-number"><i class="fa fa-times"
                                                                                 aria-hidden="true"></i></span> &nbsp;1
                                            number (0-9)
                                        </li>
                                        <li class=""><span class="one-special-char"><i class="fa fa-times"
                                                                                       aria-hidden="true"></i></span>
                                            &nbsp;1 Special Character (!@#$%^&*).
                                        </li>
                                        <li class=""><span class="eight-character"><i class="fa fa-times"
                                                                                      aria-hidden="true"></i></span>&nbsp;
                                            Atleast 8 Character
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="form-label-group">
                            <input type="password" id="confirm-password" class="form-control"
                                   placeholder="Confirm Password"
                                   required>
                            <label for="confirm-password">암호 확인 <span id="popover-cpassword" class="text-right block-help" hidden="hidden"><i class="fa fa-info-circle text-danger" aria-hidden="true"></i> Password don't match</span></label>
                        </div>

                        <div class="form-label-group">
                            <input type="text" id="inputNick" name="nickname" class="form-control"
                                   placeholder="nickname"
                                   required>
                            <label for="inputNick">닉네임</label>
                        </div>

                        <div class="form-label-group">
                            <input type="text" id="inputPhone" name="phone" class="form-control" maxlength="13"
                                   required>
                            <label for="inputPhone">핸드폰 번호</label>
                        </div>

                        <button class="btn btn-lg btn-primary btn-block text-uppercase" type="button" id="submitBtn">JOIN
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>