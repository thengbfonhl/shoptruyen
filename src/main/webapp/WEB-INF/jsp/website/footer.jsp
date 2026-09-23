<%@ page pageEncoding="utf-8"%>

<footer class="bg-dark text-gray-300 py-16 border-t border-gray-800">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="grid grid-cols-1 md:grid-cols-3 gap-12">
      <!-- Brand Info -->
      <div class="space-y-4">
        <a href="${pageContext.request.contextPath}/home" class="inline-block">
          <span
            class="text-3xl font-extrabold tracking-tight text-brand-DEFAULT"
            >Shop<span class="text-white">Milk</span></span
          >
        </a>
        <p class="text-sm text-gray-400 max-w-xs leading-relaxed">
          Đồng hành cùng sự phát triển của gia đình bạn. Chuyên cung cấp các
          loại sữa nội & ngoại nhập chất lượng cao. Vì sức khỏe cộng đồng.
        </p>
        <p class="text-xs text-gray-500 pt-4">
          Shop Milk &copy; 2026 | Designed with ❤️ by Nhóm 3
        </p>
      </div>

      <!-- Links -->
      <div class="space-y-4">
        <h4 class="text-lg font-semibold text-white tracking-wide">Danh Mục</h4>
        <ul class="space-y-2">
          <li>
            <a
              href="${pageContext.request.contextPath}/about.html"
              class="text-sm text-gray-400 hover:text-brand-light transition-colors flex items-center pr-2"
              ><i class="ph ph-caret-right mr-2 text-brand-DEFAULT"></i> Giới
              Thiệu</a
            >
          </li>
          <li>
            <a
              href="${pageContext.request.contextPath}/allProduct"
              class="text-sm text-gray-400 hover:text-brand-light transition-colors flex items-center pr-2"
              ><i class="ph ph-caret-right mr-2 text-brand-DEFAULT"></i> Sản
              Phẩm</a
            >
          </li>
          <li>
            <a
              href="${pageContext.request.contextPath}/contact.html"
              class="text-sm text-gray-400 hover:text-brand-light transition-colors flex items-center pr-2"
              ><i class="ph ph-caret-right mr-2 text-brand-DEFAULT"></i> Liên
              Hệ</a
            >
          </li>
          <li>
            <a
              href="${pageContext.request.contextPath}/checkout.html"
              class="text-sm text-gray-400 hover:text-brand-light transition-colors flex items-center pr-2"
              ><i class="ph ph-caret-right mr-2 text-brand-DEFAULT"></i> Dịch
              Vụ</a
            >
          </li>
        </ul>
      </div>

      <!-- Subscribe -->
      <div class="space-y-4">
        <h4 class="text-lg font-semibold text-white tracking-wide">
          Nhận Thông Báo
        </h4>
        <p class="text-sm text-gray-400">
          Đăng ký để nhận các chương trình khuyến mãi và kiến thức dinh dưỡng
          mới nhất.
        </p>
        <form action="#" class="mt-4 sm:flex sm:max-w-md">
          <label for="email-address" class="sr-only">Địa chỉ Email</label>
          <div class="relative flex-grow">
            <i
              class="ph ph-envelope-simple absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 text-lg"
            ></i>
            <input
              type="email"
              name="email-address"
              id="email-address"
              autocomplete="email"
              required
              class="appearance-none min-w-0 w-full bg-gray-900 border border-gray-700/50 rounded-xl pl-10 text-sm py-2.5 px-4 text-gray-200 placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-brand-DEFAULT focus:border-transparent transition-all"
              placeholder="Nhập Email Của Bạn"
            />
          </div>
          <div class="mt-3 rounded-md sm:mt-0 sm:ml-3 sm:flex-shrink-0">
            <button
              type="submit"
              class="w-full flex items-center justify-center bg-brand-DEFAULT border border-transparent rounded-xl py-2.5 px-5 text-sm font-medium text-white hover:bg-brand-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-brand-DEFAULT focus:ring-offset-gray-900 transition-all active:scale-95"
            >
              Gửi <i class="ph ph-paper-plane-right ml-2"></i>
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</footer>
