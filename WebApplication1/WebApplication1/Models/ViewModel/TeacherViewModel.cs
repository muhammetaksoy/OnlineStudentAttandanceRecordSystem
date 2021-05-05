using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models.ViewModel
{
    public class TeacherViewModel
    {
        public int TeacherId { get; set; }
        public string TeacherName { get; set; }
        public string TeacherSurname { get; set; }
        public string MobileNumber { get; set; }
        public string Email { get; set; }
        public string Gender { get; set; }
        public string DepartmentName { get; set; }
        public int RoleId { get; set; }

    }
}