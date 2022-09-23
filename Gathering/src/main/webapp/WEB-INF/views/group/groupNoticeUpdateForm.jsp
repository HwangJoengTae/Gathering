<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>One Page Wonder - Start Bootstrap Template</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"
        rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
        rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../css/styles.css" rel="stylesheet" />
    <script type="text/javascript" src="../js/groupNotice.js"></script>

</head>

<body id="page-top">
   
   <%@ include file="/WEB-INF/views/navibar.jsp" %>
    
    <div class="container-fluid">
        <div class="row">
            
            <!--사이드바 시작구간-->
            <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
                <div class="position-sticky pt-3">
                    <ul class="nav flex-column">
                         <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/group/groupDetail?group_seq=${group.group_seq}">
                                <span data-feather="home"></span>
                                모임상세
                            </a>
                        </li>
                        <li class="nav-item">
                             <a class="nav-link" href="/group/groupNoticeListView?group_seq=${group.group_seq}">
                                <span data-feather="file"></span>
                                모임공지
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <span data-feather="shopping-cart"></span>
                                모임앨범
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <span data-feather="users"></span>
                                모임수다
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <!--메인구간 -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <h2 style="padding-top:5%">${group.group_name} 공지수정</h2>

                <!-- 모임생성폼 폼-->
                <form class="container row" id="formm" style="float: none; margin:100 auto;" action="/groupNoticeUpdateAction" method="post" enctype="multipart/form-data">
             	   <input type="hidden" name="group_notice_seq" value="${groupNotice.group_notice_seq }">
             	   <input type="hidden" name="group_seq" value="${group.group_seq }">
                    <div class="mb-3">
                        <!--공지타입-->
                        <div class="row mb-2">
                            <label for="input_crew_notice_type" class="col-sm-2 col-form-label">타입</label>
                            <div class="col-auto">
                                <select class="form-select" aria-label="Default select example" name="type" id="type"  onclick="onActiveUpdate()" >
                                    <option selected value="일반" >일반</option>
                                    <option value="정모" >정모</option>
                                </select>
                            </div>
                        </div>

                        <!--모임공지 제목-->
                        <div class="row mb-2">
                            <label for="input_crew_notice_title" class="col-sm-2 col-form-label">제목</label>
                            <div class="col-auto">
                                <input type="text" size="70" class="form-control" id="title" name="title"
                                    placeholder="${groupNotice.title}">
                            </div>
                        </div>

                        <!--상세내용-->
                        <div class="row mb-2">
                            <label for="input_crew_notice_detail" class="col-sm-2 col-form-label">상세내용</label>
                            <div class="col-auto">
                                <textarea type="text" class="form-control" id="content" cols="70"
                                    rows="5" placeholder="${groupNotice.content}" name="content" style="resize:none;"></textarea>
                            </div>
                        </div>

                        <!--사진첨부-->
                        <div class="row mb-2">
                            <label for="input_notice_file" class="col-sm-2 col-form-label">파일첨부</label>
                            <div class="col-7">
                                <input class="form-control"  multiple id="fileItem"  name="image" type="file" id="image" multiple>
                            </div>
                        </div>
       
                        <!--날짜 시간-->
                        <div class="row mb-2">
                            <label for="input_crew_notice_date" class="col-sm-2 col-form-label">일시</label>
                            <div class="col-auto">
                                <input type="Datetime-local" id="jungmo_date"  name="jungmo_date" disabled>          
                            </div>
                        </div>

                        <!--주소-->
                        <div class="row mb-2">
                            <label for="input_address1" name="jungmo_place" id="jungmo_place" class="col-sm-2 col-form-label">주소</label>
                            <div class="col-auto">
                                <input type="text" name="address" id="address" size="50"  disabled>
                                <input class="btn btn-primary" type="button" value="주소찾기" onclick="kakaopost()"> 
                                <button class="btn btn-primary" type="button" id="searchBtn">검색</button>
                                <div id="map" style="width:450px;height:350px;"></div>
                            </div>
                        </div> 

                        <!-- 수정 / 취소 -->
                            <div class="row">
                                <div class="col text-center">
                                    <input class="btn btn-primary" style="margin-right: 10px;" type="button"  onclick="groupNotice_update()" value="수정">
                                    <button class="btn btn-primary" type="button" onclick="location.href='/group/groupNoticeViewAction?group_seq=${group.group_seq }&group_notice_seq=${groupNotice.group_notice_seq}'">취소</button>
                                </div>
                            </div>
                      </div>
                </form>
            </main>
        </div>
    </div>

    <%@ include file="/WEB-INF/views/footer.jsp" %>
    
    
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
    

    <!-- jquery -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <!--autoload=false 파라미터를 이용하여 자동으로 로딩되는 것을 막습니다.-->
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
    <!--카카오 지도,주소-->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6a81e3b1d414024f75344e4e8fc907b8&libraries=services"></script>
   
   
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
    <!--카카오 지도 구현 스크립트 끝-->
    
    
</body>

</html>
