<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>게더링(Gathering)</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
	rel="stylesheet" />
<!-- jquery -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet" />


</head>

<body id="page-top">

	<%@ include file="/WEB-INF/views/navibar.jsp"%>


	<!--메인구간 -->
	<div class="col-12">
		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

			<h2 style="padding-top: 5%">회원가입</h2>
			<!-- 회원가입 폼-->
			<form action="joinForm" id="joinForm" method="post"
				class="container row" style="float: none; margin: 100 auto;">
				<div class="mb-3">
					<!--회원ID-->
					<div class="row mb-2">
						<label for="user_id" class="col-sm-2 col-form-label">회원ID</label>

						<div class="col-auto">
							<input type="text" class="form-control" id="user_id"
								name="user_id" placeholder="회원ID" autocomplete="off"> <input
								type="hidden" id="reid" name="reid">
						</div>
						<div class="col-auto">
							<button type="button" class="btn btn-primary" onclick="idcheck()">중복체크</button>
						</div>
					</div>
					<!--비밀번호-->
					<div class="row mb-2">
						<label for="password" class="col-sm-2 col-form-label">비밀번호</label>
						<div class="col-auto">
							<input type="password" class="form-control" id="password"
								name="password" placeholder="비밀번호">
						</div>
					</div>
					<!--비밀번호확인-->
					<div class="row mb-2">
						<label for="password_check" class="col-sm-2 col-form-label">비밀번호확인</label>
						<div class="col-auto">
							<input type="password" class="form-control" id="password_check"
								name="password_check" placeholder="비밀번호확인">
						</div>
					</div>
					<!--이름-->
					<div class="row mb-2">
						<label for="name" class="col-sm-2 col-form-label">이름</label>
						<div class="col-auto">
							<input type="text" class="form-control" id="name" name="name"
								placeholder="이름" autocomplete="off">
						</div>
					</div>
					<!--닉네임-->
					<div class="row mb-2">
						<label for="nickname" class="col-sm-2 col-form-label">닉네임</label>
						<div class="col-auto">
							<input type="text" class="form-control" id="nickname"
								name="nickname" placeholder="닉네임" autocomplete="off">
						</div>
					</div>
					<!--성별-->
					<div class="row mb-2">

						<label for="gender" class="col-sm-2 col-form-label">성별</label>
						<div class="col-auto">
							<div class="row" style="padding-left: 10px;">
								<div class="form-check col-auto py-2">
									<input class="form-check-input" type="radio" name="gender"
										id="gender" value="1" checked>남자
								</div>
								<div class="form-check col-auto py-2">
									<input class="form-check-input" type="radio" name="gender"
										id="gender" value="2">여자
								</div>
								<div class="form-check col-auto py-2">
									<input class="form-check-input" type="radio" name="gender"
										id="gender" value="0">선택안함
								</div>
							</div>
						</div>
					</div>

					<!--생년월일-->
					<div class="row mb-2">
						<label for="birthday" class="col-sm-2 col-form-label">생년월일</label>
						<div class="col-auto">
							<input type="text" class="form-control" id="year" name="birthday"
								placeholder="년도" autocomplete="off">
						</div>
						<div class="col-auto">
							<select class="form-select" id="month" name="birthday">
								<option selected value="01">1월</option>
								<option value="02">2월</option>
								<option value="03">3월</option>
								<option value="04">4월</option>
								<option value="05">5월</option>
								<option value="06">6월</option>
								<option value="07">7월</option>
								<option value="08">8월</option>
								<option value="09">9월</option>
								<option value="10">10월</option>
								<option value="11">11월</option>
								<option value="12">12월</option>
							</select>
						</div>
						<div class="col-auto">
							<input type="text" class="form-control" id="date" name="birthday"
								maxlength="2" placeholder="일" autocomplete="off">
						</div>

					</div>
					<!--이메일-->
					<div class="row mb-2">
						<label for="email1" class="col-sm-2 col-form-label">이메일</label>
						<div class="col-auto">
							<input type="text" class="form-control" id="email1"
								placeholder="이메일" autocomplete="off">
						</div>
						@
						<div class="col-auto">
							<input type="text" class="form-control" id="email2"
								autocomplete="off">
						</div>
						<div class="col-auto">
							<select class="form-select" id="email3">
								<option selected value="">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="nate.com">nate.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="daum.net">daum.net</option>
							</select>
						</div>
						<input type="hidden" name="email" id="email">
					</div>

					<!--전화번호-->
					<div class="row mb-2">
						<label for="phone1" class="col-sm-2 col-form-label">전화번호</label>
						<div class="col-2">
							<input type="text" class="form-control" id="phone1" maxlength="3"
								autocomplete="off">
						</div>

						<div class="col-2">
							<input type="text" class="form-control" id="phone2" maxlength="4"
								autocomplete="off">
						</div>
						<div class="col-2">
							<input type="text" class="form-control" id="phone3" maxlength="4"
								autocomplete="off">
						</div>
						<input type="hidden" name="phone" id="phone">
					</div>

					<!--주소-->
					<div class="row mb-2">
						<label for="address" class="col-sm-2 col-form-label">주소</label>
						<div class="col-auto">
							<input type="text" class="form-control" name="address"
								id="address" size="50" readonly>
						</div>
						<div class="col-auto">
							<input class="btn btn-primary" type="button" value="주소찾기"
								onclick="kakaopost()">
						</div>
					</div>

					<!-- 유저타입 1 -->
					<input type="hidden" name="user_type" value="1">

					<!-- 버튼 -->
					<div class="row">
						<div class="col text-center">
							<input class="btn btn-primary" style="margin-right: 10px;"
								type="button" value="가입하기" onclick="go_save()">
							<button class="btn btn-primary" type="button"
								onclick="location.href='/main'">취소</button>
						</div>
					</div>

				</div>

			</form>

		</main>
	</div>

	<%@ include file="/WEB-INF/views/footer.jsp"%>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!--autoload=false 파라미터를 이용하여 자동으로 로딩되는 것을 막습니다.-->
	<script
		src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"
		charset="UTF-8"></script>
	<!--카카오 지도,주소-->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"
		charset="UTF-8"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6a81e3b1d414024f75344e4e8fc907b8&libraries=services"
		charset="UTF-8"></script>
	<!--버튼클릭시 지도에 표시-->
	<script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };


        $('#searchBtn').click(function () {
            // 버튼을 click했을때

            // 지도를 생성합니다    
            var map = new kakao.maps.Map(mapContainer, mapOption);

            // 주소-좌표 변환 객체를 생성합니다
            var geocoder = new kakao.maps.services.Geocoder();

            // 주소로 좌표를 검색합니다
            geocoder.addressSearch($('#address').val(), function (result, status) {

                // 정상적으로 검색이 완료됐으면 
                if (status === kakao.maps.services.Status.OK) {
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                    // 추출한 좌표를 통해 도로명 주소 추출
                    let lat = result[0].y;
                    let lng = result[0].x;
                    getAddr(lat, lng);
                    function getAddr(lat, lng) {
                        let geocoder = new kakao.maps.services.Geocoder();

                        let coord = new kakao.maps.LatLng(lat, lng);
                        let callback = function (result, status) {
                            if (status === kakao.maps.services.Status.OK) {
                                // 추출한 도로명 주소를 해당 input의 value값으로 적용
                                $('#address').val(result[0].road_address.address_name);
                            }
                        }
                        geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
                    }

                    // 결과값으로 받은 위치를 마커로 표시합니다
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: coords
                    });

                    // 인포윈도우로 장소에 대한 설명을 표시합니다
                    var infowindow = new kakao.maps.InfoWindow({
                        content: '<div style="width:150px;text-align:center;padding:6px 0;">정모</div>'
                    });
                    infowindow.open(map, marker);

                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                    map.setCenter(coords);
                }
            });
        });

    </script>
	<!-- 우편찾기 함수 -->
	<script>
        function kakaopost() {
            new daum.Postcode({
                oncomplete: function (data) {
                    
                    document.querySelector("#address").value = data.address
                }
            }).open();
        }
    </script>

	<!-- join 스크립트 -->
	<script type="text/javascript" src="../js/join.js" charset="UTF-8"></script>

	<!-- 이메일 입력 jquery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
		$("#email3").change(function(){
			$("#email2").val($("#email3").val());
		});
	</script>

</body>

</html>