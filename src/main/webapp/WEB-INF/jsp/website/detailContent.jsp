<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- Breadcrumbs -->
<div class="bg-white border-b border-gray-100">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4">
        <nav class="flex text-sm font-medium text-gray-500" aria-label="Breadcrumb">
            <ol class="flex items-center space-x-2 sm:space-x-4">
                <li>
                    <a href="home" class="hover:text-brand-DEFAULT transition-colors flex items-center">
                        <i class="ph ph-house mr-1.5 text-lg"></i> Trang Chủ
                    </a>
                </li>
                <li><i class="ph ph-caret-right text-gray-400"></i></li>
                <li>
                    <a href="allProduct" class="hover:text-brand-DEFAULT transition-colors">Sản Phẩm</a>
                </li>
                <li><i class="ph ph-caret-right text-gray-400"></i></li>
                <li class="text-brand-DEFAULT font-semibold" aria-current="page">${product.name}</li>
            </ol>
        </nav>
    </div>
</div>

<section class="py-12 lg:py-20 bg-milk min-h-screen">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        
        <!-- Main Product Section -->
        <div class="bg-white rounded-[2rem] shadow-xl shadow-brand-DEFAULT/5 border border-white/50 overflow-hidden mb-16">
            <div class="flex flex-col lg:flex-row">
                
                <!-- Left: Product Image -->
                <div class="w-full lg:w-1/2 p-8 lg:p-12 bg-gray-50 flex items-center justify-center relative group">
                    <button class="absolute top-6 right-6 p-3 bg-white rounded-full shadow-sm text-gray-400 hover:text-red-500 transition-colors z-10 active:scale-95">
                        <i class="ph-fill ph-heart text-xl"></i>
                    </button>
                    <!-- Display main image -->
                    <div class="relative w-full max-w-md aspect-square rounded-2xl overflow-hidden hover:scale-105 transition-transform duration-700 ease-in-out mix-blend-multiply">
                        <c:choose>
                            <c:when test="${not empty product.image}">
                                <img src="${product.image}" onerror="this.onerror=null; this.src='https://cdn-files.hacom.vn/hacom/cdn/web/16042026/sua-bot-ensure-gold-vani-lon-400g-202104230836132948.jpg'" class="object-contain w-full h-full" alt="${product.name}">
                            </c:when>
                            <c:otherwise>
                                <img src="https://cdn-files.hacom.vn/hacom/cdn/web/16042026/sua-bot-ensure-gold-vani-lon-400g-202104230836132948.jpg" class="object-contain w-full h-full" alt="${product.name}">
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <!-- Right: Product Details -->
                <div class="w-full lg:w-1/2 p-8 lg:p-16 flex flex-col justify-center">
                    <!-- Badges -->
                    <div class="flex items-center gap-3 mb-6">
                        <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-bold uppercase tracking-wider bg-brand-100 text-brand-DEFAULT">
                            Thịnh Hành
                        </span>
                        <div class="flex items-center text-yellow-400 text-sm">
                            <i class="ph-fill ph-star"></i><i class="ph-fill ph-star"></i><i class="ph-fill ph-star"></i><i class="ph-fill ph-star"></i><i class="ph-fill ph-star text-gray-300"></i>
                            <span class="text-gray-500 text-xs ml-2 font-medium">(128 Đánh giá)</span>
                        </div>
                    </div>

                    <!-- Title & Price -->
                    <h1 class="text-3xl sm:text-4xl lg:text-5xl font-extrabold text-gray-900 leading-tight mb-4 tracking-tight">
                        ${product.name}
                    </h1>
                    <div class="text-3xl font-black text-brand-DEFAULT mb-6">
                        ${product.price} <span class="text-xl font-bold text-gray-400 ml-1 line-through">650.000đ</span>
                    </div>

                    <!-- Description -->
                    <p class="text-gray-600 leading-relaxed mb-8">
                        ${product.description}
                    </p>

                    <!-- Add to Cart Form Structure (Preserving legacy logic) -->
                    <div class="mt-auto border-t border-gray-100 pt-8">
                        <div class="flex items-center justify-between mb-6">
                            <span class="text-sm font-medium text-gray-500">
                                Trạng thái: 
                                <c:choose>
                                    <c:when test="${product.quantity > 0}">
                                        <span class="text-green-500 font-bold ml-1"><i class="ph-fill ph-check-circle mr-1"></i>Còn hàng (${product.quantity})</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="text-red-500 font-bold ml-1"><i class="ph-fill ph-x-circle mr-1"></i>Hết hàng</span>
                                    </c:otherwise>
                                </c:choose>
                            </span>
                        </div>

                        <form action="#" method="post" class="flex flex-col sm:flex-row gap-4">
                            <!-- Hidden minicart inputs -->
                            <input type="hidden" name="cmd" value="_cart" />
                            <input type="hidden" name="add" value="1" />
                            <input type="hidden" name="item_name" value="${product.name}" />
                            <input type="hidden" name="amount" value="${product.price}" />
                            <input type="hidden" name="currency_code" value="VND" />
                            
                            <!-- Quantity Input -->
                            <div class="relative w-full sm:w-32">
                                <label for="soluongdat" class="sr-only">Số lượng</label>
                                <input id="soluongdat" onchange="checkSoluong()" type="number" min="1" value="1" name="quantity"
                                    class="w-full bg-gray-50 border border-gray-200 text-gray-900 text-lg font-bold rounded-xl px-4 py-4 focus:outline-none focus:ring-2 focus:ring-brand-DEFAULT/50 transition-all text-center">
                            </div>
                            
                            <!-- Submit Button -->
                            <button type="submit" name="submit" class="flex-1 bg-brand-DEFAULT text-white font-bold text-lg rounded-xl py-4 flex items-center justify-center gap-3 hover:bg-brand-600 shadow-xl shadow-brand-DEFAULT/30 hover:shadow-2xl transition-all active:scale-95">
                                <i class="ph ph-shopping-cart-simple text-2xl"></i> Thêm Vào Giỏ Hiện Tại
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Information Tabs replacing accordion -->
        <div class="bg-white rounded-[2rem] shadow-sm border border-gray-100 p-8 lg:p-12">
            <!-- Simulated Tabs Header -->
            <div class="flex flex-wrap gap-8 border-b border-gray-100 pb-4 mb-8">
                <button class="text-brand-DEFAULT font-bold text-lg border-b-2 border-brand-DEFAULT pb-4 -mb-[18px]">Mô Tả Sản Phẩm</button>
                <button class="text-gray-400 font-medium text-lg hover:text-gray-600 transition-colors pb-4">Thông tin dưỡng chất</button>
                <button class="text-gray-400 font-medium text-lg hover:text-gray-600 transition-colors pb-4">Đánh giá & Nhận xét</button>
            </div>
            
            <!-- Tab Content -->
            <div class="prose prose-brand max-w-none text-gray-600 leading-relaxed">
                <p>${product.description}</p>
                <p class="mt-4">Sản phẩm được tối ưu hóa thành phần tốt nhất cho sự tiêu hóa và hấp thụ của cơ thể. Phù hợp cho nhiều lứa tuổi và hỗ trợ phát triển bền vững hệ miễn dịch.</p>
            </div>
        </div>

    </div>
</section>

<script>
    function checkSoluong(){
        var soluong = parseInt(document.getElementById("soluongdat").value);
        var soluongdat = parseInt("${product.quantity}");
        if(soluong > soluongdat){
            alert("Số lượng yêu cầu vượt quá sản phẩm hiện có trong kho!");
            document.getElementById("soluongdat").value = soluongdat;
        }
    }
</script>