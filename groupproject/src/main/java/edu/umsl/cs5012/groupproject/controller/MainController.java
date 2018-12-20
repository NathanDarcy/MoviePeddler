package edu.umsl.cs5012.groupproject.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import edu.umsl.cs5012.groupproject.form.OrderForm;
import edu.umsl.cs5012.groupproject.form.OrderFormItem;
import edu.umsl.cs5012.groupproject.form.UserLoginForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import edu.umsl.cs5012.groupproject.entity.Address;
import edu.umsl.cs5012.groupproject.entity.Order;
import edu.umsl.cs5012.groupproject.entity.OrderItem;
import edu.umsl.cs5012.groupproject.entity.Product;
import edu.umsl.cs5012.groupproject.entity.User;
import edu.umsl.cs5012.groupproject.form.UserRegistrationForm;
import edu.umsl.cs5012.groupproject.repo.OrderRepository;
import edu.umsl.cs5012.groupproject.repo.ProductRepository;
import edu.umsl.cs5012.groupproject.repo.UserRepository;

@Controller
public class MainController {

	public final static String VIEW_BASE = "_base";

	@Autowired
	private HttpSession session;

	@Autowired
	private ProductRepository productRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private OrderRepository orderRepository;

	/**
	 * Default redirector method. Redirects to user to the login page.
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping({ "/", "" })
	public RedirectView redirectToHomePage(Model model) {

		return new RedirectView("/homepage", true);
	}

	/**
	 * Navigates the user to the home page.
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/homepage")
	public ModelAndView navToHomePage(Model model) {
		model.addAttribute("view", "home.jsp");
		return new ModelAndView(VIEW_BASE);
	}

	/**
	 * Navigates the user to the login page.
	 * 
	 * @param userLoginForm
	 * @param model
	 * @return
	 */
	@RequestMapping("/loginpage")
	public ModelAndView navToLoginPage(@ModelAttribute("loginForm") UserLoginForm userLoginForm, Model model) {
		model.addAttribute("view", "login.jsp");
		return new ModelAndView(VIEW_BASE);
	}

	/**
	 * Navigates the user to the orderhistorypage, a list of Orders stored in the
	 * model.
	 * 
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping("/orderhistorypage")
	public ModelAndView navToOrderHistoryPage(@SessionAttribute(value="user", required=false) User user, Model model) {
		if(session.getAttribute("user")==null) {
			return new ModelAndView("redirect:/");
		}
		List<Order> orders = orderRepository.findAllByUserIdOrderByOrderDate(user.getId());
		model.addAttribute("orders", orders);
		model.addAttribute("view", "order-history.jsp");
		return new ModelAndView(VIEW_BASE);
	}

	/**
	 * Navigates the user to the Order History Detail Page, with the order loaded
	 * into the model.
	 * 
	 * @param orderid
	 * @param model
	 * @return
	 */
	@RequestMapping("/orderhistorydetailpage")
	public ModelAndView navToOrderHistoryDetailPage(@RequestParam("orderid") Integer orderid, Model model) {
		if(session.getAttribute("user")==null) {
			return new ModelAndView("redirect:/");
		}
		Order order = orderRepository.findById(orderid).orElse(null);
		model.addAttribute("order", order);
		model.addAttribute("view", "order-history-detail.jsp");
		return new ModelAndView(VIEW_BASE);
	}

	/**
	 * navigates the user to the main Product listing page, with the full list of
	 * products stored in the model.
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/productlistingpage")
	public ModelAndView navToProductListingPage(Model model) {
		if(session.getAttribute("user")==null) {
			return new ModelAndView("redirect:/");
		}
		Iterator<Product> productIter = productRepository.findAll().iterator();
		List<Product> products = new ArrayList<>();
		while (productIter.hasNext()) {
			products.add(productIter.next());
		}

		model.addAttribute("products", products);
		model.addAttribute("view", "product-listing.jsp");
		return new ModelAndView(VIEW_BASE);
	}

	/**
	 * Navigates the user to the Register page.
	 * 
	 * @param userregistrationform
	 * @param model
	 * @return
	 */
	@RequestMapping("/registerpage")
	public ModelAndView navToRegisterPage(@ModelAttribute("registrationform") UserRegistrationForm userregistrationform,
			Model model) {
		model.addAttribute("view", "register.jsp");
		return new ModelAndView(VIEW_BASE);
	}

