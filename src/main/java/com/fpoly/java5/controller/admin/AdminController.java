package com.fpoly.java5.controller.admin;

import com.fpoly.java5.helper.ProductHelper;
import com.fpoly.java5.model.entity.Product;
import com.fpoly.java5.model.entity.User;
import com.fpoly.java5.repo.CategoryRepository;
import com.fpoly.java5.repo.ProductRepository;
import com.fpoly.java5.repo.SessionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("admin")
public class AdminController {
    @Autowired
    CategoryRepository categoryDAO;
    @Autowired
    ProductRepository productDAO;
    @Autowired
    SessionRepository session;

    ProductHelper productHelper = new ProductHelper();

    @GetMapping({"", "index"})
    public String index(Model model, @RequestParam Optional<String> txtSearch, @RequestParam("soTrang") Optional<String> soTrangString, @RequestParam("message") Optional<Boolean> message) {
        List<Product> list = new ArrayList<>();
        User user = (User) session.get("user");
//        if (!user.isAdmin()) {
//            String error = "Ban ko phai la admin";
//            return "redirect:/login?error=" + error;
//        }
        model.addAttribute("sessionAdmin", user);
        if (txtSearch.isPresent()) {
            list = productDAO.findByName(txtSearch.get());
        } else {
            int soTrang = soTrangString.isEmpty() ? 1 : Integer.parseInt(soTrangString.get());
            model.addAttribute("soTrangHienTai", soTrang);
            int soSanPham = 6;
            model.addAttribute("soSanPhamHienNghi", soSanPham);
            int tongSoTrang = productHelper.getTotalPage(soSanPham,productDAO.findAll());
            model.addAttribute("tongSoTrang",tongSoTrang);
            // Trang số "soTrang-1", số sản phẩm hiển thị "soSanPham"
            Pageable pageable = PageRequest.of(soTrang-1,soSanPham);
            Page<Product> pageProduct = productDAO.findAll(pageable);
            list= pageProduct.getContent();
        }
        model.addAttribute("listProduct",list);
        User user1 = (User) session.get("userAdmin");
        if (user1 !=null){
            model.addAttribute("sessionUsername",user1);
        }
        if (message.isPresent()){
            if (message.get()){
                model.addAttribute("message","Xóa thành công");
            }else{
                model.addAttribute("message","Xóa thất bại");
            }
        }
        return "admin/index";
    }

    @GetMapping("index/update")
    public String showUpdate(Model model, @RequestParam("idProduct") Optional<String> idProductString,
                             @RequestParam("message") Optional<Boolean> message) {
        String idProduct = idProductString.isEmpty() ? null : idProductString.get();
        Product product = productDAO.findById(idProduct).get();
        model.addAttribute("productItem",product);
        model.addAttribute("listCategory", categoryDAO.findAll());
        if (message.isPresent()){
            if (message.get()){
                model.addAttribute("message","lưu thành công");
            }else{
                model.addAttribute("message","lưu thất bại");
            }
        }
        return "admin/update";
    }

    public boolean listIsNullOrEmpty(List<Optional<String>> list) {
        return (list.isEmpty()|| list==null)?true:false;
    }
    @PostMapping("index/update")
    public String update(Model model, @RequestParam("id") String idString, @RequestParam("name")String nameString,
                         @RequestParam("price") Optional<String> priceString, @RequestParam("description") String descriptionString,
                         @RequestParam("quantity") Optional<String> quantityString, @RequestParam("category_id") String cateIdString, HttpServletRequest req) throws IOException, ServletException{
        String tenHinhAnh= productHelper.uploadImage(req).equals("") ? req.getParameter("hinhAnhTonTai"): productHelper.uploadImage(req);
        boolean message = true;
        List<Optional<String>> list = new ArrayList<>();
        list.add(quantityString);
        list.add(priceString);

        if (!listIsNullOrEmpty(list)){
            Product product = productDAO.findById(idString).orElseThrow();
            product.setName(nameString);
            product.setPrice(Double.parseDouble(priceString.get()));
            product.setQuantity(Integer.parseInt(quantityString.get()));
            product.setDescription(descriptionString);
            product.setCategoryId(String.valueOf(categoryDAO.findById(cateIdString)));
            product.setImg(tenHinhAnh);
            message=true;
        }else {
            message =false;
        }
        return "redirect:/admin/index/update?id="+idString+"&message"+message;
    }
}
