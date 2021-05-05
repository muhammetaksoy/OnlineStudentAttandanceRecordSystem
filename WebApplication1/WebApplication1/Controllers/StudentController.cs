using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;
using WebApplication1.Models.ViewModel;

namespace WebApplication1.Controllers
{
    public class StudentController : Controller
    {
        StudentAttendingSystemEntities db = new StudentAttendingSystemEntities();

        public ActionResult Dashboard()
        {
            return View();
        }

        public ActionResult ViewMyCourses()
        {        
            int loginId = Convert.ToInt16(Session["LoginID3"]); 

            var studentCourse = (from l in db.Logins
                                 join s in db.Students on l.LoginID equals s.LoginID
                                 join sc in db.Student_Studies_Course on s.StudentID equals sc.StudentID
                                 join c in db.Courses on sc.CourseID equals c.CourseID
                                 join d in db.Departments on c.DepartmentID equals d.DepartmentID
                                 where l.LoginID == loginId
                                 select new StudentCourseViewModel
                                 {
                                     CourseCode = c.CourseCode,
                                     CourseName = c.CourseName,
                                     CourseAkts = c.CourseAkts,
                                     DepartmentName = d.DepartmentName                                  

                                 }).ToList();

            ViewBag.CourseCount = studentCourse.Count;

           

            return View(studentCourse);

        }


        public ActionResult CheckAttandance(StudentCourseViewModel model)
        {
            int loginId = Convert.ToInt16(Session["LoginID3"]);

            var studentCourse = (from l in db.Logins
                                 join s in db.Students on l.LoginID equals s.LoginID
                                 join sc in db.Student_Studies_Course on s.StudentID equals sc.StudentID
                                 join c in db.Courses on sc.CourseID equals c.CourseID
                                 where l.LoginID == loginId
                                 select new StudentCourseViewModel
                                 {
                                     
                                    Courseid=(c.CourseID),
                                    CourseName = c.CourseName

                                     
                                 }).ToList();
            ViewBag.CourseData = new SelectList(studentCourse, "Courseid", "CourseName");

            model.StudentCourseIsPresentList = null;

            return View(model);
        }

        [HttpPost]
        public ActionResult StudentIsPresent(StudentCourseViewModel model)
        {
            int loginId = Convert.ToInt16(Session["LoginID3"]);

            var studentCourse = (from l in db.Logins
                                 join s in db.Students on l.LoginID equals s.LoginID
                                 join sc in db.Student_Studies_Course on s.StudentID equals sc.StudentID
                                 join c in db.Courses on sc.CourseID equals c.CourseID
                                 where l.LoginID == loginId
                                 select new StudentCourseViewModel
                                 {

                                     Courseid = (c.CourseID),
                                     CourseName = c.CourseName


                                 }).ToList();
            ViewBag.CourseData = new SelectList(studentCourse, "Courseid", "CourseName");


            var studentId = Convert.ToInt16(Session["StudentId"]);

            var studentCourseIsPresent = (from a in db.Attendances
                                          join c in db.Courses on a.CourseID equals c.CourseID
                                          join s in db.Students on a.StudentID equals s.StudentID
                                          where c.CourseID == model.Courseid && s.StudentID == studentId 
                                          select new StudentCourseViewModel
                                          {
                                              Date = a.Date,
                                              IsPresent = a.isPresent,
                                              CourseName = c.CourseName
                                          }).ToList();

            

            model.StudentCourseIsPresentList = studentCourseIsPresent;

            return View("CheckAttandance",model);

        }


    }
}