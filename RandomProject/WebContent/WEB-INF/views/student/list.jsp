<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/header.jsp"%>
<div class="easyui-layout" data-options="fit:true">
    <!-- Begin of toolbar -->
    <div id="wu-toolbar">
        <div class="wu-toolbar-button">
            <%@include file="../common/menus.jsp"%>
        </div>
        <div class="wu-toolbar-search">
            <label>学生名称:</label><input id="search-name" class="wu-text" style="width:100px">
            <label>所属课程:</label>
            <select id="search-subject" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="-1">全部</option>
            	<c:forEach items="${subjectList }" var="subject">
            		<option value="${subject.id }">${subject.name }</option>
            	</c:forEach>
            </select>
            <a href="#" id="search-btn" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="data-datagrid" class="easyui-datagrid" toolbar="#wu-toolbar"></table>
</div>
<!-- Begin of easyui-dialog -->
<div id="add-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:420px; padding:10px;">
	<form id="add-form" method="post">
        <table>
            <tr>
                <td align="right">学生学号:</td>
                <td><input type="text" id="add-name" name="name" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写学生账号'" ></td>
            </tr>
            <tr>
                <td align="right">学生密码:</td>
                <td><input type="password" id="add-password" name="password" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写学生密码'" ></td>
            </tr>
            <tr>
                <td align="right">学生姓名:</td>
                <td><input type="text" id="add-truename" name="trueName" class="wu-text" ></td>
            </tr>
            <tr>
                <td align="right">性别:</td>
                <td>
                	<select name="ssex" class="easyui-combobox" panelHeight="auto" style="width:268px" data-options="required:true, missingMessage:'请选择性别'">
		                <option value="0">男</option>
            			<option value="1">女</option>
		            </select>
                </td>
            </tr>
             <tr>
                <td align="right">所属专业:</td>
                <td>
                	<select name="subjectId" class="easyui-combobox" panelHeight="auto" style="width:268px" data-options="required:true, missingMessage:'请选择课程'">
		                <c:forEach items="${subjectList }" var="subject">
		                <option value="${subject.id }">${subject.name }</option>
		                </c:forEach>
		            </select>
                </td>
            </tr>
            <tr>
                <td align="right">学生班级:</td>
                <td><input type="text" id="add-classinfo" name="classinfo" class="wu-text" ></td>
            </tr>
        </table>
    </form>
</div>
<!-- 修改窗口 -->
<div id="edit-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:450px; padding:10px;">
	<form id="edit-form" method="post">
        <input type="hidden" name="id" id="edit-id">
        <table>
           <tr>
                <td align="right">学生账号:</td>
                <td><input type="text" id="edit-name" name="name" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写学生账号'" ></td>
            </tr>
           
            <tr>
                <td align="right">学生密码:</td>
                <td><input type="password" id="edit-password" name="password" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写学生密码'" ></td>
            </tr>
            <tr>
                <td align="right">学生姓名:</td>
                <td><input type="text" id="edit-truename" name="trueName" class="wu-text" data-options="required:true, missingMessage:'请填写学生姓名'"></td>
            </tr>
            <tr>
                <td align="right">性别:</td>
                <td>
                	<select id="edit-ssex" name="ssex" class="easyui-combobox" panelHeight="auto" style="width:268px">
		                <option value="0">男</option>
            			<option value="1">女</option>
		            </select>
                </td>
            </tr>
            <tr>
                  <td align="right">所属课程:</td>
                <td>
                <select id="edit-subjectId" name="subjectId" class="easyui-combobox" panelHeight="auto" style="width:268px" data-options="required:true, missingMessage:'请选择学院'">
		                <c:forEach items="${subjectList }" var="subject">
		                <option value="${subject.id }">${subject.name }</option>
		                </c:forEach>
		            </select>
		            </tr>
                <tr>
                <td align="right">所属班级:</td>
                <td><input type="text" id="edit-classinfo" name="classinfo" class="wu-text" ></td>
            </tr>
        </table>
    </form>
</div>

