<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Welcome</title>
</head>
<body>
	
	<form action="search" method="get">
		<input type="text" name="searchValue"/>
		<input type="submit" />
	</form>
	<h1>Lọc theo khoảng giá</h1>
	<form action="searchDouble" method="get">
		<select name="priceRange">
			<option selected="selected">- Chọn -</option>
			<option value="10000000-20000000">10t - 20t</option>
			<option value="20000000-30000000">20t - 30t</option>
			<option value="30000000-40000000">30t - 40t</option>
		</select><br>
		<c:forEach var="category" items="${categories}">
			<input type="radio" value="${category.id}" name="cateID" /> ${category.name} <br>
		</c:forEach>
		<input type="submit" value="Lọc" />
	</form>
	
	<h1>ĐƠN HÀNG</h1>
	<span id="cartTotal"> Trống (0)</span>
	<table id="table-1">
		<thead>
			<tr>
				<th>STT</th>
				<th>Tên SP</th>
				<th>Số lượng</th>
				<th>Thành Tiền</th>
			</tr>
		</thead>
		<tbody>
			<tr id="cartData">
				<td>Rỗng</td>
				<td id="productName">Rỗng</td>
				<td>Rỗng</td>
				<td>Rỗng</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<th>STT</th>
				<th>Tên SP</th>
				<th>Số lượng</th>
				<th>Thành Tiền</th>
			</tr>
		</tfoot>
	</table>
	
	<h1>DANH MỤC</h1>
	<table style="border: 1px solid; margin-bottom: 10px;">
		<tr>
			<th width="75px">Mã</th>
			<th width="167px">Tên</th>
		</tr>
		<c:forEach var="category" items="${categories}">
			<tr>
				<td>${category.id}</td>
				<td><a href="products?cateID=${category.id}">${category.name}</a></td>
			</tr>
		</c:forEach>
	</table>
	<c:choose>
		<c:when test="${products == null}">
			<h1>
				Hiện chưa có sản phẩm nào! <a href="#">Thêm sản phẩm</a>
			</h1>
		</c:when>
		<c:otherwise>
			<h1>SẢN PHẨM</h1>
			<table style="border: 1px solid;">
				<tr>
					<th width="75px">Mã</th>
					<th width="125px">Tên</th>
				</tr>
				<c:forEach var="product" items="${products}">
					<tr>
						<td>${product.id}</td>
						<td>${product.name}</td>
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
</body>
</html>