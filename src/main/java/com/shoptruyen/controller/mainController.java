package com.shoptruyen.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shoptruyen.test;
import com.shoptruyen.DTOs.ResponseDTOs;
import com.shoptruyen.entities.Order;
import com.shoptruyen.entities.OrderDetail;
import com.shoptruyen.entities.OrderDetailId;
import com.shoptruyen.entities.Product;
import com.shoptruyen.entities.User;
import com.shoptruyen.service.CategoryService;
import com.shoptruyen.service.OrderDetailService;
import com.shoptruyen.service.OrderService;
import com.shoptruyen.service.ProductService;
import com.shoptruyen.service.UserService;

@Controller
public class mainController {

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private ProductService productService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private OrderDetailService detailService;

	@Autowired
	UserService userService;

	@RequestMapping(value = { "/", "/home" })
	public String index(ModelMap model) {
		model.addAttribute("categories", categoryService.findAll());
		// model.addAttribute("bestSeller", productService.getByBestSeller(4));
		model.addAttribute("mostViews", productService.getByMostViews(8));
		return "index";
	}

	@RequestMapping("/allProduct")
	public String product(ModelMap model) {
		model.addAttribute("categories", categoryService.findAll());
		model.addAttribute("products", productService.findAll());
		return "product";
	}

	@GetMapping("/search")
	public String search(ModelMap model, @RequestParam("searchValue") String value) {
		model.addAttribute("categories", categoryService.findAll());
		if (productService.search(value).size() > 0) {
			model.addAttribute("products", productService.search(value));
		}
		return "product";
	}

	@GetMapping("/searchProduct")
	public String productFilter(ModelMap model, HttpServletRequest request) {

		String priceRange = request.getParameter("priceRange");
		String categoryID = request.getParameter("cateID");

		int id = 0;
		if (categoryID != null) {
			id = Integer.parseInt(categoryID);
		}
		model.addAttribute("categoryID", categoryID);
		model.addAttribute("categories", categoryService.findAll());

		long[] price = null;
		if (priceRange != null) {
			price = test.getPrice(priceRange);
		}
		try {
			if (categoryID == null) {
				model.addAttribute("priceValue1", price[0]);
				model.addAttribute("priceValue2", price[1]);
				if (productService.SearchByPriceRange(price[0], price[1]).size() > 0) {
					model.addAttribute("products", productService.SearchByPriceRange(price[0], price[1]));
				}
			} else if (priceRange == null) {
				if (productService.searchByCateID(id).size() > 0) {
					model.addAttribute("products", productService.searchByCateID(id));
				}
			} else if (categoryID != null && priceRange != null) {
				model.addAttribute("priceValue1", price[0]);
				model.addAttribute("priceValue2", price[1]);
				if (productService.SearchByCateAndPriceRange(id, price[0], price[1]).size() > 0) {
					model.addAttribute("products", productService.SearchByCateAndPriceRange(id, price[0], price[1]));
				}
			}
		} catch (NullPointerException e) {
			System.out.println(e.toString());
		}
		return "product";
	}

	@GetMapping("/productDetail")
	public String productDetail(ModelMap model, @RequestParam("cateID") int cateID,
			@RequestParam("productID") int productID) {
		model.addAttribute("product", productService.findById(productID));
		model.addAttribute("relatedProducts", productService.searchByCateID(cateID));
		return "productDetail";
	}

	@GetMapping("/order")
	public String testLoad(ModelMap model) {
		model.addAttribute("orderForm", new Order());
		model.addAttribute("orderDetailForm", new OrderDetail());
		return "checkout";
	}

