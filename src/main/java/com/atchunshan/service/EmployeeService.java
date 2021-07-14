package com.atchunshan.service;

import com.atchunshan.bean.Employee;
import com.atchunshan.bean.EmployeeExample;
import com.atchunshan.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Erics
 * @create 2021-07-10 11:18
 */

@Service
public class EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;
    public List<Employee> getAll() {
        return employeeMapper.selectByExampleWithDept(null);
    }

    public boolean checkUser(String empName) {
        // TODO Auto-generated method stub
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count = employeeMapper.countByExample(example);
        return count == 0;
    }

    //员工保存
    public void saveEmp(Employee employee) {
        employeeMapper.insertSelective(employee);
    }

    public Employee getEmp(Integer id) {
        Employee employee = employeeMapper.selectByPrimaryKeyWithDept(id);
        return employee;
    }

    public void updateEmp(Employee employee){
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    public void deleteEmp(Integer id){
        employeeMapper.deleteByPrimaryKey(id);
    }

    public void deleteBatch(List<Integer> ids){
        // TODO Auto-generated method stub
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        //delete from xxx where emp_id in(1,2,3)
        criteria.andEmpIdIn(ids);
        employeeMapper.deleteByExample(example);
    }
}
