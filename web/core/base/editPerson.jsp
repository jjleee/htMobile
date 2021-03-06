<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>编辑人员信息</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/"/>css/edit.css" />
<script src="<c:url value="/"/>js/datePicker/WdatePicker.js" type="text/javascript"></script>
<script src="<c:url value="/"/>js/jquery-1.9.1.js" type="text/javascript"></script><!--jquery包-->
<script src="<c:url value="/"/>js/inc_javascript.js" type="text/javascript"></script>

<!-- 按钮样式 -->
<link rel="stylesheet" type="text/css" href="<c:url value="/"/>css/button.css" />
<!-- 表单验证 -->
<script src="<c:url value='/'/>js/Validform_v5.3.2/Validform_v5.3.2_min.js"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/'/>js/Validform_v5.3.2/css/style.css" />

<!--  Uploadify -->
<link href="<c:url value='/'/>js/uploadify/uploadify.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<c:url value='/'/>js/uploadify/jquery.uploadify.min.js"></script>
<script type="text/javascript" src="<c:url value='/'/>js/uploadify/swfobject.js"></script>
<script type="text/javascript" src="<c:url value='/'/>js/upload.js"></script>
		
<script>
	$(function(){
		$("#personForm").Validform({
			tiptype:3,
			btnSubmit:"#btn_sub",
			showAllError:true,
			beforeSubmit:function(curform){
			},
			callback:function(data){
				alert('信息编辑成功！');
				window.returnValue = "Y";
				window.close();
				//window.opener.location.reload();
				window.opener.loadTab('listPerson.jsp?isvalid=true', '2');
			}
		});  
		
		//初始化附件上传
		initUploadImg("${_PhotoAttachment}","fileQueue1","uploadify1",false,1,"uploadPhotoAttach","fileList1","photoAttachmentDiv");
	});
</script>

