<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <title>ShopMilk | Đăng nhập</title>
    <!-- Include Global Tailwind Config -->
    <jsp:include page="website/head.jsp" />
  </head>
  <body
    class="bg-gray-50 flex items-center justify-center min-h-screen relative overflow-hidden"
  >
    <!-- Background Decoration -->
    <div
      class="fixed top-[-10%] left-[-10%] w-[50%] h-[50%] rounded-full bg-brand-light opacity-50 blur-[100px] z-0 pointer-events-none"
    ></div>
    <div
      class="fixed bottom-[-10%] right-[-10%] w-[50%] h-[50%] rounded-full bg-blue-100 opacity-50 blur-[100px] z-0 pointer-events-none"
    ></div>

    <div
      class="relative z-10 w-full max-w-md p-8 m-4 bg-white/80 backdrop-blur-xl border border-white/40 shadow-2xl rounded-3xl"
    >
      <div class="text-center mb-8">
        <h2 class="text-3xl font-extrabold text-gray-900 tracking-tight">
          Chào mừng quay lại
        </h2>
        <p class="text-gray-500 mt-2 text-sm">
          Đăng nhập để tiếp tục mua sắm cùng ShopMilk
        </p>
      </div>

      <form
        method="post"
        action="${pageContext.request.contextPath}/perform_login"
        class="space-y-6"
      >
        <div>
          <label
            class="block text-sm font-semibold text-gray-700 mb-2"
            for="inputEmailAddress"
            >Email liên hệ</label
          >
          <div class="relative">
            <div
              class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none"
            >
              <i class="ph ph-envelope text-gray-400 text-xl"></i>
            </div>
            <input
              class="w-full pl-12 pr-4 py-3.5 rounded-xl border border-gray-200 bg-white/50 focus:bg-white focus:ring-2 focus:ring-brand-DEFAULT/30 focus:border-brand-DEFAULT outline-none transition-all placeholder-gray-400 text-gray-800 font-medium"
              id="inputEmailAddress"
              type="text"
              name="username"
              placeholder="Nhập địa chỉ email"
              required
            />
          </div>
        </div>

        <div>
          <label
            class="block text-sm font-semibold text-gray-700 mb-2"
            for="inputPassword"
            >Mật khẩu</label
          >
          <div class="relative">
            <div
              class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none"
            >
              <i class="ph ph-lock text-gray-400 text-xl"></i>
            </div>
            <input
              class="w-full pl-12 pr-4 py-3.5 rounded-xl border border-gray-200 bg-white/50 focus:bg-white focus:ring-2 focus:ring-brand-DEFAULT/30 focus:border-brand-DEFAULT outline-none transition-all placeholder-gray-400 text-gray-800 font-medium"
              id="inputPassword"
              type="password"
              name="password"
              placeholder="Nhập mật khẩu"
              required
            />
          </div>
        </div>

        <div class="flex items-center justify-between">
          <label class="flex items-center cursor-pointer group">
            <div class="relative flex items-center">
              <input
                class="w-5 h-5 text-brand-DEFAULT bg-gray-100 border-gray-300 rounded focus:ring-brand-DEFAULT focus:ring-2 transition-all cursor-pointer"
                id="rememberPasswordCheck"
                type="checkbox"
              />
            </div>
            <span
              class="ml-2.5 text-sm font-semibold text-gray-600 group-hover:text-gray-800 transition-colors"
              >Ghi nhớ đăng nhập</span
            >
          </label>
          <a
            class="text-sm font-bold text-brand-DEFAULT hover:text-brand-dark transition-colors"
            href="password"
            >Quên mật khẩu?</a
          >
        </div>

        <div class="mt-8 pt-4">
          <button
            type="submit"
            class="w-full py-3.5 px-4 rounded-xl bg-brand-DEFAULT hover:bg-brand-dark hover:shadow-lg hover:-translate-y-0.5 text-white font-bold text-[1.1rem] transition-all active:scale-95 flex items-center justify-center gap-2"
          >
            <span>Đăng nhập</span>
            <i class="ph ph-sign-in font-bold text-xl"></i>
          </button>
        </div>
      </form>

      <div class="mt-8 mb-2 text-center text-sm font-medium text-gray-500">
        <span>Chưa có tài khoản? </span>
        <a href="register" class="text-brand-DEFAULT font-bold hover:underline"
          >Đăng ký ngay</a
        >
      </div>

      <!-- Optional return home link -->
      <div class="mt-6 pt-6 border-t border-gray-100 flex justify-center">
        <a
          href="${pageContext.request.contextPath}/"
          class="text-sm font-semibold text-gray-400 hover:text-gray-600 transition-colors flex items-center gap-1.5 hover:-translate-x-1"
        >
          <i class="ph ph-arrow-left text-lg"></i>
          <span>Trở về trang chủ</span>
        </a>
      </div>
    </div>
  </body>
</html>