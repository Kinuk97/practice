<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Practice</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">

    <link rel="stylesheet" href="css/login.css">

    <script type="text/javascript">
        $(document).ready(function () {
            // 이메일 저장 여부 확인
            const cookieArr = document.cookie.split(";");
            let emailCookie = "";
            for(var i in cookieArr) {
                if(cookieArr[i].search("email") != -1) {
                    emailCookie = cookieArr[i].replace("email" + "=", "");

                    $("#inputEmail").val(emailCookie);
                    $("#customCheck").prop('checked', true);
                }
            }

            $("#submitBtn").on("click", function () {
                $.ajax({
                    type: "POST"
                    , url: "/login"
                    , data: {
                        "email" : $("#inputEmail").val(),
                        "pwd" : $("#inputPassword").val(),
                        "saveEmail" : $("#customCheck").prop("checked")
                    }
                    , dataType: "json"
                    , success: function (data) {
                        if (data.result == "1") {
                            location.href = "/";
                        } else if (data.result == "-1") {
                            alert(data.msg);
                        }
                    }
                    , error: function (e) {
                        alert("로그인 오류");
                        console.log(e);
                    }
                });
            });
        });
    </script>
</head>
<body>

<!-- This snippet uses Font Awesome 5 Free as a dependency. You can download it at fontawesome.io! -->
<div class="container">
    <div class="row mt-15">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-signin my-5">
                <div class="card-body">
                    <h5 class="card-title text-center">Sign In</h5>
                    <form class="form-signin" method="post" action="/login">
                        <div class="form-label-group">
                            <input type="email" id="inputEmail" name="email" class="form-control"
                                   placeholder="Email address"
                                   required autofocus>
                            <label for="inputEmail">Email address</label>
                        </div>

                        <div class="form-label-group">
                            <input type="password" id="inputPassword" name="pwd" class="form-control"
                                   placeholder="Password"
                                   required>
                            <label for="inputPassword">Password</label>
                        </div>

                        <div class="custom-control custom-checkbox mb-3">
                            <input type="checkbox" class="custom-control-input" id="customCheck">
                            <label class="custom-control-label" for="customCheck">Remember Email</label>
                        </div>
                        <button id="submitBtn" class="btn btn-lg btn-primary btn-block text-uppercase" type="button">Sign in
                        </button>
                        <hr class="my-4">
                        <button class="btn btn-lg btn-google btn-block text-uppercase" type="button"><i
                                class="fab fa-google mr-2"></i> Sign in with Google
                        </button>
                        <button class="btn btn-lg btn-facebook btn-block text-uppercase" type="button"><i
                                class="fab fa-facebook-f mr-2"></i> Sign in with Facebook
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/layout/footer.jsp"></jsp:include>