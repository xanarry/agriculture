package com.agriculture.controller;

import com.agriculture.Consts;
import com.agriculture.controller.beans.ErrorMessageBean;
import com.agriculture.controller.beans.PageBean;
import com.agriculture.dataBase.dao.UserDao;
import com.agriculture.dataBase.domain.User;
import com.agriculture.util.EmailUtil;
import com.agriculture.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping(value = "/user")
public class UserController {
    private final String sysAdmin = "系统管理员";
    private final String sysOperator = "系统操作员";
    private final String operator = "操作员";

    private final String hzs = "合作社";
    private final String zzdh = "种植大户";
    private final String qt = "其他";

    private String[] roleList = new String[] {sysAdmin, sysOperator, operator};
    private String[] typeList = new String[] {hzs, zzdh, qt};


    @Autowired
    UserDao userDao;


    /**
     * 请求用户管理的首页
     * @param modelMap
     * @return String jsp视图的位置
     */
    @RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
    public String userAdminHomePage(ModelMap modelMap, @RequestParam(name = "role", required = false) String role) {
        List<User> userList = userDao.getUserList(null, null, role);
        modelMap.put("userList", userList);
        modelMap.put("roleList", roleList);
        modelMap.put("typeList", typeList);
        return "user/index";
    }

    /**
     * 获取添加用户的页面
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addUserPage(ModelMap modelMap) {
        modelMap.put("roleList", roleList);
        modelMap.put("typeList", typeList);
        return "user/userAdd";
    }


    /**
     * 保存添加用户时候提交的数据
     * @param user
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addUser(User user, HttpServletRequest request) {
        user.setPassword(DigestUtils.md5DigestAsHex("12345678".getBytes()));
        Long time = new Date().getTime();
        user.setLoginCount(0);//设置登录次数为0
        user.setCreateTime(time);//设置创建时间
        user.setLastLoginTime(0L);//设置最后一次登录时间1970
        user.setLastUpdateTime(time);//设置最后更新时间

        //谁窗创建的这个用户, 谁就是这个用户的主管
        User currentUser = (User) request.getSession().getAttribute("user");
        System.out.println(currentUser);
        user.setLeaderID(currentUser.getID());
        user.setLeaderName(currentUser.getName());

        userDao.addUser(user);
        return "redirect:/user";
    }

    /**
     *
     * @param loginName
     * @return
     */
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String deleteUser(String loginName) {
        String ID = userDao.getUserByLoginName(loginName).getID();
        userDao.deleteUser(ID);
        return "redirect:/user";
    }


    /**
     * 更新用户
     * @param user
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateUser(User user) {
        System.out.println(user);
        //根据修改项的多少, 选择查询一个用户修改在保存还是直接更新所有数据
        User originalUser = userDao.getUserByLoginName(user.getLoginName());
        //更新的项目如下
        originalUser.setName(user.getName());
        originalUser.setPhone(user.getPhone());
        originalUser.setEmail(user.getEmail());
        originalUser.setType(user.getType());
        originalUser.setRole(user.getRole());
        originalUser.setLastUpdateTime(new Date().getTime());
        userDao.updateUser(originalUser);
        return "redirect:/user";
    }


    /**
     * 获取用户的详细信息
     * @param loginName
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "/detail/{loginName}", method = RequestMethod.GET)
    public String getUserDetail(@PathVariable("loginName") String loginName, ModelMap modelMap) {
        User user = null;
        if (loginName.length() > 10) {
            user = userDao.getUser(loginName);
        } else {
            user = userDao.getUserByLoginName(loginName);
        }

        if (user == null) {
            ErrorMessageBean bean = new ErrorMessageBean();
            bean.setTitle("错误");
            bean.setHeader("错误");
            bean.setMessage("该用户不存在, 请检查!");
            bean.setUrl("/user/");
            bean.setLinkText("返回");
            return "redirect:/error?" + bean.toURLParamDecode();
        }

        modelMap.put("user", user);
        modelMap.put("roleList", roleList);
        modelMap.put("typeList", typeList);
        return "user/userDetail";

    }


    /**
     * 用户列表分页
     * @param page
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "/list/{page}", method = RequestMethod.GET)
    public String getUserList(@PathVariable("page") int page, ModelMap modelMap) {
        List<User> userList = userDao.getUserList((page - 1) * Consts.PAGE_COUNT, Consts.PAGE_COUNT, null);
        PageBean pageBean = Util.getPagination(userDao.getCount(), page, "/user/");
        modelMap.addAttribute("userList", userList);
        modelMap.addAttribute("pageBean", pageBean);
        return "user/userList";
    }


    /**
     * 新建用户的时候检查用户名和邮箱是否已经存在
     */
    @RequestMapping(value = "/check", method = RequestMethod.POST)
    @ResponseBody
    public String checkUserExist(String loginName) {
        boolean loginNameExist = userDao.getUserByLoginName(loginName) != null;
        return (loginNameExist != true) ? "" : Consts.SUCCESS;
    }


    /**
     * 处理用户点击找回密码的链接
     */
    @RequestMapping(value = "/forget-password", method = RequestMethod.GET)
    public String getForgetPasswordPage() {
        return "user/forgetPassword";
    }