</head>
<base target="_self" />
<body>
	<div id="header">
		<div class="logo">
			<img src="<c:url value="/"/>images/zhongtu.png" width="430"
				height="88" />
		</div>
	</div>
	<div id="wrap">

		<!--网站主题部分-->
		<div id="right">
			<div class="emil"></div>
			<div class="module">
				<div class="content">
					<div class="xinxi">
						<strong>编辑人员信息</strong>
					</div>
					<p>&nbsp;</p>
					<div class="news">
						<form:form commandName="personInforVo" id="personForm" action="/core/personInfor.htm?method=save" method="post">
							<form:hidden path="personId"/>
							<form:hidden path="deleted"/>
							<table width="800" border="0" cellpadding="0" cellspacing="0"
								class="doc">
								<tr>
									<td width="15%" align="right" nowrap="nowrap"><span class="blues">姓名：</span>&nbsp;&nbsp;</td>
									<td width="85%">
										<form:input path="personName" size="20" class="textfield" ajaxurl="/core/personInfor.htm?method=valPersonName&personId=${param.personId}" datatype="*" sucmsg="填写正确！" nullmsg="请输入员工姓名！"/> 
										<font color="red">*</font>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right"><span class="blues">工号：</span>&nbsp;&nbsp;</td>
									<td>
										<form:input path="personNo" size="20" class="textfield" /> 
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right"><span class="blues">性别：</span>&nbsp;&nbsp;</td>
									<td>
										<form:select path="gender" class="select">
				                      		<form:option value="0">男</form:option>
				                      		<form:option value="1">女</form:option>
				                      	</form:select> 
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right"><span class="blues">照片：</span>&nbsp;&nbsp;</td>
									<td>
										<div id="photoAttachmentDiv"></div>
										<input type="hidden" name="uploadPhotoAttach" id="uploadPhotoAttach" />
									</td>
								</tr>
								<tr>
									<td align="right"><span class="blues">所属部门：</span>&nbsp;&nbsp;</td>
									<td>
										<form:select path="departmentId" class="select" datatype="*" nullmsg="请选择部门！" sucmsg="选择正确！">
				                      		<form:option value="">--选择部门--</form:option>
				                      		<c:forEach items="${_Departments}" var="department">
												<form:option value="${department.organizeId}">${department.organizeName}</form:option>
											</c:forEach>
				                      	</form:select>
										<font color="red">*</font>
									</td>
								</tr>
								<tr>
									<td align="right"><span class="blues">所属班组：</span>&nbsp;&nbsp;</td>
									<td>
										<form:select path="groupId" class="select">
				                      		<form:option value="0">--选择班组--</form:option>
				                      		<c:forEach items="${_Groups}" var="group">
												<form:option value="${group.organizeId}">${group.organizeName}</form:option>
											</c:forEach>
				                      	</form:select>
									</td>
								</tr>
								<tr>
									<td align="right"><span class="blues">岗位：</span>&nbsp;&nbsp;</td>
									<td>
										<form:select path="structureId" class="select">
				                      		<c:forEach items="${_Structures}" var="structure">
												<form:option value="${structure.structureId}">
													<c:forEach begin="0" end="${structure.layer}">&nbsp;&nbsp;&nbsp;</c:forEach>
													<c:if test="${structure.layer==1}"><b>+</b></c:if><c:if test="${structure.layer==2}"><b>-</b></c:if>${structure.structureName}				
												</form:option>
											</c:forEach>
				                      	</form:select>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right"><span class="blues">职级：</span>&nbsp;&nbsp;</td>
									<td>
										<form:input path="positionLayer" size="20" class="textfield" datatype="n" sucmsg="填写正确！" errormsg="请输入数字格式,数值越小职级越高！" nullmsg="请输入职级,数值越小职级越高！"/> 
										<font color="red">*</font>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right"><span class="blues">手机：</span>&nbsp;&nbsp;</td>
									<td>
										<form:input path="mobile" size="20" class="textfield" datatype="m" ignore="ignore" sucmsg="填写正确！" errormsg="请输入正确格式的手机号码，可以为空！" /> 
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right"><span class="blues">邮箱：</span>&nbsp;&nbsp;</td>
									<td>
										<form:input path="email" size="20" class="textfield" ajaxurl="/core/personInfor.htm?method=valPersonEmail&personId=${param.personId}" datatype="e" ignore="ignore" sucmsg="填写正确！" errormsg="请输入正确格式的邮箱，可以为空！" /> 
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right"><span class="blues">邮箱密码：</span>&nbsp;&nbsp;</td>
									<td>
										<input type="password" name="emailPassword" id="emailPassword" value="${_EmailPassword}" class="textfield" datatype="*6-100" ignore="ignore" sucmsg="填写正确！" errormsg="邮箱密码至少为6位，可以为空！" /> 
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right"><span class="blues">出生日期：</span>&nbsp;&nbsp;</td>
									<td>
										<input name="birthday" id="birthday" size="20" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="${_Birthday}" readonly="readonly" class="textfield" /> 
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right"><span class="blues">办公室地址：</span>&nbsp;&nbsp;</td>
									<td>
										<form:input path="officeAddress" size="60" class="textfield" />  
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right"><span class="blues">办公室电话：</span>&nbsp;&nbsp;</td>
									<td>
										<form:input path="officePhone" size="60" class="textfield"/>  <!--  ignore="ignore" datatype="(1(3|5|8)\d{9})|((0(\d{3}|\d{2})-)?(\d{8}|\d{7}))\s" sucmsg="填写正确！" errormsg="请输入正确的格式，如：021-888888，可以为空！"  -->
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right"><span class="blues">办公室邮编：</span>&nbsp;&nbsp;</td>
									<td>
										<form:input path="officeCode" size="60" class="textfield" />  
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right"><span class="blues">家庭地址：</span>&nbsp;&nbsp;</td>
									<td>
										<form:input path="homeAddress" size="60" class="textfield" />  
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right"><span class="blues">家庭电话：</span>&nbsp;&nbsp;</td>
									<td>
										<form:input path="homePhone" size="60" class="textfield" />  
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right"><span class="blues">家庭邮编：</span>&nbsp;&nbsp;</td>
									<td>
										<form:input path="postCode" size="60" class="textfield" />  
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right"><span class="blues">备注：</span>&nbsp;&nbsp;</td>
									<td>
										<form:textarea path="memo" cols="50" rows="5" class="textarea"/>
									</td>
								</tr>

							</table>
							<div id="buttons">
								<table width="300" border="0" align="center" cellpadding="0"
									cellspacing="0">
									<tr>
										<td height="12"></td>
										<td height="12"></td>
									</tr>
									<tr>
										<td>
											<a href="javascript:void(0);" class="btn_blue" id="btn_sub"><span>提  交</span></a>
										</td>
										<td>
											<a href="javascript:void(0);" class="btn_red" onclick="window.close();"><span>关 闭</span></a>
										</td>
									</tr>
									<tr>
										<td height="20"></td>
										<td height="20"></td>
									</tr>
								</table>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="clearit"></div>

	<!--网站底部部分-->
	<div id="footer">上海慧智计算机技术有限公司 技术支持</div>

</body>
</html>
