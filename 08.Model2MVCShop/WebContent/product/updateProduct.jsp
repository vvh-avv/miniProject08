<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>상품수정</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript" src="../javascript/calendar.js">
</script>

<script type="text/javascript">
<!--
function fncAddProduct(){
	//Form 유효성 검증
 	var name = document.detailForm.prodName.value;
	var detail = document.detailForm.prodDetail.value;
	var manuDate = document.detailForm.manuDate.value;
	var price = document.detailForm.price.value;

	if(name == null || name.length<1){
		alert("상품명은 반드시 입력하여야 합니다.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("상품상세정보는 반드시 입력하여야 합니다.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("제조일자는 반드시 입력하셔야 합니다.");
		return;
	}
	if(price == null || price.length<1){
		alert("가격은 반드시 입력하셔야 합니다.");
		return;
	}
	
	document.detailForm.action='/product/updateProduct';
	document.detailForm.submit();
}

/*가격에 단위콤마 찍는 스크립트
//출처 : https://kin.naver.com/qna/detail.nhn?d1id=1&dirId=1040205&docId=68405952
function FormatNumber2(num){
	fl=""
	if(isNaN(num)) { alert("문자는 사용할 수 없습니다.");return 0}
	if(num==0) return num

	if(num<0){ 
		num=num*(-1)
		fl="-"
	}else{
		num=num*1 //처음 입력값이 0부터 시작할때 이것을 제거한다.
	}
	num = new String(num)
	temp=""
	co=3
	num_len=num.length
	while (num_len>0){
		num_len=num_len-co
		if(num_len<0){co=num_len+co;num_len=0}
		temp=","+num.substr(num_len,co)+temp
	}
	return fl+temp.substr(1)
}

function FormatNumber3(num){
	num=new String(num)
	num=num.replace(/,/gi,"")
	return FormatNumber2(num)
}
*/
-->
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<form name="detailForm" method="post" enctype="multipart/form-data">

		<input type="hidden" name="prodNo" value="${product.prodNo}" enctype="multipart/form-data"/>

		<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td width="15" height="37"><img src="/images/ct_ttl_img01.gif" width="15" height="37" /></td>
				<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="93%" class="ct_ttl01">상품수정</td>
							<td width="20%" align="right">&nbsp;</td>
						</tr>
					</table>
				</td>
				<td width="12" height="37"><img src="/images/ct_ttl_img03.gif" width="12" height="37" /></td>
			</tr>
		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write"> 상품명 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" /> </td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="105">
								<input type="text" name="prodName" class="ct_input_g" style="width: 100px; height: 19px" maxLength="20" value="${product.prodName}">
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">상품상세정보 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">
					<input type="text" name="prodDetail" value="${product.prodDetail}" class="ct_input_g" style="width: 100px; height: 19px" maxLength="10" minLength="6">
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">제조일자 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" /> </td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">
					<input type="text" readonly="readonly" name="manuDate" value="${product.manuDate}" class="ct_input_g" style="width: 100px; height: 19px" maxLength="10" minLength="6">
					&nbsp;
					<img src="../images/ct_icon_date.gif" width="15" height="15" onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)" />
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">가격 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" /> </td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">													<!--onkeyup="this.value=FormatNumber3(this.value)"-->
					<input type="text" name="price" value="${product.price}" class="ct_input_g" style="width: 100px; height: 19px" maxLength="50" />&nbsp;원
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">상품이미지</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">
					<!-- 파일명 확인 <c:out value="*${product.fileName}*"/> -->
					<c:choose>
								
						<c:when test="${!empty product.fileName && product.fileName!=' '}">
							<!-- 복수파일 처리 -->
							<c:if test="${product.fileName.contains(',')}">
								<img src = "/images/uploadFiles/${product.fileName.split(',')[0]}"><br>
								<img src = "/images/uploadFiles/${product.fileName.split(',')[1]}">
							</c:if>
							<c:if test="${!product.fileName.contains(',')}">
								<img src = "/images/uploadFiles/${product.fileName}">
							</c:if>
						</c:when>
						
						<c:otherwise>
							<img src = "/images/empty.GIF">
						</c:otherwise>
					
					</c:choose><br>
					<input type="hidden" name="fileName" class="ct_input_g" style="width: 200px; height: 19px" maxLength="13" value="${product.fileName}" />
					<input multiple="multiple" type="file" name="file" class="ct_input_g" style="width: 200px; height: 19px" maxLength="13" value="${product.fileName}" />
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
			<tr>
				<td width="53%"></td>
				<td align="right">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>

							<td width="17" height="23"><img src="/images/ct_btnbg01.gif" width="17" height="23" /></td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
								<a href="javascript:fncAddProduct();">수정</a>
							</td>
							<td width="14" height="23"><img src="/images/ct_btnbg03.gif" width="14" height="23" /></td>
							<td width="30"></td>

							<td width="17" height="23"><img src="/images/ct_btnbg01.gif" width="17" height="23" /></td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
								<a href="javascript:history.go(-1)">취소</a>
							</td>
							<td width="14" height="23"><img src="/images/ct_btnbg03.gif" width="14" height="23" /></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>
