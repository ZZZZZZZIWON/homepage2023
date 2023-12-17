<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="ko">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>수업용 게시판</title>
<script src="https://code.jquery.com/jquery-Latest.min.js"></script>
<!-- BBS Style -->
   <link href="/asset/BBSTMP_0000000000001/style.css" rel="stylesheet"/>
<!-- 공통 Style -->
   <link href="/asset/LYTTMP_0000000000000/style.css" rel="stylesheet"/>
</head>
<body>

	<%-- 기본 URL --%>
    <c:url var="_BASE_PARAM" value="">
        <c:param name="searchCondition" value="${searchVO.searchCondition}"/>
        <c:if test="${not empty searchVO.searchKeyword}">
	        <c:param name="searchKeyword" value="${searchVO.searchKeyword}"/>
        </c:if>
    </c:url>

    <div id="content">
		<div class="container">
			<div id="contents">
				<%--목록 영역--%>
				<div id="bbs_wrap">
					<div class="total">
						총 예약수 <strong><c:out value="${fn:length(resultList)}" /></strong>건
					<c:url var="excelUrl" value="/admin/rsv/selectApplyList.do">
						<c:param name="resveId" value="${param.resveId}"/>
						<c:param name="excelAt" value="Y"/>
					</c:url>
						<a href="${excelUrl}" class="btn">엑셀 다운로드</a>

					<c:url var="excelUrl" value="/admin/rsv/excel.do">
						<c:param name="resveId" value="${param.resveId}"/>
					</c:url>
						<a href="${excelUrl}" class="btn">JAVA 엑셀 다운로드</a>
						
						
					</div>
					<div class="bss_list">
						<table class="list_table">
							<thead>
								<tr>
									<th class="num" scope="col">번호</th>
									<th scope="col">신청자명</th>
									<th scope="col">신청일</th>
									<th scope="col">신청상태</th>
									<th scope="col">관리</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="result" items="${resultList}" varStatus="status">
									<tr>
										<td class="num"><c:out value="${fn:length(resultList) - (status.index)}" /></td>
										<td>
											<c:url var="viewUrl" value="/admin/rsv/rsvApplySelect.do${_BASE_PARAM}">
												<c:param name="resveId" value="${result.resveId}" />
												<c:param name="reqstId" value="${result.reqstId}" />
												<c:param name="pageIndex" value="${searchVO.pageIndex}" />
											</c:url> 
											<a href="${viewUrl}"> 
												<c:out value="${result.chargerNm}" />(<c:out value="${result.frstRegisterId}" />)
											</a>
										</td>
										
										<td><fmt:formatDate value="${result.frstRegistPnttm}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td>
											<c:choose>
												<c:when test="${result.confmSeCode eq 'R'}">신청 접수 중</c:when>
												<c:when test="${result.confmSeCode eq 'O'}">신청 승인</c:when>
												<c:when test="${result.confmSeCode eq 'X'}">신청 반려</c:when>
											</c:choose>
										</td>
										<td>
											<c:url var="deleteUrl" value="/admin/rsv/rsvApplyDelete.do${_BASE_PARAM}">
												<c:param name="reqstId" value="${result.reqstId}" />
												<c:param name="resveId" value="${result.resveId}" />
												<c:param name="pageIndex" value="${searchVO.pageIndex}" />
											</c:url> <a href="${deleteUrl}" class="btn spot btn-del" >삭제</a></td>
									</tr>
								</c:forEach>

								<%--글이 없을 경우--%>
								<c:if test="${fn:length(resultList) == 0}">
									<tr class="empty">
										<td colspan="5">신청내역이 없습니다.</td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div>
					<div class="btn-cont ar">
						<c:url var="listUrl" value="/admin/rsv/rsvSelectList.do${_BASE_PARAM}" />
						<a href="${listUrl}" class="btn">목록</a>
					</div>
					
					<div class="excelUploadBox">
						<form id="excelForm" name="excelForm" action="/admin/rsv/excelUpload.json" enctype="multipart/form-data" method="post">
							<input type="hidden" name="resveId" id="resveId" value="${param.resveId}"/>
							<input type="hidden" name="resveDe" value="TYPE01"/>
							
							<a href="/excel/rqtExcel_sample.xls" class="btn" download>엑셀 업로드 샘플 다운로드</a>
							<br/>
							<label for="registerExcelFile">파일첨부</label><input type="file" id="registerExcelFile" name="registerExcelFile" class="upload-hidden">
							<a href="#" id="excelReg" class="btn btn_blue" >등록</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
        <c:if test="${not empty message}">
            alert("${message}");
        </c:if>

        // 예약 글 삭제
        $(".btn-del").click(function() {
            if(!confirm("삭제하시겠습니까?")) {
                return false;
            };
        });

        $(document).on('click', '#excelReg', function(e) {
            if($('#registerExcelFile').val()==''){
                alert('파일을 등록해주세요.');
                return false;
            }

            var form = new FormData($('#excelForm')[0]);
            var url = $('#excelForm').attr('action');

            $.ajax({
                url:url,
                type:'POST',
                data:form,
                async:false,
                cache:false,
                contentType:false,
                processData:false,
                dataType:'json',
                success:function(result){
                    var message = "";

                    if(result.success) {
                        $("#excel").hide();
                        window.location.reload();
                    }
                    else {
                        //alert(result.message);
                        for(i = 0; i < result.data.length; i++) {
                            if(i != 0) {
                                message += "\n";
                            }
                            message += result.data[i].userId + " : " + result.data[i].message;
                        }
                        alert(message);
                        window.locatiom.reload();
                    }
                }
            });

            return false;
        });
    </script>
</html>