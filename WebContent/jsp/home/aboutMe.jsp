<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<style>
.profile-box {
	display: flex;
	justify-content:center;
	margin-top:10%;
	margin-left:auto;
	margin-right:auto;
	margin-bottom:100px;
}

.profile-box > .profile-text {
	font-size:2rem;
}

.profile-box > .profile-text > table {
	height: 500px;
}

.profile-box-mobile {
	display: flex;
	justify-content:center;
	margin-top:5%;
	margin-left:auto;
	margin-right:auto;
	margin-bottom:20px;
}

.profile-box-mobile > .profile-text {
	font-size:20px;
}

.profile-box-mobile > .profile-text > table {

}

.profile-box-mobile > img {
	height:100px;
	width:100px;
}

@media ( min-width:800px ) {
    .visible-on-sm-down {
        display: none;
    }
}

@media ( max-width:799px ) {
    .visible-on-md-up {
        display: none;
    }
}


</style>

<div class="profile-box visible-on-md-up">
	<img
		src="https://2.gall-img.com/hygall/files/attach/images/82/794/670/049/07c5aa5f791de60b05d4d12139253475.gif"
		alt="" />
	<div class="profile-text">
		<table>
			<tr>
				<th>NAME</th>
				<td>이상범</td>
				<th>AGE</th>
				<td>28(27)</td>
			</tr>
			<tr>
				<th>E-MAIL </th>
				<td colspan="3">samlee2552@gmail.com</td>
			</tr>
			<tr>
				<th>PHONE</th>
				<td colspan="3">010 9893 9933</td>
			</tr>
		</table>
	</div>
</div>

<div class="profile-box-mobile visible-on-sm-down">
	<img
		src="https://2.gall-img.com/hygall/files/attach/images/82/794/670/049/07c5aa5f791de60b05d4d12139253475.gif"
		alt="" />
	<div class="profile-text">
		<table>
			<tr>
				<th>NAME</th>
				<td>이상범</td>
				<th>AGE</th>
				<td>28(27)</td>
			</tr>
			<tr>
				<th>E-MAIL </th>
				<td colspan="3">samlee2552@gmail.com</td>
			</tr>
			<tr>
				<th>PHONE</th>
				<td colspan="3">010 9893 9933</td>
			</tr>
		</table>
	</div>
</div>



<%@ include file="/jsp/part/foot.jspf"%>