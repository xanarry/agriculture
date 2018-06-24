package test;

import com.agriculture.dataBase.domain.User;
import com.agriculture.dataBase.dao.UserDao;
import javafx.scene.effect.SepiaTone;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.HashSet;
import java.util.Set;

public class Test {
    public static boolean isPalindrome(int x) {
        String num = x + "";
        for (int i = 0; i < num.length(); i++) {
            if (num.charAt(i) != num.charAt(num.length() - i - 1)) {
                return false;
            }
        }
        return true;
    }
    public static void main(String[] argv) {
        Integer[] strs = new Integer[]{-2147483648,};
        for (Integer i : strs) {
            System.out.println(isPalindrome(i));
        }
    }
}
