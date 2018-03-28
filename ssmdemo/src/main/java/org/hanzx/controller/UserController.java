package org.hanzx.controller;

import org.hanzx.entity.User;
import org.hanzx.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userService;
    private String returnPrefix = "user/";

    @RequestMapping("getUser")
    public String getUser(Model model, Integer selectId){
        List<User> userList = userService.getUser(selectId);

        model.addAttribute("userList", userList);
        model.addAttribute("selectId", selectId);
        return returnPrefix + "user_list";
    }

}