    /**
     * 用户输入完毕基本信息之后验证输入信息, 并且发送找回密码的邮件
     * @param loginName
     * @param email
     * @param request
     * @return
     */
    @RequestMapping(value = "/forget-password", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public String checkUserInfoAndSendEmail(String loginName, String email, HttpServletRequest request) {
        String jsonPattern = "{\"loginNameExist\": %s, \"emailExist\": %s, \"sendMail\": %s}";
        boolean loginNameCheck = false, emailExist = false, sendMail = false;
        User user = userDao.getUserByLoginName(loginName);

        if (user != null) {
            loginNameCheck = true;
            if (user.getEmail().equals(email)) {
                emailExist = true;
                String msg = user.getLoginName() + "#" + email + "#" + new Date().getTime();
                String code = new String(Base64.getEncoder().encode(msg.getBytes()));
                String url = new String(request.getRequestURL()).replace(request.getRequestURI(), "") + "/user/retrieve-password?auth=" + code;
                sendMail = EmailUtil.sendMail(new String[]{email},"圣寿源-系统邮件-找回密码", "请点击链接找回密码, 30分钟以内有效!<a href=\"" + url + "\">" + url + "</a>");
            }
        }
        return String.format(jsonPattern, loginNameCheck, emailExist, sendMail);
    }


    /**
     * 重新设置密码输入界面
     */
    @RequestMapping(value = "/retrieve-password", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public String getResetPasswordByRetrieve(String auth, ModelMap modelMap) {
        String tokens = new String(Base64.getDecoder().decode(auth.getBytes()));
        String info[] = tokens.split("#");
        String loginName = info[0];
        String email = info[1];
        Long emailSendTime = Long.parseLong(info[2]);

        /*邮件发送时间超过30分钟标志为失效*/
        if (new Date().getTime() - emailSendTime > 30 * 60 * 1000) {
            ErrorMessageBean bean = new ErrorMessageBean();
            bean.setTitle("错误");
            bean.setHeader("找回密码错误");
            bean.setMessage("该链接已经失效, 请重新操作");
            bean.setUrl("/user/forget-password");
            bean.setLinkText("返回");
            return "redirect:/error?" + bean.toURLParamDecode();
        } else {
            modelMap.put("loginName", loginName);
            modelMap.put("email", email);
            return "user/resetPasswordByRetrieve";
        }
    }

    /**
     * 更新密码到数据库
     * @param loginName
     * @param password
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/retrieve-password", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
    public String retrievePassword(String loginName, String password) {
        User user = userDao.getUserByLoginName(loginName);
        user.setLastUpdateTime(new Date().getTime());
        user.setPassword(DigestUtils.md5DigestAsHex(password.getBytes()));
        userDao.updateUser(user);
        return Consts.SUCCESS;
    }


    /*登录, 注册, 密码找回相关==================================================================*/

    /**
     * 获取注册页面
     * @return
     */
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerPage() {
        return "user/register";
    }


    /**
     * 注册用户的提交信息
     * @param user
     * @return
     */
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public String register(User user) {
        System.out.println(user);

        if (userDao.getUser(user.getID()) != null) {
            return "身份证号码已经存在";
        }

        if (userDao.getUser(user.getLoginName()) != null) {
            return "登录名已经存在";
        }

        user.setRole(operator);
        user.setType(qt);
        user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
        long timeStamp = new Date().getTime();
        user.setLastUpdateTime(timeStamp);
        user.setCreateTime(timeStamp);
        user.setFailureCount(0);
        user.setLoginCount(0);
        user.setLastLoginTime(timeStamp);
        user.setLeaderID(user.getID());
        user.setLeaderName(user.getName());
        userDao.addUser(user);
        return Consts.SUCCESS;
    }


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage() {
        return "user/login";
    }

    /**
     * 用户登录
     * @param loginName
     * @param password
     * @param rememberme
     * @param request
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(String loginName, String password, boolean rememberme, HttpServletRequest request) {
        User user = userDao.getUserByLoginName(loginName);
        if (user != null) {//检查是否存在
            if (user.getPassword().equals(DigestUtils.md5DigestAsHex(password.getBytes()))) {//检查密码
                if (user.getName().equals(user.getLeaderName()) && user.getType().equals(qt) && user.getRole().equals(operator)) {
                    //检查是否是新建尚未授权的用户
                    return "redirect:/user/login?error=auth";
                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);
                    if (rememberme) {
                        /*如果用户选择记住登录信息*/
                        session.setMaxInactiveInterval(3600 * 24);/*24小时有效*/
                    } else {
                        session.setMaxInactiveInterval(30 * 60);/*30分钟有效*/
                    }
                    user.setLoginCount(user.getLoginCount() + 1);
                    user.setLastLoginTime(new Date().getTime());
                    userDao.updateUser(user);
                    return "redirect:/index";
                }
            } else {
                user.setFailureCount(user.getFailureCount() + 1);
                userDao.updateUser(user);
            }
        }
        return "redirect:/user/login?error=pass";
    }


    /**
     * 退出系统
     * @param request
     * @return
     */
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request) {
        /*移除session信息*/
        request.getSession().invalidate();
        return "redirect:login";
    }
}
