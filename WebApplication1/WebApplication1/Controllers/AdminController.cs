using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;
namespace WebApplication1.Controllers
{
    public class AdminController : Controller
    {
        StudentAttendingSystemEntities db = new StudentAttendingSystemEntities();
  
        public ActionResult Dashboard()
        {
            var deger1 = db.Teachers.Count();
            ViewBag.dgr1 = deger1;
            var deger2 = db.Courses.Count();
            ViewBag.dgr2 = deger2;
            var deger3 = db.Students.Count();
            ViewBag.dgr3 = deger3;
            var deger4 = db.Departments.Count();
            ViewBag.dgr4 = deger4;
            var deger5 = db.Admins.Count();
            ViewBag.dgr5 = deger5;
            var deger6 = db.Students.Where(x => x.Department.DepartmentName == "Computer Engineering").Count();
            ViewBag.dgr6 = deger6;

            return View();
        }
        public ActionResult ViewDepartment()
        {
            var departments = db.Departments.ToList();
            return View(departments);
        }

        public ActionResult ViewTeacher()
        {
            var teachers = db.Teachers.ToList();
            return View(teachers);
        }

        public ActionResult ViewStudent()
        {
            var students = db.Students.ToList();
            return View(students);
        }

        public ActionResult ViewCourse()
        {
            var courses = db.Courses.ToList();
            return View(courses);
        }

        //ADDING
        public ActionResult AddDepartment()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddDepartment(Department p1)
        {
            if (ModelState.IsValid)
            {
                db.Departments.Add(p1);
                db.SaveChanges();
                return RedirectToAction("ViewDepartment");
            }

            return View(p1);
        }

        public ActionResult AddTeacher()
        {
            ViewBag.DepartmentID = new SelectList(db.Departments, "DepartmentID", "DepartmentName");
            return View();
        }

        [HttpPost]
        public ActionResult AddTeacher(Teacher p1)
        {

            if (ModelState.IsValid)
            {
                db.Teachers.Add(p1);
                db.SaveChanges();
                return RedirectToAction("ViewTeacher");
            }

            ViewBag.DepartmentID = new SelectList(db.Departments, "DepartmentID", "DepartmentName", p1.DepartmentID);
            return View(p1);
        }

        public ActionResult AddStudent()
        {
            ViewBag.DepartmentID = new SelectList(db.Departments, "DepartmentID", "DepartmentName");
            return View();
        }


        [HttpPost]
        public ActionResult AddStudent(Student p1)
        {

            if (ModelState.IsValid)
            {
                db.Students.Add(p1);
                db.SaveChanges();
                return RedirectToAction("ViewStudent");
            }

            ViewBag.DepartmentID = new SelectList(db.Departments, "DepartmentID", "DepartmentName", p1.DepartmentID);
            return View(p1);
        }

        public ActionResult AddCourse()
        {
            ViewBag.DepartmentID = new SelectList(db.Departments, "DepartmentID", "DepartmentName");
            return View();
        }

        [HttpPost]
        public ActionResult AddCourse(Course p1)
        {

            if (ModelState.IsValid)
            {
                db.Courses.Add(p1);
                db.SaveChanges();
                return RedirectToAction("ViewCourse");
            }

            ViewBag.DepartmentID = new SelectList(db.Departments, "DepartmentID", "DepartmentName", p1.DepartmentID);
            return View(p1);
        }


        //DELETING

        public ActionResult DeleteDepartment(int id)
        {
            var department = db.Departments.Find(id);
            db.Departments.Remove(department);
            db.SaveChanges();
            return RedirectToAction("ViewDepartment");
        }

        public ActionResult DeleteTeacher(int id)
        {
            var teacher = db.Teachers.Find(id);
            db.Teachers.Remove(teacher);
            db.SaveChanges();
            return RedirectToAction("ViewTeacher");
        }

        public ActionResult DeleteStudent(int id)
        {
            var student = db.Students.Find(id);
            db.Students.Remove(student);
            db.SaveChanges();
            return RedirectToAction("ViewStudent");
        }

        public ActionResult DeleteCourse(int id)
        {
            var course = db.Courses.Find(id);
            db.Courses.Remove(course);
            db.SaveChanges();
            return RedirectToAction("ViewCourse");
        }










        //UPDATING

        public ActionResult UpdateDepartment(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var department = db.Departments.Find(id);
            if (department == null)
            {
                return HttpNotFound();
            }
            return View(department);
        }

        [HttpPost]
        public ActionResult UpdateDepartment(Department p1)
        {
            if (ModelState.IsValid)
            {
                db.Entry(p1).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("ViewDepartment");
            }
            return View(p1);
        }




        public ActionResult UpdateCourse(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var course = db.Courses.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }
            ViewBag.DepartmentID = new SelectList(db.Departments, "DepartmentID", "DepartmentName", course.DepartmentID);
            return View(course);
        }

        [HttpPost]
        public ActionResult UpdateCourse(Course p1)
        {
            if (ModelState.IsValid)
            {
                db.Entry(p1).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("ViewCourse");
            }
            ViewBag.DepartmentID = new SelectList(db.Departments, "DepartmentID", "DepartmentName", p1.DepartmentID);
            return View(p1);
        }



        public ActionResult UpdateStudent(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var student = db.Students.Find(id);
            if (student == null)
            {
                return HttpNotFound();
            }
            ViewBag.DepartmentID = new SelectList(db.Departments, "DepartmentID", "DepartmentName", student.DepartmentID);
            return View(student);
        }


        [HttpPost]
        public ActionResult UpdateStudent(Student p1)
        {
            if (ModelState.IsValid)
            {
                db.Entry(p1).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("ViewStudent");
            }
            ViewBag.DepartmentID = new SelectList(db.Students, "DepartmentID", "DepartmentName", p1.DepartmentID);
            return View(p1);
        }


        public ActionResult UpdateTeacher(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var teacher = db.Teachers.Find(id);
            if (teacher == null)
            {
                return HttpNotFound();
            }
            ViewBag.DepartmentID = new SelectList(db.Departments, "DepartmentID", "DepartmentName", teacher.DepartmentID);
            return View(teacher);
        }

        [HttpPost]
        public ActionResult UpdateTeacher(Teacher p1)
        {
            if (ModelState.IsValid)
            {
                db.Entry(p1).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("ViewTeacher");
            }
            ViewBag.DepartmentID = new SelectList(db.Departments, "DepartmentID", "DepartmentName", p1.DepartmentID);
            return View(p1);
        }



    }
}