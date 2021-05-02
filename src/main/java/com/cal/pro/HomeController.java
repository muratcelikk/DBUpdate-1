package com.cal.pro;

import model.Carts;
import model.CategoryPro;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import util.DB;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Murat Çelik Pegamis
 */

@Controller
public class HomeController {

    DB db = new DB();

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Model model) {
        model.addAttribute("cartData", cartResult());
        return "home";
    }
    //Combo box
    public List<CategoryPro> cartResult() {
        List<CategoryPro> ls = new ArrayList<CategoryPro>();
        try {
            String query = "SELECT * FROM categories";
            PreparedStatement pre = db.connect(query);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int cid = rs.getInt("cid");
                String ctitle = rs.getString("ctitle");

                CategoryPro cat = new CategoryPro();
                cat.setCid(cid);
                cat.setCtitle(ctitle);

                ls.add(cat);
            }
        } catch (Exception e) {
            System.err.println("CartResult : " + e);
        }
        return ls;
    }
    //Insert
    @RequestMapping(value = "/cartInsert", method = RequestMethod.POST)
    public String cartInsert(Carts cr) { //Carts cr -->dependency injection sayesinde ekranda eklenen db yazılır.
        try {
            String query = "INSERT INTO `cart` (`crid`, `cname`, `csurname`, `cphone`, `cid`) VALUES (NULL, ?, ?, ?, ?)";
            PreparedStatement pre = db.connect(query);
            pre.setString(1, cr.getCname());
            pre.setString(2, cr.getCsurname());
            pre.setString(3, cr.getCphone());
            pre.setInt(4, cr.getCid());
            pre.executeUpdate();
        } catch (Exception e) {
            System.err.println("insert hatası : " + e);
        }
        return "redirect:/";
    }
}

