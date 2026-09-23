<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section class="py-16 lg:py-24 relative bg-milk">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        
        <!-- Section: BÁN CHẠY -->
        <div class="mb-20">
            <!-- Section Header -->
            <div class="text-center mb-12">
                <h3 class="text-3xl lg:text-4xl font-extrabold text-dark tracking-tight mb-3">TOP BÁN CHẠY</h3>
                <div class="w-24 h-1 bg-brand-DEFAULT mx-auto rounded-full mb-4"></div>
                <p class="text-gray-500 text-sm tracking-widest uppercase font-medium">Top 4 sản phẩm bán chạy nhất</p>
            </div>

            <!-- Product Grid: Grid layout using Tailwind -->
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
                <!-- Hardcoded bestsellers matching old JSP to keep data structure -->
                <!-- Item 1 -->
                <div class="group bg-white rounded-[2rem] p-4 shadow-sm hover:shadow-2xl hover:shadow-brand-DEFAULT/10 border border-gray-100 transition-all duration-300 transform hover:-translate-y-2 flex flex-col h-full">
                    <div class="relative w-full aspect-square rounded-2xl overflow-hidden mb-5 bg-gray-50">
                        <img src="static/images/phone/suavina.jpg" class="object-cover w-full h-full mix-blend-multiply group-hover:scale-110 transition-transform duration-500" alt="Sữa Bột Vinamilk" />
                        <!-- Quick Actions overlay -->
                        <div class="absolute inset-x-0 bottom-4 flex justify-center opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                            <a href="single.html" class="bg-white/90 backdrop-blur-md text-brand-DEFAULT shadow-lg p-3 rounded-full hover:bg-brand-DEFAULT hover:text-white transition-colors active:scale-95 mx-2">
                                <i class="ph ph-eye text-xl"></i>
                            </a>
                            <form action="#" method="post" class="m-0 flex">
                                <input type="hidden" name="cmd" value="_cart" />
                                <input type="hidden" name="add" value="1" />
                                <input type="hidden" name="item_name" value="Sữa Bột Vinamilk" />
                                <input type="hidden" name="amount" value="500000" />
                                <input type="hidden" name="currency_code" value="VND" />
                                <input type="hidden" name="quantity" value="1" />
                                <button type="submit" name="submit" class="bg-white/90 backdrop-blur-md text-brand-DEFAULT shadow-lg p-3 rounded-full hover:bg-brand-DEFAULT hover:text-white transition-colors active:scale-95 mx-2 flex items-center justify-center border-none">
                                    <i class="ph ph-shopping-cart-simple text-xl"></i>
                                </button>
                            </form>
                        </div>
                    </div>
                    <div class="flex flex-col flex-grow text-center px-2">
                        <div class="flex justify-center text-yellow-400 text-sm mb-2">
                            <i class="ph-fill ph-star"></i><i class="ph-fill ph-star"></i><i class="ph-fill ph-star"></i><i class="ph-fill ph-star"></i><i class="ph-fill ph-star"></i>
                        </div>
                        <a href="single.html" class="text-lg font-bold text-gray-800 hover:text-brand-DEFAULT transition-colors mb-2 line-clamp-2">Sữa Bột Vinamilk</a>
                        <div class="mt-auto pt-4 flex justify-center items-center">
                            <span class="text-xl font-extrabold text-brand-DEFAULT">500.000đ</span>
                        </div>
                    </div>
                </div>

                <!-- Item 2 -->
                <div class="group bg-white rounded-[2rem] p-4 shadow-sm hover:shadow-2xl hover:shadow-brand-DEFAULT/10 border border-gray-100 transition-all duration-300 transform hover:-translate-y-2 flex flex-col h-full">
                    <div class="relative w-full aspect-square rounded-2xl overflow-hidden mb-5 bg-gray-50">
                        <img src="static/images/phone/ensure.jpg" class="object-cover w-full h-full mix-blend-multiply group-hover:scale-110 transition-transform duration-500" alt="Sữa Bột Ensure Úc" />
                        <div class="absolute inset-x-0 bottom-4 flex justify-center opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                            <a href="single.html" class="bg-white/90 backdrop-blur-md text-brand-DEFAULT shadow-lg p-3 rounded-full hover:bg-brand-DEFAULT hover:text-white transition-colors active:scale-95 mx-2"><i class="ph ph-eye text-xl"></i></a>
                            <form action="#" method="post" class="m-0 flex">
                                <input type="hidden" name="cmd" value="_cart" />
                                <input type="hidden" name="add" value="1" />
                                <input type="hidden" name="item_name" value="Sữa Bột Ensure Úc" />
                                <input type="hidden" name="amount" value="500000" />
                                <input type="hidden" name="currency_code" value="VND" />
                                <input type="hidden" name="quantity" value="1" />
                                <button type="submit" name="submit" class="bg-white/90 backdrop-blur-md text-brand-DEFAULT shadow-lg p-3 rounded-full hover:bg-brand-DEFAULT hover:text-white transition-colors active:scale-95 mx-2 flex items-center justify-center border-none">
                                    <i class="ph ph-shopping-cart-simple text-xl"></i>
                                </button>
                            </form>
                        </div>
                    </div>
                    <div class="flex flex-col flex-grow text-center px-2">
                        <div class="flex justify-center text-yellow-400 text-sm mb-2"><i class="ph-fill ph-star"></i><i class="ph-fill ph-star"></i><i class="ph-fill ph-star"></i><i class="ph-fill ph-star"></i><i class="ph-fill ph-star"></i></div>
                        <a href="single.html" class="text-lg font-bold text-gray-800 hover:text-brand-DEFAULT transition-colors mb-2 line-clamp-2">Sữa Bột Ensure Úc</a>
                        <div class="mt-auto pt-4 flex justify-center items-center">
                            <span class="text-xl font-extrabold text-brand-DEFAULT">500.000đ</span>
                        </div>
                    </div>
                </div>

                <!-- Item 3 -->
                <div class="group bg-white rounded-[2rem] p-4 shadow-sm hover:shadow-2xl hover:shadow-brand-DEFAULT/10 border border-gray-100 transition-all duration-300 transform hover:-translate-y-2 flex flex-col h-full">
                    <div class="relative w-full aspect-square rounded-2xl overflow-hidden mb-5 bg-gray-50">
                        <img src="static/images/phone/dielac.jpg" class="object-cover w-full h-full mix-blend-multiply group-hover:scale-110 transition-transform duration-500" alt="Sữa Bột Dielac" />
                        <div class="absolute inset-x-0 bottom-4 flex justify-center opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                            <a href="single.html" class="bg-white/90 backdrop-blur-md text-brand-DEFAULT shadow-lg p-3 rounded-full hover:bg-brand-DEFAULT hover:text-white transition-colors active:scale-95 mx-2"><i class="ph ph-eye text-xl"></i></a>
                            <form action="#" method="post" class="m-0 flex">
                                <input type="hidden" name="cmd" value="_cart" />
                                <input type="hidden" name="add" value="1" />
                                <input type="hidden" name="item_name" value="Sữa Bột Dielac" />
                                <input type="hidden" name="amount" value="500000" />
                                <input type="hidden" name="currency_code" value="VND" />
                                <input type="hidden" name="quantity" value="1" />
                                <button type="submit" name="submit" class="bg-white/90 backdrop-blur-md text-brand-DEFAULT shadow-lg p-3 rounded-full hover:bg-brand-DEFAULT hover:text-white transition-colors active:scale-95 mx-2 flex items-center justify-center border-none">
                                    <i class="ph ph-shopping-cart-simple text-xl"></i>
                                </button>
                            </form>
                        </div>
                    </div>
                    <div class="flex flex-col flex-grow text-center px-2">
                        <div class="flex justify-center text-yellow-400 text-sm mb-2"><i class="ph-fill ph-star"></i><i class="ph-fill ph-star"></i><i class="ph-fill ph-star"></i><i class="ph-fill ph-star"></i><i class="ph-fill ph-star"></i></div>
                        <a href="single.html" class="text-lg font-bold text-gray-800 hover:text-brand-DEFAULT transition-colors mb-2 line-clamp-2">Sữa Bột Dielac</a>
                        <div class="mt-auto pt-4 flex justify-center items-center">
                            <span class="text-xl font-extrabold text-brand-DEFAULT">500.000đ</span>
                        </div>
                    </div>
                </div>

                <!-- Item 4 -->
                <div class="group bg-white rounded-[2rem] p-4 shadow-sm hover:shadow-2xl hover:shadow-brand-DEFAULT/10 border border-gray-100 transition-all duration-300 transform hover:-translate-y-2 flex flex-col h-full">
                    <div class="relative w-full aspect-square rounded-2xl overflow-hidden mb-5 bg-gray-50">
                        <img src="static/images/phone/pedia.jpg" class="object-cover w-full h-full mix-blend-multiply group-hover:scale-110 transition-transform duration-500" alt="Sữa Bột Pediasure" />
                        <div class="absolute inset-x-0 bottom-4 flex justify-center opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                            <a href="single.html" class="bg-white/90 backdrop-blur-md text-brand-DEFAULT shadow-lg p-3 rounded-full hover:bg-brand-DEFAULT hover:text-white transition-colors active:scale-95 mx-2"><i class="ph ph-eye text-xl"></i></a>
                            <form action="#" method="post" class="m-0 flex">
                                <input type="hidden" name="cmd" value="_cart" />
                                <input type="hidden" name="add" value="1" />
                                <input type="hidden" name="item_name" value="Sữa Bột Pediasure" />
                                <input type="hidden" name="amount" value="500000" />
                                <input type="hidden" name="currency_code" value="VND" />
                                <input type="hidden" name="quantity" value="1" />
                                <button type="submit" name="submit" class="bg-white/90 backdrop-blur-md text-brand-DEFAULT shadow-lg p-3 rounded-full hover:bg-brand-DEFAULT hover:text-white transition-colors active:scale-95 mx-2 flex items-center justify-center border-none">
                                    <i class="ph ph-shopping-cart-simple text-xl"></i>
                                </button>
                            </form>
                        </div>
                    </div>
                    <div class="flex flex-col flex-grow text-center px-2">
                        <div class="flex justify-center text-yellow-400 text-sm mb-2"><i class="ph-fill ph-star"></i><i class="ph-fill ph-star"></i><i class="ph-fill ph-star"></i><i class="ph-fill ph-star"></i><i class="ph-fill ph-star"></i></div>
                        <a href="single.html" class="text-lg font-bold text-gray-800 hover:text-brand-DEFAULT transition-colors mb-2 line-clamp-2">Sữa Bột Pediasure</a>
                        <div class="mt-auto pt-4 flex justify-center items-center">
                            <span class="text-xl font-extrabold text-brand-DEFAULT">500.000đ</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Section: XEM NHIỀU NHẤT -->
        <div class="mt-24">
            <!-- Section Header -->
            <div class="text-center mb-12">
                <h3 class="text-3xl lg:text-4xl font-extrabold text-dark tracking-tight mb-3">XEM NHIỀU NHẤT</h3>
                <div class="w-24 h-1 bg-brand-DEFAULT mx-auto rounded-full mb-4"></div>
                <p class="text-gray-500 text-sm tracking-widest uppercase font-medium">Sản phẩm có lượt xem cao</p>
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
                                        <img src="${product.image}" onerror="this.onerror=null; this.src='https://cdn-files.hacom.vn/hacom/cdn/web/16042026/sua-bot-ensure-gold-vani-lon-400g-202104230836132948.jpg'" class="object-contain max-h-full max-w-full drop-shadow-sm group-hover:scale-110 transition-transform duration-500 ease-out" alt="${product.name}" />
                                    </c:when>
                                    <c:otherwise>
                                        <img src="https://cdn-files.hacom.vn/hacom/cdn/web/16042026/sua-bot-ensure-gold-vani-lon-400g-202104230836132948.jpg" class="object-contain max-h-full max-w-full drop-shadow-sm group-hover:scale-110 transition-transform duration-500 ease-out" alt="${product.name}" />
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