<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재료추가</title>
<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin/insertFoForm/insertFoForm.css" rel="stylesheet" type="text/css">

</head>
<body>

    <div class="page">
    <form>
    <div class="food_main">
        <div class="food_title">재료추가</div>

        <br>
        <div class="input_foodName">
            <div class="food_label">재료명 :</div>
            <div class="input_blank">
            <input type="text">
            </div>
        </div>
        <div class="input_foodName">
            <div class="food_label">기준</div>
            <div class="input_blank">
            <input type="text">
            </div>
        </div>
        <br>
        <div class="food_ingre">
            <div class="labels">영양성분</div>
            <br>
            <textarea rows="10" cols="35" name="Ing" id="Ingarea"readonly="readonly" style="resize: none;"></textarea><br>
            <input type="text" size = "15" id="Ingtext">
            <button type="button"onclick="addIng();" class="add">추가</button>
            <button type="button"onclick="resetIng();" class="reset">초기화</button>
        </div>

        <div class="btn_area">

            <button class="cnbtn">취소</button>
            <input type="submit" class="subtn" value="저장">
        </div>
    </div>
    </form>
    </div>
</body>

<script>
    function addIng(){

        var text = document.getElementById('Ingtext');
        var textArea = document.getElementById('Ingarea');

        textArea.innerHTML += text.value  +">"+ "\n";
        text.value ="";
    };

    function resetIng(){
        var textArea = document.getElementById('Ingarea');
        textArea.innerHTML = "";

    };
</script>
</html>