package com.edu.mapper;

import com.edu.bean.Employee;
import com.edu.bean.EmployeeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EmployeeMapper {
    long countByExample(EmployeeExample example);

    int deleteByExample(EmployeeExample example);

    int deleteByPrimaryKey(Integer empId);

    int insert(Employee record);

    int insertSelective(Employee record);

    List<Employee> selectByExample(EmployeeExample example);
    /**
     * 根据条件查询带有部门信息的员工信息
     * @param example
     * @return
     */
    List<Employee> selectByDeptExample(EmployeeExample example);

    Employee selectByPrimaryKey(Integer empId);
    /**
     * 根据id去查询带有部门信息的员工信息
     * @param empId
     * @return
     */
    Employee selectByDeptPrimaryKey(Integer empId);

    int updateByExampleSelective(@Param("record") Employee record, @Param("example") EmployeeExample example);

    int updateByExample(@Param("record") Employee record, @Param("example") EmployeeExample example);

    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);
}