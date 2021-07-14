package com.atchunshan.controller;

import com.atchunshan.bean.Department;
import com.atchunshan.service.DepartmentService;
import com.atchunshan.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author Erics
 * @create 2021-07-13 9:35
 */
@Controller
public class DeparmentController {
    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDepts(){
        List<Department> depts = departmentService.getDepts();
        return Msg.success().add("depts",depts);
    }
}
