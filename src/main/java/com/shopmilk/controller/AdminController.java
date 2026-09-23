package com.shopmilk.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shopmilk.entities.Category;
import com.shopmilk.entities.Order;
import com.shopmilk.entities.Product;
import com.shopmilk.service.CategoryService;
import com.shopmilk.service.OrderDetailService;
import com.shopmilk.service.OrderService;
import com.shopmilk.service.ProductService;
import com.shopmilk.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private ProductService productService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private OrderDetailService detailService;

	@Autowired
	private UserService userService;

	// =========================================================
	// DASHBOARD
	// =========================================================
	@Autowired
	private javax.persistence.EntityManager em;

	@javax.annotation.PostConstruct
	@org.springframework.transaction.annotation.Transactional
	public void fixDb() {
		try {
			em.createNativeQuery("ALTER TABLE `order` MODIFY COLUMN status INT(11) NOT NULL DEFAULT 0").executeUpdate();
		} catch(Exception e) {}
	}

	@GetMapping("")
	public String index(ModelMap model) {
		// Stat boxes
		model.addAttribute("totalProducts", productService.countProducts());
		model.addAttribute("totalUsers", userService.countUsers());
		model.addAttribute("pendingOrders", orderService.countByStatus(0));
		model.addAttribute("shippingOrders", orderService.countByStatus(1));
		model.addAttribute("completedOrders", orderService.countByStatus(2));
		model.addAttribute("cancelledOrders", orderService.countByStatus(3));

		// Doanh thu tháng: [[month, revenue], ...]
		List<Object[]> rawRevenue = orderService.getMonthlyRevenue();
		long[] revenueByMonth = new long[12];
		for (Object[] row : rawRevenue) {
			int month = ((Number) row[0]).intValue() - 1; // 0-indexed
			long rev = ((Number) row[1]).longValue();
			revenueByMonth[month] = rev;
		}
		model.addAttribute("revenueByMonth", revenueByMonth);

		// Đơn hàng gần đây (10 đơn mới nhất - status=0)
		model.addAttribute("recentOrders", orderService.getNewOrder());

		// Top sản phẩm bán chạy (top 5)
		model.addAttribute("topSellers", productService.getByBestSeller(5));

		return "ad_index";
	}

	// =========================================================
	// CATEGORY
	// =========================================================
	@GetMapping("/categoryManager")
	public String category(ModelMap model) {
		model.addAttribute("categories", categoryService.findAll());
		return "categoryManager";
	}

	@GetMapping("/category/{id}/delete")
	public String deleteCategory(@PathVariable int id, ModelMap model) {
		categoryService.delete(id);
		return "redirect:/admin/categoryManager";
	}

	@GetMapping("/addCategory")
	public String addCategory(ModelMap model) {
		model.addAttribute("categoryForm", new Category());
		return "formCategory";
	}

	@RequestMapping(value = "/categoryManager/save", method = RequestMethod.POST)
	public String saveCategory(ModelMap model, @ModelAttribute("categoryForm") Category category,
			BindingResult validateForm) {
		if (category.getName() == null || category.getName().trim().length() == 0) {
			validateForm.rejectValue("name", "category", "Vui lòng nhập tên!");
		}
		if (validateForm.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa lỗi!");
			return "formCategory";
		} else {
			model.addAttribute("message", "Thêm mới thành công!");
			categoryService.save(category);
		}
		return "redirect:/admin/categoryManager";
	}

	@GetMapping("/editCategory")
	public String updateCategory(ModelMap model, @RequestParam("cateID") int id) {
		model.addAttribute("categoryForm", categoryService.findById(id));
		return "formUpdateCategory";
	}

	@PostMapping("/saveChangeCategory")
	public String saveChangeCategory(ModelMap model, @Validated @ModelAttribute("categoryForm") Category category,
			BindingResult validateForm) {
		if (category.getName() == null || category.getName().trim().length() == 0) {
			validateForm.rejectValue("name", "category", "Vui lòng nhập tên!");
		}
		if (validateForm.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa lỗi!");
			return "formUpdateCategory";
		} else {
			Category existing = categoryService.findById(category.getId());
			if (existing != null) {
				existing.setName(category.getName());
				categoryService.save(existing);
			}
		}
		return "redirect:/admin/categoryManager";
	}

	// =========================================================
	// PRODUCT
	// =========================================================
	@GetMapping("/productManager")
	public String product(ModelMap model) {
		model.addAttribute("products", productService.findAll());
		return "productManager";
	}

	@GetMapping("/product/{id}/delete")
	public String deleteProduct(@PathVariable int id, RedirectAttributes redirectAttrs) {
		try {
			productService.delete(id);
			redirectAttrs.addFlashAttribute("toastSuccess", "Xóa sản phẩm thành công!");
		} catch (Exception e) {
			redirectAttrs.addFlashAttribute("toastError",
				"Không thể xóa sản phẩm này vì đã có trong đơn hàng. Hãy hủy các đơn hàng liên quan trước!");
		}
		return "redirect:/admin/productManager";
	}

	@GetMapping("/addProduct")
	public String addProduct(ModelMap model) {
		model.addAttribute("Categories", categoryService.findAll());
		model.addAttribute("productForm", new Product());
		return "formProduct";
	}

	@RequestMapping(value = "/productManager/save", method = RequestMethod.POST)
	public String saveProduct(ModelMap model, @ModelAttribute("productForm") Product product,
			BindingResult validateForm, HttpServletRequest request,
			@RequestParam(value = "category.id", required = false) Integer categoryId) {
		if (product.getName() == null || product.getName().trim().length() == 0) {
			validateForm.rejectValue("name", "product", "Vui lòng nhập tên!");
		}
		if (product.getPrice() < 0) {
			validateForm.rejectValue("price", "product", "Giá không nhỏ hơn 0!");
		}
		if (product.getQuantity() < 0) {
			validateForm.rejectValue("quantity", "product", "Số lượng không nhỏ hơn 0!");
		}
		if (product.getCategory() == null && categoryId == null) {
			validateForm.rejectValue("category", "product", "Vui lòng chọn danh mục!");
		}
		if (validateForm.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa lỗi!");
			model.addAttribute("Categories", categoryService.findAll());
			return "formProduct";
		} else {
			model.addAttribute("message", "Thêm mới thành công!");
			if (categoryId != null) {
				product.setCategory(categoryService.findById(categoryId));
			} else if (product.getCategory() != null && product.getCategory().getId() != null) {
				product.setCategory(categoryService.findById(product.getCategory().getId()));
			}
			String submittedImage = product.getImage();
			if (submittedImage != null && !submittedImage.trim().isEmpty()) {
				if (submittedImage.contains("fakepath")) {
					String fileName = submittedImage.substring(submittedImage.lastIndexOf("\\") + 1);
					product.setImage("static/images/phone/" + fileName);
				} else if (!submittedImage.startsWith("static/")) {
					product.setImage("static/images/phone/" + submittedImage);
				}
			} else {
				product.setImage("static/images/phone/default.jpg");
			}
			product.setViews(0); // initialize views
			productService.save(product);
		}
		return "redirect:/admin/productManager";
	}

	@GetMapping("/editProduct")
	public String updateProduct(ModelMap model, @RequestParam("proID") int id) {
		model.addAttribute("Categories", categoryService.findAll());
		model.addAttribute("productForm", productService.findById(id));
		return "formUpdateProduct";
	}

	@PostMapping("/saveChangeProduct")
	public String saveChangeProduct(ModelMap model, @ModelAttribute("productForm") Product product,
			BindingResult validateForm, HttpServletRequest request,
			@RequestParam(value = "category.id", required = false) Integer categoryId) {
		
		Product existing = productService.findById(product.getId());
		if (existing == null) {
			return "redirect:/admin/productManager";
		}

		if (product.getName() == null || product.getName().trim().length() == 0) {
			validateForm.rejectValue("name", "product", "Vui lòng nhập tên!");
		} else if (product.getName().length() > 50) {
			validateForm.rejectValue("name", "product", "Tên sản phẩm không được vượt quá 50 ký tự!");
		}
		if (product.getPrice() < 0) {
				validateForm.rejectValue("price", "product", "Giá không nhỏ hơn 0!");
			}
			if (product.getQuantity() < 0) {
				validateForm.rejectValue("quantity", "product", "Số lượng không nhỏ hơn 0!");
			}
			if (product.getCategory() == null && categoryId == null) {
				validateForm.rejectValue("category", "product", "Vui lòng chọn danh mục!");
			}

			if (validateForm.hasErrors()) {
				model.addAttribute("message", "Vui lòng sửa lỗi!");
				model.addAttribute("Categories", categoryService.findAll());
				return "formUpdateProduct";
			} else {
				existing.setName(product.getName());
				existing.setPrice(product.getPrice());
				existing.setQuantity(product.getQuantity());

				if (categoryId != null) {
					existing.setCategory(categoryService.findById(categoryId));
				} else if (product.getCategory() != null && product.getCategory().getId() != null) {
					existing.setCategory(categoryService.findById(product.getCategory().getId()));
				}

				// Handle image string correctly (browser sends fakepath if not multipart)
				String submittedImage = product.getImage();
				if (submittedImage != null && !submittedImage.trim().isEmpty()) {
					if (submittedImage.contains("fakepath")) {
						String fileName = submittedImage.substring(submittedImage.lastIndexOf("\\") + 1);
						existing.setImage("static/images/phone/" + fileName);
					} else if (!submittedImage.startsWith("static/")) {
						existing.setImage("static/images/phone/" + submittedImage);
					}
				}

				try {
					productService.save(existing);
				} catch (Exception e) {
					model.addAttribute("message", "Lỗi CSDL: Dữ liệu nhập vào không hợp lệ hoặc quá dài!");
					model.addAttribute("Categories", categoryService.findAll());
					return "formUpdateProduct";
				}
			}
		return "redirect:/admin/productManager";
	}

	// =========================================================
	// ORDER MANAGEMENT - 4 trạng thái
	// 0=Chờ xác nhận, 1=Đang giao, 2=Hoàn thành, 3=Hủy
	// =========================================================
	@GetMapping("/orderManager")
	public String orderManager(ModelMap model,
			@RequestParam(value = "status", required = false, defaultValue = "-1") int status) {
		if (status == -1) {
			model.addAttribute("orders", orderService.findAll());
			model.addAttribute("currentStatus", -1);
		} else {
			model.addAttribute("orders", orderService.getByStatus(status));
			model.addAttribute("currentStatus", status);
		}
		model.addAttribute("countPending", orderService.countByStatus(0));
		model.addAttribute("countShipping", orderService.countByStatus(1));
		model.addAttribute("countCompleted", orderService.countByStatus(2));
		model.addAttribute("countCancelled", orderService.countByStatus(3));
		return "orderManager";
	}

	// Giữ URL cũ để không bị lỗi 404
	@GetMapping("/orderManagerr")
	public String orderManagerOld(ModelMap model) {
		return "redirect:/admin/orderManager";
	}

	@GetMapping("/viewOrderDetail")
	public String viewOrderDetail(@RequestParam("orderID") int orderID, ModelMap model) {
		model.addAttribute("mode", "viewDetail");
		model.addAttribute("orderID", orderID);
		model.addAttribute("selectedOrder", orderService.findById(orderID));
		model.addAttribute("orderDetails", detailService.findByOrderID(orderID));
		
		// Load the background orders list and stats so the UI doesn't break
		model.addAttribute("orders", orderService.findAll());
		model.addAttribute("currentStatus", -1);
		model.addAttribute("countPending", orderService.countByStatus(0));
		model.addAttribute("countShipping", orderService.countByStatus(1));
		model.addAttribute("countCompleted", orderService.countByStatus(2));
		model.addAttribute("countCancelled", orderService.countByStatus(3));
		
		return "orderManager";
	}

	@PostMapping("/updateOrderStatus")
	public String updateOrderStatus(@RequestParam("orderID") int orderID,
			@RequestParam("orderStatus") int orderStatus) {
		Order order = orderService.findById(orderID);
		if (order != null) {
			order.setStatus(orderStatus);
			orderService.update(order);
		}
		return "redirect:/admin/orderManager";
	}

	// Tương thích cũ (boolean → int)
	@PostMapping("/checkedOrder")
	public String checkedOrder(HttpServletRequest request) {
		int orderID = Integer.parseInt(request.getParameter("orderID"));
		int orderStatus = Integer.parseInt(request.getParameter("orderStatus"));
		Order order = orderService.findById(orderID);
		if (order != null) {
			order.setStatus(orderStatus);
			orderService.update(order);
		}
		return "redirect:/admin/orderManager";
	}

	@PostMapping("/bulkUpdateOrderStatus")
	public String bulkUpdateOrderStatus(@RequestParam(value = "orderIds", required = false) List<Integer> orderIds,
			@RequestParam("bulkStatus") int bulkStatus) {
		if (orderIds != null && !orderIds.isEmpty()) {
			for (Integer id : orderIds) {
				Order order = orderService.findById(id);
				if (order != null) {
					order.setStatus(bulkStatus);
					orderService.update(order);
				}
			}
		}
		return "redirect:/admin/orderManager";
	}

	// =========================================================
	// USER MANAGEMENT
	// =========================================================
	@GetMapping("/userManager")
	public String userManager(ModelMap model) {
		model.addAttribute("users", userService.findAll());
		model.addAttribute("totalUsers", userService.countUsers());
		return "userManager";
	}

	@PostMapping("/updateUserRole")
	public String updateUserRole(@RequestParam("userId") int userId,
			@RequestParam("role") String role) {
		userService.updateRole(userId, role);
		return "redirect:/admin/userManager";
	}

	@GetMapping("/user/{id}/delete")
	public String deleteUser(@PathVariable int id) {
		userService.deleteUser(id);
		return "redirect:/admin/userManager";
	}

	// =========================================================
	// STATISTICS
	// =========================================================
	@GetMapping("/statistics")
	public String statistics(ModelMap model) {
		// Doanh thu theo tháng
		List<Object[]> rawRevenue = orderService.getMonthlyRevenue();
		long[] revenueByMonth = new long[12];
		for (Object[] row : rawRevenue) {
			int month = ((Number) row[0]).intValue() - 1;
			long rev = ((Number) row[1]).longValue();
			revenueByMonth[month] = rev;
		}
		model.addAttribute("revenueByMonth", revenueByMonth);

		// Thống kê trạng thái đơn hàng
		model.addAttribute("countPending", orderService.countByStatus(0));
		model.addAttribute("countShipping", orderService.countByStatus(1));
		model.addAttribute("countCompleted", orderService.countByStatus(2));
		model.addAttribute("countCancelled", orderService.countByStatus(3));

		List<Object[]> stockData = productService.getProductStockAndSold(10);
		List<String> productNames = new ArrayList<>();
		List<Long> stockList = new ArrayList<>();
		List<Long> soldList = new ArrayList<>();
		long totalStock = 0;
		long totalSold = 0;
		for (Object[] row : stockData) {
			productNames.add((String) row[1]);
			long stock = ((Number) row[2]).longValue();
			long sold = ((Number) row[3]).longValue();
			stockList.add(stock);
			soldList.add(sold);
			totalStock += stock;
			totalSold += sold;
		}
		model.addAttribute("productNames", productNames);
		model.addAttribute("stockList", stockList);
		model.addAttribute("soldList", soldList);
		model.addAttribute("sumStock", totalStock);
		model.addAttribute("sumSold", totalSold);

		// Tổng thống kê
		model.addAttribute("totalProducts", productService.countProducts());

		model.addAttribute("totalUsers", userService.countUsers());

		return "statistics";
	}

	// API JSON cho biểu đồ doanh thu (optional, cho AJAX)
	@GetMapping("/api/revenue")
	@ResponseBody
	public Map<String, Object> getRevenueData() {
		List<Object[]> rawRevenue = orderService.getMonthlyRevenue();
		long[] revenueByMonth = new long[12];
		for (Object[] row : rawRevenue) {
			int month = ((Number) row[0]).intValue() - 1;
			long rev = ((Number) row[1]).longValue();
			revenueByMonth[month] = rev;
		}
		Map<String, Object> data = new HashMap<>();
		data.put("revenue", revenueByMonth);
		return data;
	}
}
