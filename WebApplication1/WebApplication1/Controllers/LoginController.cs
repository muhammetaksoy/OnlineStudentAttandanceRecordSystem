using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using WebApplication1.Models;
using WebApplication1.Models.ViewModel;

namespace WebApplication1.Controllers
{
    public class LoginController : Controller
    {
        StudentAttendingSystemEntities db = new StudentAttendingSystemEntities();



        public ActionResult AdminLogin()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AdminLogin(Login login)
        {

            var bilgiler = db.Logins.Where(x => x.UserName == login.UserName && x.Password == login.Password && x.RoleID == 1).FirstOrDefault();

            if (bilgiler == null)
            {

                return View("AdminLogin");
            }
            else
            {
               
                Session["LoginID"] = bilgiler.LoginID;
                Session["UserName"] = bilgiler.UserName;


                return RedirectToAction("DashBoard", "Admin");
            }
        }

        public ActionResult TeacherLogin()
        {
            return View();
        }

        [HttpPost]
        public ActionResult TeacherLogin(Login login)
        {

            var bilgiler = db.Logins.Where(x => x.UserName == login.UserName && x.Password == login.Password && x.RoleID == 2).FirstOrDefault();
            var teacher = (from l in db.Logins
                           join t in db.Teachers on l.LoginID equals t.LoginID
                           where l.UserName == login.UserName && l.Password == login.Password&&l.RoleID==2
                           select new TeacherViewModel
                           {
                               TeacherId = t.TeacherID,
                               RoleId = (int)l.RoleID,
                               TeacherName = t.TeacherName,
                               TeacherSurname = t.TeacherSurname,
                               MobileNumber = t.MobileNumber,
                               Email = t.Email,
                               Gender = t.Gender,
                               DepartmentName = t.Department.DepartmentName
                           }).FirstOrDefault();

            if (bilgiler == null)
            {

                return View("TeacherLogin");
            }
            else
            {
                Session["TeacherName"] = teacher.TeacherName;
                Session["TeacherSurname"] = teacher.TeacherSurname;
                Session["MobileNumber"] = teacher.MobileNumber;
                Session["Email"] = teacher.Email;
                Session["Gender"] = teacher.Gender;
                Session["DepartmentName"] = teacher.DepartmentName;
                Session["TeacherId"] = teacher.TeacherId;

                Session["LoginID2"] = bilgiler.LoginID;
                Session["UserName"] = bilgiler.UserName;
                Session["Password"] = bilgiler.Password;


                return RedirectToAction("DashBoard", "Teacher");
            }
        }

        public ActionResult StudentLogin()
        {
            return View();
        }

        [HttpPost]
        public ActionResult StudentLogin(Login login)
        {

            var bilgiler = db.Logins.Where(x => x.UserName == login.UserName && x.Password == login.Password && x.RoleID == 3).FirstOrDefault();

            var student = (from l in db.Logins
                           join s in db.Students on l.LoginID equals s.LoginID 
                           where l.UserName == login.UserName && l.Password == login.Password && l.RoleID == 3
                           select new StudentViewModel
                           {
                               StudentId = s.StudentID,
                               StudentName = s.StudentName,
                               StudentSurname =s.StudentSurname,
                               StudentNumber=s.StudentNumber,
                               Email = s.Email,
                               MobileNumber = s.MobileNumber,                            
                               Gender = s.Gender,
                               City=s.City,
                               DepartmentName = s.Department.DepartmentName,
                               RoleId = (int)l.RoleID
                               
                              
                              
                           }).FirstOrDefault();
            
            if (bilgiler == null)
            {

                return View("StudentLogin");
            }
            else
            {

                Session["StudentId"] = student.StudentId;
                Session["StudentName"] = student.StudentName;
                Session["StudentSurname"] = student.StudentSurname;
                Session["StudentNumber"] = student.StudentNumber;
                Session["Email"] = student.Email;
                Session["MobileNumber"] = student.MobileNumber;
                Session["Gender"] = student.Gender;
                Session["City"] = student.City;
                Session["DepartmentName"] = student.DepartmentName;
                Session["StudentRoleId"] = student.RoleId; 

                Session["LoginID3"] = bilgiler.LoginID;
                Session["UserName"] = bilgiler.UserName;
                Session["Password"] = bilgiler.Password;

                return RedirectToAction("DashBoard", "Student");
            }
        }


        public ActionResult LogOut()
        {
            int loginid = (int)Session["LoginID"];
            Session.Abandon();
            return RedirectToAction("Index", "Home");
        }
        public ActionResult LogOut2()
        {
            int loginid = (int)Session["LoginID2"];
            Session.Abandon();
            return RedirectToAction("Index", "Home");
        }
        public ActionResult LogOut3()
        {
            int loginid = (int)Session["LoginID3"];
            Session.Abandon();
            return RedirectToAction("Index", "Home");
        }


    }
}