	/**
	 * Navigates the user to the Shopping Cart Page. The OrderForm is populated with
	 * items from the shopping cart and sent back to the JSP.
	 * 
	 * @param orderform
	 * @param model
	 * @return
	 */
	@RequestMapping("/shoppingcartpage")
	public ModelAndView navToShoppingCartPage(@ModelAttribute("orderform") OrderForm orderform, Model model) {
		if(session.getAttribute("user")==null) {
			return new ModelAndView("redirect:/");
		}
		ShoppingCart shoppingcart = getShoppingCartFromSession();
		for (ShoppingCartItem item : shoppingcart.getShoppingCartItems()) {
			OrderFormItem oi = new OrderFormItem();
			oi.setPartnumber(item.getProduct().getPartnumber());
			oi.setQuantity(item.getQuantity());
			oi.setImage(item.getProduct().getImage());
			oi.setName(item.getProduct().getName());
			orderform.getOrderItems().add(oi);
		}

		model.addAttribute("view", "shopping-cart.jsp");
		return new ModelAndView(VIEW_BASE);
	}

	/**
	 * Allows a user to register on the site. The UserRegistrationForm contains the
	 * user data, which is converted to a User entity, and stored. If the user has
	 * chosen a username with already exists, the user is forwarded back to the
	 * regisiter page with an error message stating as much.
	 * 
	 * Upon successful registration, the user is redirected back to the login page.
	 * 
	 * @param userregistrationform
	 * @param bindingResult
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView processRegistration(
			@Valid @ModelAttribute("registrationform") UserRegistrationForm userregistrationform,
			BindingResult bindingResult, Model model) {
		System.out.println("registering user:");
		System.out.println("firstName=" + userregistrationform.getFirstname());

		// if the form validation failed, send the user back to the registration page
		// so that the errors can be fixed.
		if (bindingResult.hasErrors()) {
			model.addAttribute("view", "register.jsp");
			return new ModelAndView(VIEW_BASE);
		}

		// check if the login id already exists.
		String loginId = userregistrationform.getLoginid();
		User user = userRepository.findByLoginId(loginId);
		if (user != null) {
			// the loginid already exists.
			// send the user back to the registration page and show the error.
			bindingResult.addError(new FieldError("registrationform", "loginid", "This loginid is already used."));
			model.addAttribute("view", "register.jsp");
			return new ModelAndView(VIEW_BASE);
		}

		// the loginid doesn't currently exist.
		// create a User object from the UserRegistrationForm
		// then save it using the userRepository;
		user = new User();
		user.setLoginId(userregistrationform.getLoginid());
		user.setPassword(userregistrationform.getPassword());
		Address address = new Address();
		address.setFirstname(userregistrationform.getFirstname());
		address.setLastname(userregistrationform.getLastname());
		address.setAddress(userregistrationform.getAddress());
		address.setCity(userregistrationform.getCity());
		address.setState(userregistrationform.getState());
		address.setZip(userregistrationform.getZipcode());

		user.setAddress(address);
		userRepository.save(user);

		model.addAttribute("view", "register.jsp");
		return new ModelAndView("redirect:/loginpage?registrationsuccess=1");

	}

	/**
	 * Allows the user to logout of the site. The http session is invalidated, and
	 * the user is redirected to the login page.
	 * 
	 * @return
	 */
	@RequestMapping(value = "/logout")
	public ModelAndView processLogout() {
		session.removeAttribute("user");
		session.invalidate();
		return new ModelAndView("redirect:/loginpage");
	}

