//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebApplication1.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Admin
    {
        public int AdminID { get; set; }
        public string AdminName { get; set; }
        public string AdminSurname { get; set; }
        public string Email { get; set; }
        public string MobileNumber { get; set; }
        public string Gender { get; set; }
        public Nullable<int> LoginID { get; set; }
    
        public virtual Login Login { get; set; }
    }
}