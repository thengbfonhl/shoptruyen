<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section class="relative pt-8 pb-12 lg:pt-16 lg:pb-24 overflow-hidden">
    <!-- Decorative background elements -->
    <div class="absolute inset-0 bg-milk z-[-2]"></div>
    <div class="absolute top-0 right-0 w-1/2 h-full bg-brand-50 rounded-bl-[100px] z-[-1] hidden lg:block opacity-50"></div>
    <div class="absolute top-20 right-20 w-64 h-64 bg-brand-100 rounded-full mix-blend-multiply filter blur-3xl opacity-70 animate-pulse z-[-1]"></div>

    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative">
        <div class="flex flex-col lg:flex-row gap-8 lg:gap-12">
            
            <!-- Sidebar Categories (Left) -->
            <div class="w-full lg:w-1/4 z-10 hidden md:block">
                <div class="bg-white/80 backdrop-blur-xl border border-white/40 shadow-xl shadow-brand-DEFAULT/5 rounded-2xl overflow-hidden h-full">
                    <div class="px-6 py-5 border-b border-gray-100/50 bg-gradient-to-r from-brand-50 to-transparent">
                        <h3 class="text-sm font-bold text-gray-800 uppercase tracking-widest flex items-center">
                            <i class="ph ph-list-bold text-brand-DEFAULT mr-2 text-lg"></i> Danh Mục
                        </h3>
                    </div>
                    <div class="p-3">
                        <ul class="space-y-1">
                            <c:forEach var="category" items="${categories}">
                                <li>
                                    <a href="searchProduct?cateID=${category.id}" class="group flex items-center px-4 py-3 text-sm font-medium text-gray-600 rounded-xl hover:bg-brand-DEFAULT hover:text-white hover:shadow-md hover:shadow-brand-DEFAULT/20 transition-all select-none">
                                        <i class="ph ph-caret-right text-gray-300 group-hover:text-white mr-3 transition-colors text-xs"></i>
                                        ${category.name}
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Hero Banner (Right) -->
            <div class="w-full lg:w-3/4 flex-1">
                <div class="relative w-full h-[400px] md:h-[500px] lg:h-[550px] rounded-[2rem] overflow-hidden shadow-2xl shadow-brand-DEFAULT/10 group">
                    <!-- Banner Image with subtle zoom on hover -->
                    <img src="static/images/slider/img3.jpg" class="absolute inset-0 w-full h-full object-cover transform group-hover:scale-105 transition-transform duration-1000 ease-in-out" alt="Banner Sữa">
                    
                    <!-- Overlay Dark/Gradient -->
                    <div class="absolute inset-0 bg-gradient-to-t from-dark/80 via-dark/20 to-transparent"></div>

                    <!-- Content inside Banner -->
                    <div class="absolute inset-0 flex flex-col justify-end p-8 md:p-12 z-10 w-full md:w-3/4">
                        <span class="inline-block px-4 py-1.5 rounded-full bg-white/20 backdrop-blur-md border border-white/30 text-xs font-bold tracking-widest text-white uppercase w-max mb-4">
                            Khuyến mãi mới
                        </span>
                        <h2 class="text-3xl md:text-5xl font-extrabold text-white leading-tight mb-4 drop-shadow-sm">
                            Đỉnh Cao Dinh Dưỡng<br>
                            <span class="text-transparent bg-clip-text bg-gradient-to-r from-brand-100 to-white">Cho Gia Đình Của Bạn</span>
                        </h2>
                        <p class="text-gray-200 text-sm md:text-base mb-8 max-w-lg leading-relaxed drop-shadow-sm">
                            Khám phá hàng loạt các sản phẩm sữa chất lượng cao giúp tăng cường miễn dịch và phát triển toàn diện.
                        </p>
                        <div class="flex gap-4">
                            <a href="allProduct" class="px-8 py-3.5 bg-brand-DEFAULT text-white text-sm font-bold uppercase tracking-wider rounded-xl hover:bg-white hover:text-brand-DEFAULT shadow-lg shadow-brand-DEFAULT/30 hover:shadow-xl transition-all active:scale-95 flex items-center justify-center">
                                Xem Ngay <i class="ph ph-arrow-right-bold ml-2"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>