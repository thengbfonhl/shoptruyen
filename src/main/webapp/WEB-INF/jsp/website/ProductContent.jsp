<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- Breadcrumbs -->
<div class="bg-white border-b border-gray-100">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4">
        <nav class="flex text-sm font-medium text-gray-500" aria-label="Breadcrumb">
            <ol class="flex items-center space-x-2 sm:space-x-4">
                <li><a href="home" class="hover:text-brand-DEFAULT transition-colors flex items-center"><i class="ph ph-house mr-1.5 text-lg"></i> Trang Chủ</a></li>
                <li><i class="ph ph-caret-right text-gray-400"></i></li>
                <li class="text-brand-DEFAULT font-semibold" aria-current="page">Sản Phẩm</li>
            </ol>
        </nav>
    </div>
</div>

<section class="py-12 lg:py-20 bg-milk min-h-screen">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex flex-col lg:flex-row gap-8">
            
            <!-- Sidebar: Filters -->
            <div class="w-full lg:w-1/4">
                <div class="bg-white rounded-[2rem] shadow-sm border border-gray-100 p-6 sticky top-24">
                    <form action="searchProduct" method="get">
                        <!-- Category Filter -->
                        <div class="mb-8">
                            <h4 class="text-lg font-bold text-gray-900 mb-4 flex items-center"><i class="ph ph-list-bold text-brand-DEFAULT mr-2"></i> Danh Mục</h4>
                            <div class="space-y-3">
                                <c:forEach var="category" items="${categories}">
                                    <label class="flex items-center space-x-3 cursor-pointer group">
                                        <c:choose>
                                            <c:when test="${category.id == categoryID}">
                                                <input type="radio" checked="checked" value="${category.id}" name="cateID" class="form-radio h-5 w-5 text-brand-DEFAULT border-gray-300 focus:ring-brand-DEFAULT transition duration-150 ease-in-out">
                                            </c:when>
                                            <c:otherwise>
                                                <input type="radio" value="${category.id}" name="cateID" class="form-radio h-5 w-5 text-brand-DEFAULT border-gray-300 focus:ring-brand-DEFAULT transition duration-150 ease-in-out">
                                            </c:otherwise>
                                        </c:choose>
                                        <span class="text-sm font-medium text-gray-600 group-hover:text-brand-DEFAULT transition-colors">${category.name}</span>
                                    </label>
                                </c:forEach>
                            </div>
                        </div>

                        <!-- Submit Filter Button -->
                        <div class="pt-4 border-t border-gray-100">
                            <button type="submit" class="w-full bg-brand-DEFAULT text-white font-bold rounded-xl py-3 hover:bg-brand-600 shadow-md shadow-brand-DEFAULT/20 hover:shadow-lg transition-all active:scale-95">
                                Áp Dụng Lọc
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Main Content: Product Grid -->
            <div class="w-full lg:w-3/4">
                <div class="flex justify-between items-center mb-8">
                    <h1 class="text-2xl font-extrabold text-gray-900 tracking-tight">Tất Cả Sản Phẩm</h1>
                    <span class="text-sm text-gray-500 font-medium">Hiển thị kết quả</span>
                </div>

                <c:choose>
                    <c:when test="${products == null}">
                        <div class="bg-white rounded-[2rem] p-16 text-center shadow-sm border border-gray-100">
                            <i class="ph ph-magnifying-glass text-6xl text-gray-300 mb-4"></i>
                            <h2 class="text-2xl font-bold text-gray-800 mb-2">Không tìm thấy sản phẩm!</h2>
                            <p class="text-gray-500">Thử thay đổi bộ lọc hoặc từ khóa tìm kiếm của bạn.</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
                            <c:forEach var="product" items="${products}">
                                <!-- Product Card -->
                                <div class="group bg-white rounded-[2rem] p-4 shadow-sm hover:shadow-2xl hover:shadow-brand-DEFAULT/10 border border-gray-100 transition-all duration-300 transform hover:-translate-y-2 flex flex-col h-full relative">
                                    
                                    <!-- Image Box -->
                                    <div class="relative w-full aspect-square rounded-2xl overflow-hidden mb-5 bg-gray-50">
                                        <a href="productDetail?cateID=${product.category.id}&productID=${product.id}">
                                            <c:choose>
                                                <c:when test="${not empty product.image}">
                                                    <img src="${product.image}" onerror="this.onerror=null; this.src='https://cdn-files.hacom.vn/hacom/cdn/web/16042026/sua-bot-ensure-gold-vani-lon-400g-202104230836132948.jpg'" class="object-contain w-full h-full p-4 mix-blend-multiply group-hover:scale-110 transition-transform duration-500" alt="${product.name}" />
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="https://cdn-files.hacom.vn/hacom/cdn/web/16042026/sua-bot-ensure-gold-vani-lon-400g-202104230836132948.jpg" class="object-contain w-full h-full p-4 mix-blend-multiply group-hover:scale-110 transition-transform duration-500" alt="${product.name}" />
                                                </c:otherwise>
                                            </c:choose>
                                        </a>
                                        <!-- Quick actions -->
                                        <div class="absolute inset-x-0 bottom-4 flex justify-center opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                                            <a href="productDetail?cateID=${product.category.id}&productID=${product.id}" class="bg-white/90 backdrop-blur-md text-brand-DEFAULT shadow-lg p-3 rounded-full hover:bg-brand-DEFAULT hover:text-white transition-colors active:scale-95 mx-2"><i class="ph ph-eye text-xl"></i></a>
                                        </div>
                                    </div>

                                    <!-- Content -->
                                    <div class="flex flex-col flex-grow text-center px-2">
                                        <div class="flex justify-center text-yellow-400 text-sm mb-2">
                                            <c:if test="${product.views != null}">
                                                <c:forEach begin="1" end="${product.views}" step="1"><i class="ph-fill ph-star"></i></c:forEach>
                                                <c:forEach begin="${product.views}" end="4" step="1"><i class="ph-fill ph-star text-gray-200"></i></c:forEach>
                                            </c:if>
                                            <c:if test="${product.views == null}">
                                                <i class="ph-fill ph-star text-gray-200"></i><i class="ph-fill ph-star text-gray-200"></i><i class="ph-fill ph-star text-gray-200"></i><i class="ph-fill ph-star text-gray-200"></i><i class="ph-fill ph-star text-gray-200"></i>
                                            </c:if>
                                        </div>
                                        <a href="productDetail?cateID=${product.category.id}&productID=${product.id}" class="text-lg font-bold text-gray-800 hover:text-brand-DEFAULT transition-colors mb-2 line-clamp-2">${product.name}</a>
                                        <div class="mt-auto pt-4 pb-2">
                                            <span class="text-xl font-extrabold text-brand-DEFAULT">${product.price}đ</span>
                                        </div>
                                    </div>

                                    <!-- Add to Cart Hidden Form (using absolute to overlay on hover or normal layout) -->
                                    <div class="mt-4 pt-4 border-t border-gray-100">
                                        <form action="#" method="post" class="flex gap-2">
                                            <input type="hidden" name="cmd" value="_cart" />
                                            <input type="hidden" name="add" value="1" />
                                            <input type="hidden" name="item_name" value="${product.name}" />
                                            <input type="hidden" name="amount" value="${product.price}" />
                                            <input type="hidden" name="currency_code" value="VND" />
                                            <input type="hidden" name="quantity" value="1" />
                                            <button type="submit" name="submit" class="w-full bg-brand-50 text-brand-DEFAULT font-bold rounded-xl py-2.5 hover:bg-brand-DEFAULT hover:text-white transition-all active:scale-95 flex items-center justify-center">
                                                <i class="ph ph-shopping-cart-simple mr-2"></i> Mua
                                            </button>
                                        </form>
                                    </div>

                                </div>
                            </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</section>
<!-- // Removed outdated jquery slider scripts for minimal look, kept category filtering active -->