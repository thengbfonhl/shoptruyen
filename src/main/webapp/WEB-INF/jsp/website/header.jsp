<%@page import="com.shopmilk.entities.User"%>
<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- Sticky Premium Navbar -->
<nav class="fixed top-0 w-full z-50 glass transition-all duration-300">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-20">
            <!-- Logo Section -->
            <div class="flex-shrink-0 flex items-center cursor-pointer hover:scale-[1.02] active:scale-[0.98] transition-transform">
                <a href="${pageContext.request.contextPath}/home" class="flex flex-col">
                    <span class="text-3xl font-extrabold tracking-tight text-brand-DEFAULT">Shop<span class="text-dark">Milk</span></span>
                    <span class="text-xs text-gray-500 tracking-widest font-medium uppercase mt-0.5">Vì sức khỏe cộng đồng</span>
                </a>
            </div>

            <!-- Pre-calculate user authentication strings -->
            <%
                String username = "";
                String role = "";
                boolean isAdmin = false;

                Object principal = org.springframework.security.core.context.SecurityContextHolder.getContext().getAuthentication().getPrincipal();
                if (principal instanceof org.springframework.security.core.userdetails.UserDetails) {
                    username = ((User)principal).getFirstName();
                    role = ((User)principal).getRole();
                    if(role.trim().equalsIgnoreCase("admin")) {
                        isAdmin = true;
                    }
                }
            %>

            <!-- Desktop Menu -->
            <div class="hidden md:flex items-center space-x-10">
                <a href="${pageContext.request.contextPath}/home" class="text-gray-600 hover:text-brand-DEFAULT font-medium text-sm transition-colors border-b-2 border-transparent hover:border-brand-DEFAULT py-7">Trang Chủ</a>
                <a href="${pageContext.request.contextPath}/allProduct" class="text-gray-600 hover:text-brand-DEFAULT font-medium text-sm transition-colors border-b-2 border-transparent hover:border-brand-DEFAULT py-7">Sản Phẩm</a>
                
                <!-- Dropdown: Tin Tức -->
                <div class="relative group h-full">
                    <button class="text-gray-600 group-hover:text-brand-DEFAULT font-medium text-sm transition-colors flex items-center py-7">
                        Tin Tức <i class="ph ph-caret-down ml-1 text-xs"></i>
                    </button>
                    <!-- Dropdown Menu -->
                    <div class="absolute left-0 top-full pt-2 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300 transform translate-y-2 group-hover:translate-y-0 w-48">
                        <div class="bg-white/90 backdrop-blur-xl border border-white/20 rounded-2xl shadow-xl overflow-hidden p-2">
                            <a href="${pageContext.request.contextPath}/khuyenmai.html" class="block px-4 py-3 text-sm text-gray-700 hover:bg-brand-50 hover:text-brand-DEFAULT rounded-xl transition-colors">Khuyến Mại</a>
                            <a href="${pageContext.request.contextPath}/dinhduong.html" class="block px-4 py-3 text-sm text-gray-700 hover:bg-brand-50 hover:text-brand-DEFAULT rounded-xl transition-colors">Dinh Dưỡng</a>
                        </div>
                    </div>
                </div>

                <!-- Dropdown: Liên Hệ -->
                <div class="relative group h-full">
                    <button class="text-gray-600 group-hover:text-brand-DEFAULT font-medium text-sm transition-colors flex items-center py-7">
                        Liên Hệ <i class="ph ph-caret-down ml-1 text-xs"></i>
                    </button>
                    <!-- Dropdown Menu -->
                    <div class="absolute left-0 top-full pt-2 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300 transform translate-y-2 group-hover:translate-y-0 w-48">
                        <div class="bg-white/90 backdrop-blur-xl border border-white/20 rounded-2xl shadow-xl overflow-hidden p-2">
                            <a href="${pageContext.request.contextPath}/contact.html" class="block px-4 py-3 text-sm text-gray-700 hover:bg-brand-50 hover:text-brand-DEFAULT rounded-xl transition-colors">Thông Tin</a>
                            <a href="https://www.facebook.com/" target="_blank" class="block px-4 py-3 text-sm text-gray-700 hover:bg-brand-50 hover:text-brand-DEFAULT rounded-xl transition-colors">Facebook</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Utilities (Search, Cart, User) -->
            <div class="flex items-center space-x-6">
                <!-- Search Icon -->
                <div class="relative group">
                    <button id="search-btn" class="text-gray-600 hover:text-brand-DEFAULT p-2 transition-colors rounded-full hover:bg-brand-50 active:scale-95">
                        <i class="ph ph-magnifying-glass text-2xl"></i>
                    </button>
                    <!-- Search Input Dropdown -->
                    <div class="absolute right-0 top-full mt-2 w-72 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300 transform translate-y-2 group-hover:translate-y-0 z-50">
                        <div class="bg-white/90 backdrop-blur-xl border border-white/20 rounded-2xl shadow-xl p-3">
                            <form action="${pageContext.request.contextPath}/search" method="get" class="flex gap-2">
                                <input id="autocomplete" type="text" name="searchValue" placeholder="Tìm phẩm..." class="w-full bg-gray-50 border border-gray-200 text-sm rounded-xl px-4 py-2.5 focus:outline-none focus:ring-2 focus:ring-brand-DEFAULT/50 transition-shadow">
                                <button type="submit" class="bg-brand-DEFAULT text-white px-4 py-2.5 rounded-xl hover:bg-brand-dark transition-colors"><i class="ph ph-magnifying-glass font-bold"></i></button>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Cart -->
                <sec:authorize access="isAuthenticated()">
                <div class="relative group cursor-pointer" onclick="window.location.replace('${pageContext.request.contextPath}/order')">
                    <div class="flex items-center space-x-2 text-gray-600 hover:text-brand-DEFAULT p-2 transition-colors rounded-full hover:bg-brand-50 active:scale-95">
                        <div class="relative">
                            <i class="ph ph-shopping-cart-simple text-2xl"></i>
                            <!-- Badge số lượng - chỉ hiện khi có sản phẩm -->
                            <span id="cartBadge" class="absolute -top-1.5 -right-1.5 min-w-[18px] h-[18px] bg-red-500 text-white text-[10px] font-bold rounded-full flex items-center justify-center px-0.5 hidden">0</span>
                        </div>
                        <div class="hidden sm:flex flex-col text-left">
                            <span class="text-[10px] uppercase font-bold text-gray-400 tracking-wider">Giỏ hàng</span>
                            <span id="cartTotal" class="text-sm font-semibold text-gray-800">0 đ (0)</span>
                        </div>
                    </div>
                </div>
                </sec:authorize>

                <!-- User Actions (Login/User Details) -->
                <div class="flex items-center ml-2 border-l border-gray-200 pl-6 space-x-4">
                    <sec:authorize access="!isAuthenticated()">
                        <a href="${pageContext.request.contextPath}/login" class="text-sm font-semibold text-brand-DEFAULT hover:text-brand-dark hover:underline underline-offset-4 transition-all">Đăng nhập</a>
                    </sec:authorize>
                    
                    <sec:authorize access="isAuthenticated()">
                        <div class="relative group">
                            <div class="flex items-center gap-2 cursor-pointer p-1.5 rounded-full hover:bg-brand-50 transition-colors">
                                <div class="w-8 h-8 rounded-full bg-gradient-to-tr from-brand-DEFAULT to-blue-300 flex items-center justify-center text-white font-bold shadow-sm">
                                    <%=username.length() > 0 ? username.substring(0, 1).toUpperCase() : "U"%>
                                </div>
                                <span class="text-sm font-semibold text-gray-700 hidden sm:block"><%=username%></span>
                                <i class="ph ph-caret-down text-gray-400 text-xs hidden sm:block"></i>
                            </div>
                            
                            <!-- User Dropdown Menu -->
                            <div class="absolute right-0 top-full mt-2 w-48 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300 transform translate-y-2 group-hover:translate-y-0">
                                <div class="bg-white/95 backdrop-blur-xl border border-white/20 rounded-2xl shadow-xl overflow-hidden p-2">
                                    <% if(isAdmin) { %>
                                    <a href="${pageContext.request.contextPath}/admin" class="flex items-center gap-3 px-4 py-3 text-sm text-gray-700 hover:bg-brand-50 hover:text-brand-DEFAULT rounded-xl transition-colors">
                                        <i class="ph ph-shield-check text-lg"></i> Quản trị viên
                                    </a>
                                    <div class="h-px bg-gray-100 my-1 mx-2"></div>
                                    <% } %>
                                    <a href="${pageContext.request.contextPath}/perform_logout" class="flex items-center gap-3 px-4 py-3 text-sm text-red-600 hover:bg-red-50 rounded-xl transition-colors">
                                        <i class="ph ph-sign-out text-lg"></i> Đăng xuất
                                    </a>
                                </div>
                            </div>
                        </div>
                    </sec:authorize>
                </div>
            </div>
        </div>
    </div>
</nav>

<!-- Push content down to account for fixed navbar -->
<div class="h-20"></div>

<!-- Custom AutoComplete minimal logic instead of old jQuery UI -->
<script>
    // Lightweight auto-complete implementation for a modern look
    const tags = ["Sữa Vinamilk", "Sữa TH True Milk", "Sữa Nutifood", "Sữa Nestle", "Sữa Ensure"];
    // (Could implement custom dropdown UI here if requested)
</script>