package pl.coderslab.app.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.app.model.User;
import pl.coderslab.app.service.UserService;

import javax.validation.Valid;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;


    @RequestMapping("/login")
    public String login(){
        return "login";
    }


    @RequestMapping("/registration")
    public String registrationGet(Model model){
        User user = new User();
        model.addAttribute("user", user);

        return "registration";
    }

    @PostMapping("/registration")
    public String registrationPOST(@Valid @ModelAttribute("user") User user, BindingResult bindingResult, Model model) {

        User userExists = userService.findUserByEmail(user.getEmail());
        if (userExists != null) {
            bindingResult
                    .rejectValue("email", "error.user",
                            "There is already a user registered with the email provided");
        }
        if (bindingResult.hasErrors()) {
            return "registration";
        } else {
            userService.saveUser(user);
            model.addAttribute("success", "U have been registered successfully");
            model.addAttribute("user", new User());
        }
        return "registration";
    }
}