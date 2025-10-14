//package com.hrm.dao;
//
//import com.hrm.model.entity.Employee;
//import org.junit.jupiter.api.*;
//import java.time.LocalDate;
//import java.util.List;
//
//import static org.junit.jupiter.api.Assertions.*;
//
//class EmployeeDAOTest {
//    private EmployeeDAO dao;
//
//    @BeforeEach
//    void setUp() {
//        dao = new EmployeeDAO();
//        // Xóa dữ liệu test trước khi chạy test mới
//        List<Employee> all = dao.getAll();
//        for (Employee emp : all) {
//            if (emp.getEmail().equals("testuser@example.com") || emp.getEmail().equals("deleteuser@example.com")) {
//                dao.delete(emp.getEmployeeId());
//            }
//        }
//    }
//
//    @Test
//    void testInsertAndGetById() {
//        Employee emp = new Employee();
//        emp.setFullName("Test User");
//        emp.setGender("Male");
//        emp.setDob(LocalDate.of(1990, 1, 1));
//        emp.setAddress("123 Test St");
//        emp.setPhone("0123456789");
//        emp.setEmail("testuser@example.com");
//        emp.setDepartmentId(1);
//        emp.setPosition("Developer");
//        emp.setEmploymentPeriod("2020-2025");
//        emp.setStatus("Active");
//
//        boolean inserted = dao.insert(emp);
//        assertTrue(inserted);
//
//        List<Employee> all = dao.getAll();
//        Employee last = all.get(all.size() - 1);
//        Employee found = dao.getById(last.getEmployeeId());
//        assertNotNull(found);
//        assertEquals("Test User", found.getFullName());
//    }
//
//    @Test
//    void testUpdate() {
//        List<Employee> all = dao.getAll();
//        if (all.isEmpty()) return;
//        Employee emp = all.get(0);
//        String oldName = emp.getFullName();
//        emp.setFullName("Updated Name");
//        boolean updated = dao.update(emp);
//        assertTrue(updated);
//        Employee updatedEmp = dao.getById(emp.getEmployeeId());
//        assertEquals("Updated Name", updatedEmp.getFullName());
//        // revert
//        emp.setFullName(oldName);
//        dao.update(emp);
//    }
//
//    @Test
//    void testDelete() {
//        Employee emp = new Employee();
//        emp.setFullName("Delete User");
//        emp.setGender("Female");
//        emp.setDob(LocalDate.of(1995, 5, 5));
//        emp.setAddress("456 Delete St");
//        emp.setPhone("0987654321");
//        emp.setEmail("deleteuser@example.com");
//        emp.setDepartmentId(1);
//        emp.setPosition("Tester");
//        emp.setEmploymentPeriod("2022-2025");
//        emp.setStatus("Active");
//        boolean inserted = dao.insert(emp);
//        assertTrue(inserted);
//        List<Employee> all = dao.getAll();
//        Employee last = all.get(all.size() - 1);
//        boolean deleted = dao.delete(last.getEmployeeId());
//        assertTrue(deleted);
//        assertNull(dao.getById(last.getEmployeeId()));
//    }
//}
