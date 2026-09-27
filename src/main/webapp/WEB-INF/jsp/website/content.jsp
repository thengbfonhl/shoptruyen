<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section class="py-16 lg:py-24 relative bg-paper">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        
        <!-- Section: TRUYỆN ĐƯỢC QUAN TÂM -->
        <div class="mt-24">
            <!-- Section Header -->
            <div class="text-center mb-12">
                <h3 class="text-3xl lg:text-4xl font-extrabold text-dark tracking-tight mb-3">TRUYỆN ĐƯỢC QUAN TÂM</h3>
                <div class="w-24 h-1 bg-brand-DEFAULT mx-auto rounded-full mb-4"></div>
                <p class="text-gray-500 text-sm tracking-widest uppercase font-medium">Chọn câu chuyện tiếp theo của bạn</p>
            </div>

            <!-- Dynamic Product Grid from ${mostViews} -->
            <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-8">
                <c:forEach var="product" varStatus="status" items="${mostViews}">
                    <div class="group bg-white rounded-[2rem] p-4 shadow-sm hover:shadow-2xl hover:shadow-brand-DEFAULT/10 border border-gray-100 transition-all duration-300 transform hover:-translate-y-2 flex flex-col h-full">
                        <!-- Image Box -->
                        <div class="relative w-full aspect-square bg-gray-50 p-4 mb-5 mix-blend-multiply flex items-center justify-center overflow-hidden">
                            <a href="productDetail?cateID=${product.category.id}&productID=${product.id}">
                                <c:choose>
                                    <c:when test="${not empty product.image}">
                                        <img src="${product.image}" onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/static/images/comics/placeholder.svg'" class="object-contain max-h-full max-w-full drop-shadow-sm group-hover:scale-110 transition-transform duration-500 ease-out" alt="${product.name}" />
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${pageContext.request.contextPath}/static/images/comics/placeholder.svg" class="object-contain max-h-full max-w-full drop-shadow-sm group-hover:scale-110 transition-transform duration-500 ease-out" alt="${product.name}" />
                                    </c:otherwise>
                                </c:choose>
                            </a>
                            <!-- Quick actions overlay -->
                            <div class="absolute inset-x-0 bottom-4 flex justify-center opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                                <a href="productDetail?cateID=${product.category.id}&productID=${product.id}" class="bg-white/90 backdrop-blur-md text-brand-DEFAULT shadow-lg p-3 rounded-full hover:bg-brand-DEFAULT hover:text-white transition-colors active:scale-95 mx-2"><i class="ph ph-eye text-xl"></i></a>
                                <form action="#" method="post" class="m-0 flex">
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" />
                                    <input type="hidden" name="item_name" value="${product.name}" />
                                    <input type="hidden" name="amount" value="${product.price}" />
                                    <input type="hidden" name="currency_code" value="VND" />
                                    <input type="hidden" name="quantity" value="1" />
                                    <button type="submit" name="submit" class="bg-white/90 backdrop-blur-md text-brand-DEFAULT shadow-lg p-3 rounded-full hover:bg-brand-DEFAULT hover:text-white transition-colors active:scale-95 mx-2 flex items-center justify-center border-none">
                                        <i class="ph ph-shopping-cart-simple text-xl"></i>
                                    </button>
                                </form>
                            </div>
                        </div>
                        <div class="flex flex-col flex-grow text-center px-2">
                            <a href="productDetail?cateID=${product.category.id}&productID=${product.id}" class="text-lg font-bold text-gray-800 hover:text-brand-DEFAULT transition-colors mb-2 line-clamp-2">${product.name}</a>
                            <div class="mt-auto pt-4 flex justify-center items-center">
                                <span class="text-xl font-extrabold text-brand-DEFAULT">${product.price} VNĐ</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <c:if test="${empty mostViews}">
                <div class="text-center py-12 text-gray-400">
                    <i class="ph ph-package text-6xl mb-4 text-gray-300"></i>
                    <p>Chưa có dữ liệu sản phẩm.</p>
                </div>
            </c:if>
        </div>

    </div>
</section>