<!-- 导入学生 -->
<div id="import-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:500px; padding:10px;">
        <table>
           <tr>
                <td align="right">选择文件:</td>
                <td><input type="text" id="import-filename" name="filename" class="wu-text easyui-validatebox" readonly="readonly" data-options="required:true, missingMessage:'请选择文件'" ></td>
            	<td><a onclick="uploadFile()" href="javascript:void(0)" id="select-file-btn" class="easyui-linkbutton" iconCls="icon-upload">选择文件</a></td>
            </tr>
            <tr>
                <td align="right">所属课程:</td>
                <td>
                	<select id="import-subjectId" name="subjectId" class="easyui-combobox easyui-validatebox" panelHeight="auto" style="width:268px" data-options="required:true, missingMessage:'请选择考试课程'">
		                <c:forEach items="${subjectList}" var="subject">
			            	<option value="${subject.id}">${subject.name}</option>
		            	</c:forEach>
		            </select>
                </td>
                <td></td>
            </tr>
        </table>
</div>
<div id="process-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-upload',title:'正在上传文件'" style="width:450px; padding:10px;">
<div id="p" class="easyui-progressbar" style="width:400px;" data-options="text:'正在上传中...'"></div>
</div>
<input type="file" id="excel-file" style="display:none;" onchange="selected()">



<!-- End of easyui-dialog -->
<script type="text/javascript">
//上传文件	
function start(){
	var value = $('#p').progressbar('getValue');
	if (value < 100){
		value += Math.floor(Math.random() * 10);
		$('#p').progressbar('setValue', value);
	}else{
		$('#p').progressbar('setValue',0)
	}
};
function selected(){
$("#import-filename").val($("#excel-file").val());
}
function upload(){
if($("#excel-file").val() == '')return;
var formData = new FormData();
formData.append('excelFile',document.getElementById('excel-file').files[0]);
formData.append('subjectId',$("#import-subjectId").combobox('getValue'));
$("#process-dialog").dialog('open');
var interval = setInterval(start,200);
$.ajax({
	url:'upload_stufile',
	type:'post',
	data:formData,
	contentType:false,
	processData:false,
	success:function(data){
		clearInterval(interval);
		$("#process-dialog").dialog('close');
		if(data.type == 'success'){
			 $('#import-dialog').dialog('close');
			 $('#data-datagrid').datagrid('reload');
			 $.messager.alert("消息提醒",data.msg,"info");
		}else{
			$.messager.alert("消息提醒",data.msg,"warning");
		}
	},
	error:function(data){
		clearInterval(interval);
		$("#process-dialog").dialog('close');
		$.messager.alert("消息提醒","上传失败!","warning");
	}
});
}

