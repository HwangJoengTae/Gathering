<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
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
    <script type="text/javascript" src="../js/qna.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
                            <a class="nav-link"  href="/qna/frequentlyQna">
                                <span data-feather="file"></span>
                                자주 묻는 질문
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link"  href="/qna/myQnaList">
                                <span data-feather="shopping-cart"></span>
                                나의 질문
                            </a>
                        </li>     
                    </ul>
                </div>
            </nav>
    
             <!--메인구간 -->      
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">			
       			<form id="moveForm" method="get">
					<!-- 정보 저장용 히든 -->
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
				</form>
       				
                <h2 style="padding-top:5%">Q&A게시판</h2>
                    <div class="row mb-2">
                        <div class="col">       
                        	<!--  로그인가정, 세션값 id와 모델에 담은 id값 비교, 동일하면 버튼노출( 본인작성한것)  -->
                        	<c:if test="${sessionScope.user.user_id eq qnaVO.user_id}"  >        
                            <button type="button" class="btn btn-outline-primary" style="float:right" onclick="location.href='/qnaDeleteForm?qna_seq=${qnaVO.qna_seq}'">삭제</button>
                            <button type="button" class="btn btn-outline-primary" style="float:right; margin-right:10px" onclick="location.href='/qnaUpdateForm?qna_seq=${qnaVO.qna_seq}'">수정</button>  
                        	</c:if>   
                        </div>                      
                    </div>

                <div class="table-responsive">
                    <table class="table table-sm">
                        <thead>
                            <tr>
                                <th scope="col">${qnaVO.qna_seq}</th>
                                <th scope="col" style="width:50%;">${qnaVO.title}</th>
                                <th scope="col" style="text-align:center">${qnaVO.cnt}</th>
                                <th scope="col" style="text-align:center"><fmt:formatDate value="${qnaVO.regDate}" type="date"/></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr style="height: auto;">
                                <td colspan="4">
                                    <div class="container my-5 mx-2">
                                        <p>${qnaVO.content}</p>
                                    </div>
                                </td>                              
                            </tr>
                        </tbody>
        			 
                   <table class="table table-sm">
                       <tbody>           	
                       	<!--사용자용 댓글리스트 출력-->
                       	<c:if test="${sessionScope.user.user_type == 1 }">
                           <tr>
                               <th>     	
                               	 <form id="commentForm" name="commentListForm" method="post">
                                	<div id="commentList">
                                 	 <input type="hidden" name="qna_seq" value="${qnaVO.qna_seq}" />
                                 	 <input type="hidden" id="qna_seq" name="qna_seq" value="${qnaVO.qna_seq }" />
									 </div>
								</form>
                               </th>
                           </tr> 
                        </c:if>     
                        <!--관리자용 댓글리스트 출력-->
                        <c:if test="${sessionScope.user.user_type == 0 }">  
                           <tr>
                               <th>     	
                               	 <form id="commentListForm" name="commentListForm" method="post">
                                	<div id="commentList">
									</div>
								 </form>
                               </th>
                           </tr>  
                           
                           <!--관리자한테만 보이는 답변입력 칸-->
                           <tr>                                    	
                               <td colspan="3">
                               <form name="commentForm" id="commentForm" method="post">
                                   <div class="row my-3 align-items-center justify-content-center">
                                       <div class="col-2" style="text-align:right;">
                                           <label for="comments" class="form-label">답변작성</label>
                                       </div>   
                                       <div class="col-6">
                                       	<input type="hidden" name="qna_seq" value="${qnaVO.qna_seq}" />
                                           <textarea class="form-control" id="content" name="content" rows="4" style="resize:none;"></textarea>
                                       </div>
                                       <div class="col-2">         	
                                           <input class="btn btn-primary" onClick="save_comment('${qnaVO.qna_seq}')" type="button" value="등록" id="insert">
                                           <input type="hidden" id="qna_seq " name="qna_seq " value="${qnaVO.qna_seq }" />
                                       </div>
                                      </div>
                               </form>  
                               </td>
                           </tr>                  
                          </c:if>    
                           
                       </tbody>                                 
                       <tfoot>                             
                           <tr></tr>
                       </tfoot>
               	    </table>    
				 </table>
			</div>

                <div class="row my-3">
                    <div class="col text-center">
                        <button class="btn btn-primary" type="button" onclick="location.href='/qna/qnaList'">문의목록</button>
                    </div>
                </div>
            </main>
        </div>
    </div>


    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
</body>

<%@ include file="/WEB-INF/views/footer.jsp" %>
   
   
   <script type="text/javascript">
		
   		//문의사항상세 로딩시에 해당 댓글목록 조회하여 출력
		$(document).ready(function() {

				getCommentList();
	
		});
		
		/*
		** 댓글리스트
		*/
function  getCommentList() {
			
			$.ajax({
				type:'GET',
				url:'/commnets_list',
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
		         html += "<div id=\"comment_item\"> <strong>운영자(<b style='color:red'>" + item.user_id + "</b>)답변 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>";
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
		


//댓글등록 (운영자용)
function save_comment(qna_seq) {
	$.ajax({
		type:'POST',
		url:'/comments_insert',
		data:$("#commentForm").serialize(), 	//아이디가 #아래인 폼을 읽어서 그안의 파라메타id들을 읽어서 위에 url로 보내겠다.
		success: function(data) {
			if (data=='success') {	// 상품평 등록 성공
				getCommentList(); 	// 상품평 목록 요청함수 호출
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

</html>
