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
            <label>组卷名称:</label><input id="search-name" class="wu-text" style="width:100px">
            <label>所属课程:</label>
            <select id="search-subject" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="-1">全部</option>
            	<c:forEach items="${subjectList}" var="subject">
	            	<option value="${subject.id}">${subject.name}</option>
            	</c:forEach>
            </select>
            <label>考试开始时间:</label><input id="search-startTime" class="wu-text easyui-datetimebox" style="width:150px">
            <label>考试结束时间:</label><input id="search-endTime" class="wu-text easyui-datetimebox" style="width:150px">
            <a href="#" id="search-btn" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="data-datagrid" class="easyui-datagrid" toolbar="#wu-toolbar"></table>
</div>
<!-- Begin of easyui-dialog -->
<div id="add-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:810px; padding:10px;">
	<form id="add-form" method="post">
        <table>
            <tr>
                <td align="right">组卷名称:</td>
                <td><input type="text" id="add-name" name="name" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写组卷名称'" ></td>
                <td align="right">所属课程:</td>
                <td>
                	<select name="subjectId" class="easyui-combobox easyui-validatebox" panelHeight="auto" style="width:268px" data-options="required:true, missingMessage:'请选择组卷课程'">
		                <c:forEach items="${subjectList}" var="subject">
			            	<option value="${subject.id}">${subject.name}</option>
		            	</c:forEach>
		            </select>
                </td>
            </tr>
            <tr>
                <td align="right">开始时间:</td>
                <td><input type="text" id="add-startTime" name="startTime" class="wu-text easyui-datetimebox easyui-validatebox"  editable="false"></td>
                <td align="right">结束时间:</td>
                <td><input type="text" id="add-endTime" name="endTime" class="wu-text easyui-datetimebox easyui-validatebox" editable="false"></td>
            </tr>
            <tr>
                <td align="right">限制时间:</td>
                <td><input type="text" id="add-avaliableTime" name="avaliableTime" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写考试限制时间'" ></td>
                <td align="right">及格分数线:</td>
                <td><input type="text" id="add-passScore" name="passScore" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写考试及格分数线'" ></td>
            </tr>
            <tr>
             <td align="right">组卷难度:</td>
                <td>
		            <select name="examDiffcult" class="easyui-combobox easyui-validatebox" panelHeight="auto" style="width:268px" >
		                <option value="-1">不限</option>
		                <option value="0">简单</option>
		            	<option value="1">中等</option>
		            	<option value="2">困难</option>
		            </select>

                </td>
             <td align="right">包含知识点:</td>
                <td>
		            <select name="examDistribute" class="easyui-combobox easyui-validatebox" panelHeight="auto" style="width:268px" >
		                <option value="0">综合</option>
		            	<option value="1">第一章</option>
		            	<option value="2">第二章</option>
		            	<option value="3">第三章</option>
		            	<option value="4">第四章</option>
		            	<option value="5">第五章</option>
		            </select>

                </td>
            </tr>
            <tr>
                <td align="right">单选题数量:</td>
                <td><input type="text" placeholder="每个单选题${singleScore}分" id="add-singleQuestionNum" name="singleQuestionNum" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写组卷单选题数量'" ></td>
                <td align="right">多选题数量:</td>
                <td><input type="text" placeholder="每个多选题${muiltScore}分" id="add-muiltQuestionNum" name="muiltQuestionNum" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写组卷多选题数量'" ></td>
            </tr>
            <tr>
                <td align="right">判断题数量:</td>
                <td><input type="text" placeholder="每个判断题${chargeScore}分" id="add-chargeQuestionNum" name="chargeQuestionNum" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写组卷判断题数量'" ></td>
            
                <td align="right">填空题数量:</td>
                <td><input type="text" placeholder="每个填空题${fillsScore}分" id="add-fillsQuestionNum" name="fillsQuestionNum" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写组卷填空题数量'" ></td>
            </tr>
       
        </table>
    </form>
