<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>ShopMilk | Đăng ký</title>
    <!-- Include Global Tailwind Config -->
    <jsp:include page="website/head.jsp" />
</head>
<body class="bg-gray-50 flex items-center justify-center min-h-screen relative overflow-hidden py-10">
    <!-- Background Decoration -->
    <div class="fixed top-[-10%] right-[-10%] w-[50%] h-[50%] rounded-full bg-brand-light opacity-50 blur-[100px] z-0 pointer-events-none"></div>
    <div class="fixed bottom-[-10%] left-[-10%] w-[50%] h-[50%] rounded-full bg-blue-100 opacity-50 blur-[100px] z-0 pointer-events-none"></div>

    <div class="relative z-10 w-full max-w-lg p-8 m-4 bg-white/80 backdrop-blur-xl border border-white/40 shadow-2xl rounded-3xl">
        <div class="text-center mb-8">
            <h2 class="text-3xl font-extrabold text-gray-900 tracking-tight">Tạo tài khoản</h2>
            <p class="text-gray-500 mt-2 text-sm">Tham gia cùng hàng ngàn khách hàng của ShopMilk</p>
        </div>
        
        <c:if test="${not empty message}">
            <div class="mb-6 p-4 rounded-xl bg-red-50 border border-red-100 text-red-600 flex items-center gap-2 font-medium">
                <i class="ph ph-warning-circle text-lg"></i>
                <span class="text-sm">${message}</span>
            </div>
        </c:if>
        
        <form:form method="POST" action="${pageContext.request.contextPath}/save-ac" modelAttribute="ac" class="space-y-5">
            <div class="grid grid-cols-1 sm:grid-cols-2 gap-5">
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2" for="inputFirstName">Họ</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                            <i class="ph ph-user text-gray-400 text-lg"></i>
                        </div>
                        <form:input class="w-full pl-11 pr-4 py-3 rounded-xl border border-gray-200 bg-white/50 focus:bg-white focus:ring-2 focus:ring-brand-DEFAULT/30 focus:border-brand-DEFAULT outline-none transition-all placeholder-gray-400 text-gray-800 font-medium" 
                               id="inputFirstName" type="text" path="firstName" placeholder="Vd: Nguyễn Văn" required="required" />
                    </div>
                </div>
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2" for="inputLastName">Tên</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                            <i class="ph ph-user-focus text-gray-400 text-lg"></i>
                        </div>
                        <form:input class="w-full pl-11 pr-4 py-3 rounded-xl border border-gray-200 bg-white/50 focus:bg-white focus:ring-2 focus:ring-brand-DEFAULT/30 focus:border-brand-DEFAULT outline-none transition-all placeholder-gray-400 text-gray-800 font-medium" 
                               id="inputLastName" type="text" path="lastName" placeholder="Vd: A" required="required" />
                    </div>
                </div>
            </div>
            
            <div>
                <label class="block text-sm font-semibold text-gray-700 mb-2" for="inputEmailAddress">Email</label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                        <i class="ph ph-envelope text-gray-400 text-lg"></i>
                    </div>
                    <form:input path="mail" class="w-full pl-11 pr-4 py-3 rounded-xl border border-gray-200 bg-white/50 focus:bg-white focus:ring-2 focus:ring-brand-DEFAULT/30 focus:border-brand-DEFAULT outline-none transition-all placeholder-gray-400 text-gray-800 font-medium" 
                           id="inputEmailAddress" type="email" placeholder="example@gmail.com" required="required" />
                </div>
            </div>
            
            <div class="grid grid-cols-1 sm:grid-cols-2 gap-5">
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2" for="inputPassword">Mật khẩu</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                            <i class="ph ph-lock text-gray-400 text-lg"></i>
                        </div>
                        <form:input path="password" class="w-full pl-11 pr-4 py-3 rounded-xl border border-gray-200 bg-white/50 focus:bg-white focus:ring-2 focus:ring-brand-DEFAULT/30 focus:border-brand-DEFAULT outline-none transition-all placeholder-gray-400 text-gray-800 font-medium" 
                               id="inputPassword" type="password" placeholder="Tối thiểu 8 ký tự" required="required" />
                    </div>
                </div>
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2" for="inputConfirmPassword">Xác nhận mật khẩu</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                            <i class="ph ph-check-circle text-gray-400 text-lg"></i>
                        </div>
                        <input class="w-full pl-11 pr-4 py-3 rounded-xl border border-gray-200 bg-white/50 focus:bg-white focus:ring-2 focus:ring-brand-DEFAULT/30 focus:border-brand-DEFAULT outline-none transition-all placeholder-gray-400 text-gray-800 font-medium" 
                               id="inputConfirmPassword" type="password" placeholder="Nhập lại mật khẩu" required="required" />
                    </div>
                </div>
            </div>
            
            <div class="mt-8 pt-2">
                <button type="submit" class="w-full py-3.5 px-4 rounded-xl bg-brand-DEFAULT hover:bg-brand-dark hover:shadow-lg hover:-translate-y-0.5 text-white font-bold text-[1.1rem] transition-all active:scale-95 flex items-center justify-center gap-2">
                    <i class="ph ph-user-plus font-bold text-xl"></i>
                    <span>Tạo Tài Khoản</span>
                </button>
            </div>
        </form:form>
        
        <div class="mt-8 text-center text-sm font-medium text-gray-500">
            <span>Đã có tài khoản? </span>
            <a href="login" class="text-brand-DEFAULT font-bold hover:underline">Đăng nhập ngay</a>
        </div>
        
        <!-- Optional return home link -->
        <div class="mt-6 pt-6 border-t border-gray-100 flex justify-center">
            <a href="${pageContext.request.contextPath}/" class="text-sm font-semibold text-gray-400 hover:text-gray-600 transition-colors flex items-center gap-1.5 hover:-translate-x-1">
                <i class="ph ph-arrow-left text-lg"></i>
                <span>Trở về trang chủ</span>
            </a>
        </div>
    </div>
</body>
</html>