using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models.ViewModel
{
    public class StudentCourseViewModel
    {
        public int StudentId { get; set; }

        public DateTime Date { get; set; }

        public bool IsPresent { get; set; }

        public int Courseid { get; set; }
        public string CourseCode { get; set; }
        public string CourseName { get; set; }
        public int CourseAkts { get; set; }
        public string DepartmentName { get; set;}

        public List<StudentCourseViewModel> StudentCourseIsPresentList { get; set; }


    }
}