</div>
<!-- 修改窗口 -->
<div id="edit-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:810px; padding:10px;">
	<form id="edit-form" method="post">
        <input type="hidden" name="id" id="edit-id">
        <table>
           <tr>
                <td align="right">组卷名称:</td>
                <td><input type="text" id="edit-name" name="name" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写组卷名称'" ></td>
            
                <td align="right">所属课程:</td>
                <td>
                	<select id="edit-subjectId" name="subjectId" class="easyui-combobox easyui-validatebox" panelHeight="auto" style="width:268px" data-options="required:true, missingMessage:'请选择组卷课程'">
		                <c:forEach items="${subjectList}" var="subject">
			            	<option value="${subject.id}">${subject.name}</option>
		            	</c:forEach>
		            </select>
                </td>
            </tr>
            <tr>
                <td align="right">开始时间:</td>
                <td><input type="text" id="edit-startTime" name="startTime" class="wu-text easyui-datetimebox easyui-validatebox" editable="false"></td>
            
                <td align="right">结束时间:</td>
                <td><input type="text" id="edit-endTime" name="endTime" class="wu-text easyui-datetimebox easyui-validatebox" editable="false"></td>
            </tr>
            <tr>
                <td align="right">限制时间:</td>
                <td><input type="text" id="edit-avaliableTime" name="avaliableTime" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写考试限制时间'" ></td>

                <td align="right">及格分数线:</td>
                <td><input type="text" id="edit-passScore" name="passScore" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写考试及格分数线'" ></td>
            </tr>
             <tr>
             <td align="right">组卷难度:</td>
                <td>
		            <select name="examDiffcult" class="easyui-combobox easyui-validatebox" panelHeight="auto" style="width:268px" >
		                <option value="-1">不限</option>
		                <option value="0">简单</option>
		            	<option value="1">中等</option>
		            	<option value="2">困难</option>
		            </select>

                </td>
             <td align="right">包含知识点:</td>
                <td>
		            <select name="examDistribute" class="easyui-combobox easyui-validatebox" panelHeight="auto" style="width:268px" >
		                <option value="0">综合</option>
		            	<option value="1">第一章</option>
		            	<option value="2">第二章</option>
		            	<option value="3">第三章</option>
		            	<option value="4">第四章</option>
		            	<option value="5">第五章</option>
		            </select>

                </td>
            </tr>
            <tr>
                <td align="right">单选题数量:</td>
                <td><input type="text" placeholder="每个单选题${singleScore}分" id="edit-singleQuestionNum" name="singleQuestionNum" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写组卷单选题数量'" ></td>
            
                <td align="right">多选题数量:</td>
                <td><input type="text" placeholder="每个多选题${muiltScore}分" id="edit-muiltQuestionNum" name="muiltQuestionNum" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写组卷多选题数量'" ></td>
            </tr>
            <tr>
                <td align="right">判断题数量:</td>
                <td><input type="text" placeholder="每个判断题${chargeScore}分" id="edit-chargeQuestionNum" name="chargeQuestionNum" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写组卷判断题数量'" ></td>
           
                <td align="right">填空题数量:</td>
                <td><input type="text" placeholder="每个填空题${fillsScore}分" id="edit-fillsQuestionNum" name="fillsQuestionNum" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写组卷填空题数量'" ></td>
            </tr>
      <!--      <tr>
                <td align="right">简单题:</td>
                <td><input type="text" placeholder="每个简单题${simpleScore}分" id="edit-simpleNum" name="simpleNum" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写组卷简单题数量'" ></td>
            
                <td align="right">中等题:</td>
                <td><input type="text" placeholder="每个中等题${middleScore}分" id="edit-middleNum" name="middleNum" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写组卷中等题数量'" ></td>
            </tr>
            <tr>
                <td align="right">困难题:</td>
                <td><input type="text" placeholder="每个困难题${hardScore}分" id="edit-hardNum" name="hardNum" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写组卷困难题数量'" ></td>
            </tr>-->  
        </table>
    </form>
</div>

<!-- End of easyui-dialog -->
<script type="text/javascript">

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
            title: "编辑组卷信息",
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
            	$("#edit-startTime").datetimebox('setValue',format(item.startTime));
            	$("#edit-endTime").datetimebox('setValue',format(item.endTime));
            	$("#edit-passScore").val(item.passScore);
            	$("#edit-singleQuestionNum").val(item.singleQuestionNum);
            	$("#edit-muiltQuestionNum").val(item.muiltQuestionNum);
            	$("#edit-chargeQuestionNum").val(item.chargeQuestionNum);
            	$("#edit-fillsQuestionNum").val(item.fillsQuestionNum);
            	$("#edit-singleQuestionNum").val(item.singleQuestionNum);
           
            	$("#edit-avaliableTime").val(item.avaliableTime);
            	$("#edit-subjectId").combobox('setValue',item.subjectId);
            }
        });
	}
	
	/**
	*打开添加题型窗口
	*/
	function openAdd(){
		//$('#add-form').form('clear');
		$('#add-dialog').dialog({
			closed: false,
			modal:true,
            title: "添加组卷信息",
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
	
	
	//搜索按钮监听
	$("#search-btn").click(function(){
		var option = {name:$("#search-name").val()};
		var subjectId = $("#search-subject").combobox('getValue');
		if(subjectId != -1){
			option.subjectId = subjectId;
		}
		var startTime = $("#search-startTime").datetimebox('getValue');
		var endTime = $("#search-endTime").datetimebox('getValue');
		if(startTime != null && startTime != ''){
			option.startTime = startTime;
		}
		if(endTime != null && startTime != ''){
			option.endTime = endTime;
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
	    nowrap:false,
		fit:true,
		columns:[[
			{ field:'chk',checkbox:true},
			{ field:'name',title:'组卷名称',width:120,sortable:true},
			{ field:'subjectId',title:'所属课程',width:100,formatter:function(value,index,row){
				var subjectList = $("#search-subject").combobox("getData");
				for(var i=0;i<subjectList.length;i++){
					if(subjectList[i].value == value)return subjectList[i].text;
				}
				return value;
			}},
			{ field:'startTime',title:'开始日期',width:120,formatter:function(value,index,row){
				return format(value);
			}},
			{ field:'endTime',title:'结束日期',width:120,formatter:function(value,index,row){
				return format(value);
			}},
			{ field:'avaliableTime',title:'限制时间',width:90,formatter:function(value,index,row){
				return value + '分钟';
			}},
			{ field:'questionNum',title:'试题总数',width:80},
			{ field:'totalScore',title:'总分',width:60},
			{ field:'passScore',title:'及格线',width:85},
			{ field:'singleQuestionNum',title:'单选题',width:90},
			{ field:'muiltQuestionNum',title:'多选题',width:90},
			{ field:'chargeQuestionNum',title:'判断题',width:90},
			{ field:'fillsQuestionNum',title:'填空题',width:90},
			{ field:'paperNum',title:'生成试卷',width:80},
			{ field:'examedNum',title:'已考人数',width:80},
			{ field:'passNum',title:'及格人数',width:80},
			{ field:'createTime',title:'添加时间',width:170,formatter:function(value,index,row){
				return format(value);
			}},
		]]
	});
</script>