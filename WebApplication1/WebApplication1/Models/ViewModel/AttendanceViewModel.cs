using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models.ViewModel
{
    public class AttendanceViewModel
    {
        public int CourseId { get; set; }

        public int TeacherId { get; set; }

        public int StudentId { get; set; }

        public string CourseName { get; set; }

        public string StudentName { get; set; }

        public string StudentSurname { get; set; }

        public bool IsPresent { get; set; }

        public DateTime Date { get; set; }

        public List<AttendanceViewModel> AttendanceList { get; set; }

        public AttendanceViewModel Attendance { get; set; }
    }
}