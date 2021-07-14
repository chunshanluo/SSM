package com.atchunshan.test;

import com.atchunshan.bean.Employee;
import com.atchunshan.dao.EmployeeMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author Erics
 * @create 2021-07-10 10:02
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class CRUDTest {

    @Autowired
    EmployeeMapper employeeMapper;

    @Test
    public void test(){
//        Employee employee = employeeMapper.selectByPrimaryKey(6);
//        System.out.println(employee);

        Employee employee1 = employeeMapper.selectByPrimaryKeyWithDept(5);
        System.out.println(employee1);
    }
}
