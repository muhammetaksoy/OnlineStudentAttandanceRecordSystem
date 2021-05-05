using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;
using WebApplication1.Models.ViewModel;

namespace WebApplication1.Controllers
{
    public class TeacherController : Controller
    {
        StudentAttendingSystemEntities db = new StudentAttendingSystemEntities();
        // GET: Teacher
        public ActionResult Dashboard()
        {

            return View();
        }

        public ActionResult Attandance(AttendanceViewModel model)
        {
            var loginId = Convert.ToInt16(Session["LoginID2"]);

            var teacherCourses = (from l in db.Logins
                                  join t in db.Teachers on l.LoginID equals t.LoginID
                                  join a in db.Attendances on t.TeacherID equals a.TeacherID
                                  join c in db.Courses on a.CourseID equals c.CourseID
                                  where l.LoginID == loginId
                                  select new AttendanceViewModel
                                  {
                                      CourseId = c.CourseID,
                                      CourseName = c.CourseName
                                  }).Distinct().ToList();
            ViewBag.CourseData = new SelectList(teacherCourses, "CourseId", "CourseName");


            

            return View(model);
        }

        [HttpPost]
        public ActionResult Attandance(Course model)
        {
            var loginId = Convert.ToInt16(Session["LoginID2"]);

            var teacherCourses = (from l in db.Logins
                                  join t in db.Teachers on l.LoginID equals t.LoginID
                                  join a in db.Attendances on t.TeacherID equals a.TeacherID
                                  join c in db.Courses on a.CourseID equals c.CourseID
                                  where l.LoginID == loginId
                                  select new AttendanceViewModel
                                  {
                                      CourseId = c.CourseID,
                                      CourseName = c.CourseName
                                  }).Distinct().ToList();

            ViewBag.CourseData = new SelectList(teacherCourses, "CourseId", "CourseName");

            var teacherId = Convert.ToInt16(Session["TeacherId"]);

            var students = (from s in db.Students
                            join ssc in db.Student_Studies_Course on s.StudentID equals ssc.StudentID
                            join c in db.Courses on ssc.CourseID equals c.CourseID
                            where c.CourseID == model.CourseID
                            select new AttendanceViewModel
                            {
                                StudentId = s.StudentID,
                                CourseId = c.CourseID,
                                StudentName = s.StudentName,
                                StudentSurname = s.StudentSurname,
                                CourseName = c.CourseName,
                                TeacherId = teacherId
                            }).ToList();


            AttendanceViewModel attendanceModel = new AttendanceViewModel();
            attendanceModel.AttendanceList = students;



            return View(attendanceModel);
        }

        [HttpPost]
        public ActionResult StudentAttendanceSave(AttendanceViewModel model) 
        {


            
            Attendance attendance = new Attendance
            {
                Date = model.Date,
                isPresent = model.IsPresent,
                CourseID = model.CourseId,
                StudentID = model.StudentId,
                TeacherID = model.TeacherId
            };

            db.Attendances.Add(attendance);
            int result = db.SaveChanges();
            if (result > 0)
            {
                TempData["message"] = "Yoklama İşlemi Başarılı Olmuştur";
                TempData["alert-color"] = "success";
            }
            else
            {
                TempData["message"] = "Yoklama İşlemi Başarısız Olmuştur";
                TempData["alert-color"] = "danger";
            }


            return RedirectToAction("Attandance", "Teacher", model);
        }


        public ActionResult AttandanceHistory()
        {
            var teacherId = Convert.ToInt16(Session["TeacherId"]);

            var teacherIsPresents = (from a in db.Attendances
                                     join s in db.Students on a.StudentID equals s.StudentID
                                     join c in db.Courses on a.CourseID equals c.CourseID
                                     where a.TeacherID == teacherId
                                     select new AttendanceViewModel
                                     {
                                         Date = a.Date,
                                         IsPresent = a.isPresent,
                                         StudentName = s.StudentName,
                                         StudentSurname = s.StudentSurname,
                                         CourseName = c.CourseName
                                     }).ToList();

            AttendanceViewModel model = new AttendanceViewModel();
            model.AttendanceList = teacherIsPresents;

            return View(model);
        }


    }
}