function uploadFile(){
$("#excel-file").click();

}


	
	/**
	*  添加记录
	*/
	function add(){
		var validate = $("#add-form").form("validate");
		if(!validate){
			$.messager.alert("消息提醒","请检查你输入的数据!","warning");
			return;
		}
		var data = $("#add-form").serialize();
		$.ajax({
			url:'add',
			dataType:'json',
			type:'post',
			data:data,
			success:function(data){
				if(data.type == 'success'){
					$.messager.alert('信息提示','添加成功！','info');
					$("#add-name").val('');
					$("#add-password").val('');
					$("#add-truename").val('');
				
					$("#add-classinfo").val('');
					$('#add-dialog').dialog('close');
					$('#data-datagrid').datagrid('reload');
				}else{
					$.messager.alert('信息提示',data.msg,'warning');
				}
			}
		});
	}
	
	function edit(){
		var validate = $("#edit-form").form("validate");
		if(!validate){
			$.messager.alert("消息提醒","请检查你输入的数据!","warning");
			return;
		}
		var data = $("#edit-form").serialize();
		$.ajax({
			url:'edit',
			dataType:'json',
			type:'post',
			data:data,
			success:function(data){
				if(data.type == 'success'){
					$.messager.alert('信息提示','修改成功！','info');
					$("#edit-name").val('');
					$("#edit-remark").val('');
					$('#edit-dialog').dialog('close');
					$('#data-datagrid').datagrid('reload');
				}else{
					$.messager.alert('信息提示',data.msg,'warning');
				}
			}
		});
	}
	
	/**
	* 删除记录
	*/
	function remove(){
		$.messager.confirm('信息提示','确定要删除该记录？', function(result){
			if(result){
				var item = $('#data-datagrid').datagrid('getSelected');
				if(item == null || item.length == 0){
					$.messager.alert('信息提示','请选择要删除的数据！','info');
					return;
				}
				$.ajax({
					url:'delete',
					dataType:'json',
					type:'post',
					data:{id:item.id},
					success:function(data){
						if(data.type == 'success'){
							$.messager.alert('信息提示','删除成功！','info');
							$('#data-datagrid').datagrid('reload');
						}else{
							$.messager.alert('信息提示',data.msg,'warning');
						}
					}
				});
			}	
		});
	}
	
	/*
	编辑
	*/
	function openEdit(){
		//$('#add-form').form('clear');
		var item = $('#data-datagrid').datagrid('getSelected');
		if(item == null || item.length == 0){
			$.messager.alert('信息提示','请选择要编辑的数据！','info');
			return;
		}
		$('#edit-dialog').dialog({
			closed: false,
			modal:true,
            title: "编辑学生信息",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler:edit
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#edit-dialog').dialog('close');                    
                }
            }],
            onBeforeOpen:function(){
            	//$("#add-form input").val('');
            	$("#edit-id").val(item.id);
            	$("#edit-name").val(item.name);
            	$("#edit-password").val(item.password);
            	$("#edit-truename").val(item.trueName);
            	$("#edit-ssex").val(item.ssex);
            	$("#edit-classinfo").val(item.classinfo);
            	$("#edit-subjectId").combobox('setValue',item.subjectId);
            }
        });
	}
	
	/**
	* Name 打开添加窗口
	*/
	function openAdd(){
		//$('#add-form').form('clear');
		$('#add-dialog').dialog({
			closed: false,
			modal:true,
            title: "添加学生信息",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: add
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#add-dialog').dialog('close');                    
                }
            }],
            onBeforeOpen:function(){
            	//$("#add-form input").val('');
            }
        });
	}
	
	
	//导入学生
	function openImport(){
		$('#import-dialog').dialog({
			closed: false,
			modal:true,
            title: "导入学生信息",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: upload
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#import-dialog').dialog('close');                    
                }
            }],
            onBeforeOpen:function(){
            	//$("#add-form input").val('');
            }
        });
	}
	
	
	
	
	
	
	
	//搜索按钮监听
	$("#search-btn").click(function(){
		var option = {name:$("#search-name").val()};
		var subjectId = $("#search-subject").combobox('getValue');
		if(subjectId != -1){
			option.subjectId = subjectId;
		}
		$('#data-datagrid').datagrid('reload',option);
	});
	
	function add0(m){return m<10?'0'+m:m }
	function format(shijianchuo){
	//shijianchuo是整数，否则要parseInt转换
		var time = new Date(shijianchuo);
		var y = time.getFullYear();
		var m = time.getMonth()+1;
		var d = time.getDate();
		var h = time.getHours();
		var mm = time.getMinutes();
		var s = time.getSeconds();
		return y+'-'+add0(m)+'-'+add0(d)+' '+add0(h)+':'+add0(mm)+':'+add0(s);
	}
	
	/** 
	* 载入数据
	*/
	$('#data-datagrid').datagrid({
		url:'list',
		rownumbers:true,
		singleSelect:true,
		pageSize:10,           
		pagination:true,
		multiSort:true,
		fitColumns:true,
		idField:'id',
	    treeField:'name',
		fit:true,
		columns:[[
			{ field:'chk',checkbox:true},
			{ field:'name',title:'登录学号',width:100,sortable:true},
			{ field:'password',title:'登录密码',width:200},
			{ field:'trueName',title:'姓名',width:200},
			{ field:'ssex',title:'性别',width:100,formatter:function(value,row,index){
				switch(value){
					case 0:{
						return '男';
					}
					case 1:{
						return '女';
					}
				}
				return value;
			}},
			{ field:'classinfo',title:'班级',width:200},
			{ field:'subjectId',title:'所属课程',width:100,formatter:function(value,index,row){
				var subjectList = $("#search-subject").combobox('getData');
				console.log(subjectList);
				for(var i=0;i<subjectList.length;i++){
					if(subjectList[i].value == value)return subjectList[i].text;
				}
				return (value);
			}},
		
		]]
	});
</script>