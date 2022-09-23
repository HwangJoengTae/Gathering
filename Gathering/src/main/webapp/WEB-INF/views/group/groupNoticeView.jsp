<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

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
                            <a class="nav-link" href="/group/groupAlbum?group_seq=${group.group_seq}">
                                <span data-feather="shopping-cart"></span>
                                모임앨범
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/group/groupSuda?group_seq=${group.group_seq}">
                                <span data-feather="users"></span>
                                모임수다
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <!--메인구간 -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

                <h2 style="padding-top:5%">${group.group_name} 공지</h2>

                <!-- 삭제/수정 버튼 이거는 모임장한테만 보여지게 해야됨 -->
                <c:forEach items="${crewList}"  var="crewListVo" varStatus="status">
                <c:if test="${crewListVo.type eq 1  && sessionScope.user.user_id eq crewListVo.user_id}">
                <div class="row mb-2">
                    <div class="col">
                        <button type="button" class="btn btn-outline-primary" style="float:right" onclick="location.href='/groupNoticeDeleteForm?group_seq=${group.group_seq }&group_notice_seq=${groupNotice.group_notice_seq}'">삭제</button>
                        <button type="button" class="btn btn-outline-primary" style="float:right; margin-right:10px" onclick="location.href='/group/groupNoticeUpdateForm?group_seq=${group.group_seq }&group_notice_seq=${groupNotice.group_notice_seq}'">수정</button>  
                    </div>       
                </div>
                </c:if>
                </c:forEach>

                <!--해당 공지리스트 양식으로 한줄 요약-->
                <div class="table-responsive">
                    <table class="table table-striped table-sm">
                        <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col" style="width:50%">제목</th>
                                <th scope="col">작성일</th>
                                <th scope="col">조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>${groupNotice.group_notice_seq}</td>
                                <td>[${groupNotice.type}] ${groupNotice.title}</td>
                                <td><fmt:formatDate value="${groupNotice.regDate}" type="date"/></td>
                                <td>${groupNotice.cnt}</td>
                            </tr>
                        </tbody>             
                    </table>

                    <!-- 모임공지 상세 내용-->
					
					
	                    <div class="col-8" style="padding-top: 10px; line-height: 3;">
	                    	<c:if test="${groupNotice.filename != null}">
	                        <div><img src="/images/${groupNotice.filename}" /></div>
	                        </c:if>
	                      	<a >${groupNotice.content}</a>
	                    </div>
	                      <hr>            
	                      <c:if test="${groupNotice.type eq '정모'}">
	                      <div class="jungmo_detail">
	                      <div>                     
	                                 일 시 : ${fn:substring(groupNotice.jungmo_date,0,10)}&nbsp; ${fn:substring(groupNotice.jungmo_date,11,16)}<br>
	                           		 장 소 : <input type="text" name="address" id="address" size="50" style="border:none; background:white;"  value="${groupNotice.jungmo_place}" disabled> <br>
	                      </div>
	                      <div>
	                        <div id="map" style="width:450px;height:350px;"></div>
	                      </div>
	                      </div>
	                       </c:if>
                    <hr>
                    
                <!--  댓글 시작 -->
				
				<table class="table table-sm">			    
                   <tbody>                 
                         <tr>
                            <th>     	
                             	 <form id="commentListForm" name="commentListForm" method="post">
                              	 <div id="commentList">    
								</div>
								</form>
                             </th>
                         </tr>  
         
                                <!--댓글입력 칸-->
                      	<tr>                                   	
                           <td colspan="3">  
                           <form name="commentForm" id="commentForm" method="post">
                               <div class="row my-3 align-items-center justify-content-center">
                                   <div class="col-2" style="text-align:right;">
                                       <label for="comments" class="form-label">댓글작성</label>
                                   </div>   
                                   <div class="col-6">
                                   	<input type="hidden" name="group_notice_seq" value="${groupNotice.group_notice_seq}" />
                                       <textarea class="form-control" id="content" name="content" rows="4" style="resize:none;"></textarea>
                                   </div>
                                   <div class="col-2">         	
                                       <input class="btn btn-primary" onClick="save_comment('${groupNotice.group_notice_seq}')" type="button" value="등록" id="insert">
                                       <input type="hidden" id="group_notice_seq " name="group_notice_seq " value="${groupNotice.group_notice_seq }" />
                                   </div>
                                  </div>
                           </form> 
                           </td>
                       </tr>                  
    
                   </tbody>                                 
                   <tfoot>                             
                       <tr></tr>
                   </tfoot>
           	    </table>

                    <!--글목록 이동-->
                    <div class="row">
                        <div class="col text-center">                  
                            <button class="btn btn-primary" type="button" onclick="location.href='/group/groupNoticeListView?group_seq=${group.group_seq }'">돌아가기</button>
                        </div>
                    </div>
			</div>
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


        $(document).ready(function()  {

        	getCommentList();	//정모일때와 아닐때와 상기 다큐먼트레디 실행여부가 다르기 떄문에 카카오맵과 병합
        	
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

 
    <!-- 우편찾기 함수 -->

        function kakaopost() {
            new daum.Postcode({
                oncomplete: function (data) {
                   
                    document.querySelector("#address").value = data.address
                }
            }).open();
        }

    <!--카카오 지도 구현 스크립트 끝-->

  	<!-- 댓글 시작 -->
		/*
		** 댓글리스트
		*/
function  getCommentList() {
			
			$.ajax({
				type:'GET',
				url:'/group_commnets_list',
				dataType: 'json',
				data:$("#commentForm").serialize(),	//아이디가 #아래인 폼을 읽어서 그안의 파라메타id들을 읽어서 위에 url로 보내겠다.
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				success: function(data) {
					
						var commentList = data.commentList;	
						showHTML(commentList);
				},
						error: function() {
								alert("댓글 목록을 조회하지 못했습니다.")
					}
			});
		}
		
function showHTML(commentList) {
	var html = "";
	var p_html = "";
	
	if (commentList.length > 0) {
		// 댓글의 각 항목별로 HTML 생성
		   $.each(commentList, function(index, item){
		         html += "<div>";
		         html += "<div id=\"comment_item\"> <strong>아이디(<b style='color:red'>" + item.user_id + "</b>) : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>";
		         html += item.content+"</div>";
		         html += "<span id=\"write_date\">" + displayTime(item.regDate) + "</span><br>";
		         html += "</div>";
		      });      		
		
		}else { // 조회된 댓글이 없을 경우
			html += "<div>";
			html += "<h5>등록된 답변이 없습니다.</h5>";
			html += "</div>";
		}
		// 댓글 목록 출력
		$("#commentList").html(html);
		
	}

	
//댓글 등록 시간 설정
function displayTime(timeValue) {
		var today = new Date();
		
		// 현재시간에서 댓글등록시간을 빼줌
		var timeGap = today.getTime() - timeValue;
		
		// timeValue를 Date객체로 변환
		var dateObj = new Date(timeValue);
		
		// timeGap이 24시간 이내인지 판단
		if (timeGap < (1000 * 60 * 60 * 24)) {  // 시, 분, 초를 구함
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			//return hh + ':' + mi + ':' + ss;
			return [(hh>9 ? '':'0')+hh, ':', (mi>9 ? '':'0')+mi, ':', 
				    (ss>9 ? '':'0')+ss].join('');
		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1;
			var dd = dateObj.getDate();
			
			//return yy + "-" + mm + "-" + dd;
			return [yy, '/', (mm>9 ? '':'0')+mm, '/', (dd>9 ? '':'0')+dd].join('');
		}
	}
		


//댓글등록 
function save_comment(group_notice_seq) {
	$.ajax({
		type:'POST',
		url:'/group_comments_insert',
		data:$("#commentForm").serialize(), 	//아이디가 #아래인 폼을 읽어서 그안의 파라메타id들을 읽어서 위에 url로 보내겠다.
		success: function(data) {
			if (data=='success') {	
				getCommentList(); 	
				$("#content").val("");
			} else if (data=='fail') {
				alert("댓글등록이 실패하였습니다. 다시 시도해 주세요.");
			} else if (data=='not_logedin') {
				alert("댓글등록은 로그인이 필요합니다.");
			}
		},
		error: function(request, status, error) {
			alert("error:" + error);
		}
	});
}

	
	</script>

</body>

</html>