	/**
	 * Allows the user to login with username/password credentials. If the login is
	 * successful, the User entity is stored in the session, and the user is
	 * redirected to the Products Listing page. If the login is unsuccessful, the
	 * user is sent back to the login page with an error condition set.
	 * 
	 * @param userLoginForm
	 * @param bindingResult
	 * @param model
	 * @param loginid
	 * @param password
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView processLogin(@Valid @ModelAttribute("loginForm") UserLoginForm userLoginForm,
			BindingResult bindingResult, Model model, @RequestParam String loginid, @RequestParam String password) {

		User user = userRepository.findByLoginIdAndPassword(loginid, password);

		if (user == null) {
			// Display error, as login and pass did not match
			model.addAttribute("LoginError", "Username/Password was not found.");
			model.addAttribute("view", "login.jsp");
			// How to redirect with error here?
			return new ModelAndView(VIEW_BASE);
		}
		System.out.println("UserId and Password match.");

		// store the user object in the session. Session = repo?
		session.setAttribute("user", user);
		//ensure the user has a shopping cart in the session
		putShoppingCartInSession(new ShoppingCart());
		// if user credentials are found, send to productlistingpage
		return new ModelAndView("redirect:/productlistingpage");
	}

	/**
	 * Navigates to the Product Detail map to allow the user to see the details. If
	 * the product has previously added to the shopping cart, the ShoppingCartItem
	 * is added to model for display on the JSP.
	 * 
	 * @param partnumber
	 * @param model
	 * @return
	 */
	@RequestMapping("/viewProductDetails")
	@ResponseBody
	public ProductDetailDto viewProductDetails(@RequestParam String partnumber, Model model) {
		if(session.getAttribute("user")==null) {
			return null;
		}
		Product product = productRepository.findByPartnumber(partnumber);
		model.addAttribute("product", product);
		ShoppingCart shoppingCart = getShoppingCartFromSession();
		model.addAttribute("shoppingcartitem", shoppingCart.findItem(partnumber));
		model.addAttribute("view", "product_detail.jsp");
		
		ProductDetailDto dto = new ProductDetailDto();
		dto.setProductid(product.getId());
		dto.setPartnumber(product.getPartnumber());
		dto.setPrice(product.getPrice());
		dto.setName(product.getName());
		dto.setImage(product.getImage());
		dto.setPlot(product.getPlot());
		dto.setRated(product.getRated());
		dto.setYear(product.getYear());
		ShoppingCartItem item = shoppingCart.findItem(partnumber);
		dto.setQuantity(item==null?0:item.getQuantity());
		
		return dto;

	}

	/**
	 * Allows the user to update the quantity of an item in the shopping cart.
	 * 
	 * @param partnumber
	 * @param quantity
	 * @param model
	 * @return
	 */
	@RequestMapping("/updateShoppingCartItem")
	public ModelAndView updateShoppingCartItem(String partnumber, Integer quantity, Model model) {
		if(session.getAttribute("user")==null) {
			return new ModelAndView("redirect:/");
		}
		ShoppingCart shoppingCart = getShoppingCartFromSession();
		Product product = productRepository.findByPartnumber(partnumber);
		shoppingCart.addProduct(product, quantity);
		return new ModelAndView("redirect:/productlistingpage");
	}

	/**
	 * Allows the user to submit an order. Items from the shopping cart are
	 * converted into OrderItems, and added to a new Order. The order is then
	 * persisted into the database.
	 * 
	 * @param user
	 * @param orderform
	 * @param model
	 * @return
	 */
	@RequestMapping("/submitOrder")
	public ModelAndView submitOrder(@SessionAttribute("user") User user,
			@ModelAttribute("orderform") OrderForm orderform, Model model) {

		if(session.getAttribute("user")==null) {
			return new ModelAndView("redirect:/");
		}
		List<OrderFormItem> orderFormItems = orderform.getOrderItems();
		Order order = new Order();
		float totalPrice = 0.0f;
		for (OrderFormItem ofi : orderFormItems) {
			Product product = productRepository.findByPartnumber(ofi.getPartnumber());
			OrderItem oi = new OrderItem();
			oi.setProduct(product);
			oi.setQuantity(ofi.getQuantity());
			oi.setTotalPrice(oi.getQuantity() * product.getPrice());
			order.addOrderItems(oi);
			totalPrice += oi.getTotalPrice();
		}
		order.setOrderDate(new Date());
		order.setTotalPrice(totalPrice);
		order.setUser(user);
		order = orderRepository.save(order);

		// clear the shopping cart
		getShoppingCartFromSession().clearShoppingCart();

		System.out.println("orderItems = " + orderform);

		return new ModelAndView("redirect:/orderhistorydetailpage?orderid=" + order.getId());
	}

	/**
	 * Convenience method to retrieve the shopping cart from the session. If a
	 * shopping cart doesn't exist in the session, a new one is created and stored.
	 * 
	 * @return
	 */
	private ShoppingCart getShoppingCartFromSession() {
		ShoppingCart cart = (ShoppingCart) session.getAttribute("shoppingcart");
		if (cart == null) {
			cart = new ShoppingCart();
			putShoppingCartInSession(cart);
		}
		return cart;
	}

	/**
	 * Convenience method to put the shopping cart into the session.
	 * 
	 * @param cart
	 */
	private void putShoppingCartInSession(ShoppingCart cart) {
		session.setAttribute("shoppingcart", cart);

	}

}
