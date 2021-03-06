<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>编辑供应商信息</title>
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
		$("#supplierInforForm").Validform({
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
				window.opener.loadTab('listSupplier.jsp', '9');
			}
		});  
		
		//初始化附件上传
		//initUploadImg("${_PhotoAttachment}","fileQueue1","uploadify1",false,1,"uploadPhotoAttach","fileList1","photoAttachmentDiv");
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
						<strong>编辑供应商信息</strong>
					</div>
					<p>&nbsp;</p>
					<div class="news">
						<form:form commandName="supplierInforVo" id="supplierInforForm" action="/stock/supplierInfor.htm?method=save" method="post">
							<form:hidden path="supplierId"/>
							<table width="800" border="0" cellpadding="0" cellspacing="0"
								class="doc">
								<tr>
									<td width="15%" align="right" nowrap="nowrap"><span class="blues">供应商名称：</span>&nbsp;&nbsp;</td>
									<td width="85%">
										<form:input path="supplierName" size="20" class="textfield" datatype="*" sucmsg="填写正确！" nullmsg="请输入供应商名称！"/> 
										<font color="red">*</font>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right"><span class="blues">供应商编码：</span>&nbsp;&nbsp;</td>
									<td>
										<form:input path="supplierCode" size="20" class="textfield" datatype="*" sucmsg="填写正确！" nullmsg="请输入供应商编码！" />
										<font color="red">*</font> 
									</td>
								</tr>
								
								
								<tr>
									<td nowrap="nowrap" align="right"><span class="blues">地址：</span>&nbsp;&nbsp;</td>
									<td>
										<form:input path="address" size="20" class="textfield" />
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right"><span class="blues">联系人：</span>&nbsp;&nbsp;</td>
									<td>
										<form:input path="contactPerson" size="30" class="textfield" />
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right"><span class="blues">联系电话：</span>&nbsp;&nbsp;</td>
									<td>
										<form:input path="contactPhone" size="20" class="textfield" />
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right"><span class="blues">传真：</span>&nbsp;&nbsp;</td>
									<td>
										<form:input path="fax" size="20" class="textfield" />
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right"><span class="blues">我方联系人：</span>&nbsp;&nbsp;</td>
									<td>
										<form:input path="selfPerson" size="20" class="textfield" />
									</td>
								</tr>
								
								<tr>
									<td nowrap="nowrap" align="right"><span class="blues">采购人：</span>&nbsp;&nbsp;</td>
									<td>
										<form:input path="buyer" size="20" class="textfield"/> 
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