	@PostMapping("/order")
	public org.springframework.http.ResponseEntity<String> addOrder(@ModelAttribute("orderForm") Order order,
			ModelMap model, HttpServletRequest request) {
		if (order.getPhoneNumber() == null || !order.getPhoneNumber().matches("0[0-9]{9}")) {
            return org.springframework.http.ResponseEntity.badRequest().body("Số điện thoại phải gồm đúng 10 chữ số và bắt đầu bằng 0.");
        }
        String customerName = order.getCustomerName() == null ? "" : order.getCustomerName().strip();
        String address = order.getAddress() == null ? "" : order.getAddress().strip();
        if (customerName.length() < 2 || customerName.length() > 50
                || !customerName.matches("[\\p{L}\\p{M}]+(?:[ '’.-][\\p{L}\\p{M}]+)*")) {
            return org.springframework.http.ResponseEntity.badRequest().body("Họ tên phải từ 2 đến 50 ký tự, không chứa số hoặc ký tự không hợp lệ.");
        }
        if (address.length() < 10 || address.length() > 255
                || !java.util.regex.Pattern.compile("[\\p{L}\\p{N}]").matcher(address).find()) {
            return org.springframework.http.ResponseEntity.badRequest().body("Địa chỉ phải từ 10 đến 255 ký tự và không chỉ gồm ký tự đặc biệt.");
        }
        order.setCustomerName(customerName);
        order.setAddress(address);
        // Validate cart & stock BEFORE creating the order
		int noProduct = Integer.parseInt(request.getParameter("noProductInCart"));
        if (noProduct <= 0) return org.springframework.http.ResponseEntity.badRequest().body("Giỏ hàng đang trống");
		for (int i = 1; i <= noProduct; i++) {
			Product product = productService.findByName(request.getParameter("productName" + i));
			if (product == null) {
				throw new org.springframework.web.server.ResponseStatusException(
						org.springframework.http.HttpStatus.BAD_REQUEST,
						"Sản phẩm không tồn tại");
			}
			int noProductInCart = Integer.parseInt(request.getParameter("productQuantity" + i));
			if (product.getQuantity() < noProductInCart) {
				throw new org.springframework.web.server.ResponseStatusException(
						org.springframework.http.HttpStatus.BAD_REQUEST,
						"Số lượng sản phẩm trong kho không đủ");
			}
		}

		order.setDate(new Date());
		orderService.save(order);

		for (int i = 1; i <= noProduct; i++) {
			Product product = productService.findByName(request.getParameter("productName" + i));
			int noProductInCart = Integer.parseInt(request.getParameter("productQuantity" + i));

			product.setQuantity(product.getQuantity() - noProductInCart);
			productService.update(product);

			long total = product.getPrice() * noProductInCart;
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setId(new OrderDetailId(order.getId(), product.getId()));
			orderDetail.setOrder(order);
			orderDetail.setProduct(product);
			orderDetail.setQuantity(noProductInCart);
			orderDetail.setAmount(total);
			detailService.save(orderDetail);
		}

		return org.springframework.http.ResponseEntity.ok("OK");
	}

	@GetMapping("/contact")
	public String contact() {
		return "contact";
	}

	@GetMapping("/khuyenmai")
	public String khuyenmai() {
		return "contact2";
	}

	@GetMapping({"/goc-doc-truyen", "/dinhduong"})
	public String dinhduong() {
		return "contact3";
	}

	@GetMapping("/login")
	public String login() {
		return "login";
	}

	// @PostMapping("/login")

	// phần controller xử lý đăng ký tài khoản.

	// controller này trả về view khi có request đến /register
	@RequestMapping(value = { "/register" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		// ResponseDTOs res = new ResponseDTOs("301","Email đã tồn tại");
		// model.addAttribute("res", res);
		User userEntity = new User();
		model.addAttribute("ac", userEntity);
		return "register";// tên của file jsp trong thư mục view }
	}

	// controller này xử lý khi người dùng bấm đăng ký. Nó sẽ post lên server 1
	// model, với các trường trùng với UserEntity dựa vào các past trong view. ex :
	// path="password"
	@RequestMapping(value = { "/save-ac" }, method = RequestMethod.POST)
	public String saveAc(@ModelAttribute("ac") User ac, final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		// test xem lấy đc dữ liệu
		// System.out.println(ac.getFirstName());
		// System.out.println(userService.addUser(ac));
		if (!userService.addUser(ac)) {

			ResponseDTOs res = new ResponseDTOs("301", "Email đã tồn tại");
			User userEntity = new User();
			model.addAttribute("ac", userEntity);
			model.addAttribute("res", res);

			return "register";
		} else {

			return "login";
		}

	}

}