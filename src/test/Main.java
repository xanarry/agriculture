package test;

import com.agriculture.dataBase.domain.User;
import com.agriculture.dataBase.dao.UserDao;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {
    public static void main(String[] argv) {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");//得到spring容器
        UserDao userDao = (UserDao) applicationContext.getBean("userMapper");//获取这个bean
        //User user = userDao.getUserByEmail("xanarry@163.com");
    }
}
