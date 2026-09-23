<%@ page pageEncoding="utf-8"%>

<!-- Contact Section -->
<section class="py-12 md:py-20 bg-white overflow-hidden">
    <div class="container mx-auto px-4">
        <div class="text-center mb-16 animate__animated animate__fadeInUp">
            <h2 class="text-3xl md:text-5xl font-bold text-slate-800 mb-6">Liên Hệ Với Chúng Tôi</h2>
            <div class="w-24 h-1 bg-primary-600 mx-auto rounded-full mb-6"></div>
            <p class="text-slate-500 max-w-2xl mx-auto font-light leading-relaxed">
                Chúng tôi luôn sẵn sàng lắng nghe và giải đáp mọi thắc mắc của bạn về sản phẩm và dịch vụ.
            </p>
        </div>

        <div class="flex flex-col lg:flex-row gap-12 items-center">
            
            <!-- Left: Interactive Map -->
            <div class="w-full lg:w-1/2 animate__animated animate__fadeInLeft">
                <div class="relative group">
                    <div class="absolute -inset-4 bg-primary-100 rounded-[3rem] blur-2xl opacity-50 group-hover:opacity-100 transition duration-1000"></div>
                    <div class="relative bg-white p-2 rounded-[2.5rem] premium-shadow border border-slate-100 overflow-hidden">
                        <iframe
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.961668357328!2d105.76448121431841!3d21.034219692969184!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x313454bee40409db%3A0xac6ab720d3555559!2zSMOgbSBOZ2hpLCBN4bu5IMSQw6xuaCAyLCBU4burIExpw6ptLCBIw6AgTuG7mWksIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1497626759672"
                            class="w-full h-[450px] rounded-[2rem] border-none"
                            allowfullscreen="" loading="lazy"></iframe>
                    </div>
                </div>
            </div>

            <!-- Right: Contact Info -->
            <div class="w-full lg:w-1/2 animate__animated animate__fadeInRight space-y-10 lg:pl-10">
                <div class="space-y-4 text-center lg:text-left">
                    <h3 class="text-3xl font-bold text-slate-800 tracking-tight">
                        <span class="text-primary-600">Shop Milk</span> - Vì Sức Khỏe Cộng Đồng
                    </h3>
                    <p class="text-slate-500 font-light italic">Sứ mệnh mang dòng sữa sạch đến mọi gia đình.</p>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-1 gap-6">
                    <!-- Address -->
                    <div class="flex items-start p-6 bg-slate-50 rounded-3xl border border-slate-100 transition-all hover:bg-white hover:premium-shadow group">
                        <div class="bg-primary-600 p-3 rounded-2xl text-white mr-4 shadow-lg shadow-primary-200">
                            <i data-lucide="map-pin" class="w-6 h-6"></i>
                        </div>
                        <div>
                            <p class="text-[10px] uppercase font-bold text-slate-400 tracking-widest mb-1">Địa chỉ</p>
                            <p class="text-slate-700 font-medium">Ngõ 58 Trần Bình, Mai Dịch, Cầu Giấy, Hà Nội</p>
                        </div>
                    </div>

                    <!-- Phone -->
                    <div class="flex items-start p-6 bg-slate-50 rounded-3xl border border-slate-100 transition-all hover:bg-white hover:premium-shadow group">
                        <div class="bg-green-600 p-3 rounded-2xl text-white mr-4 shadow-lg shadow-green-200">
                            <i data-lucide="phone-call" class="w-6 h-6"></i>
                        </div>
                        <div>
                            <p class="text-[10px] uppercase font-bold text-slate-400 tracking-widest mb-1">Điện thoại</p>
                            <p class="text-slate-700 font-bold text-lg">0396 275 692</p>
                        </div>
                    </div>

                    <!-- Email -->
                    <div class="flex items-start p-6 bg-slate-50 rounded-3xl border border-slate-100 transition-all hover:bg-white hover:premium-shadow group">
                        <div class="bg-blue-600 p-3 rounded-2xl text-white mr-4 shadow-lg shadow-blue-200">
                            <i data-lucide="mail" class="w-6 h-6"></i>
                        </div>
                        <div>
                            <p class="text-[10px] uppercase font-bold text-slate-400 tracking-widest mb-1">Email</p>
                            <p class="text-slate-700 font-medium">nhom4@gmail.com</p>
                        </div>
                    </div>
                </div>

                <!-- Social Links -->
                <div class="pt-6 flex justify-center lg:justify-start space-x-4">
                    <a href="#" class="w-12 h-12 bg-slate-100 rounded-2xl flex items-center justify-center hover:bg-primary-600 hover:text-white transition-all duration-300">
                        <i data-lucide="facebook" class="w-6 h-6"></i>
                    </a>
                    <a href="#" class="w-12 h-12 bg-slate-100 rounded-2xl flex items-center justify-center hover:bg-primary-600 hover:text-white transition-all duration-300">
                        <i data-lucide="instagram" class="w-6 h-6"></i>
                    </a>
                    <a href="#" class="w-12 h-12 bg-slate-100 rounded-2xl flex items-center justify-center hover:bg-primary-600 hover:text-white transition-all duration-300">
                        <i data-lucide="youtube" class="w-6 h-6"></i>
                    </a>
                </div>
            </div>

        </div>
    </div>
</section>

<script>
    lucide.createIcons();
</script>