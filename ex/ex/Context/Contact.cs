//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ex.Context
{
    using System;
    using System.Collections.Generic;
    
    public partial class Contact
    {
        public byte Id { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string Fax { get; set; }
        public string Email { get; set; }
        public string LinkFB { get; set; }
        public string LinkGoogleMap { get; set; }
        public string Detail { get; set; }
        public Nullable<System.DateTime> Created_at { get; set; }
        public string Created_by { get; set; }
        public Nullable<System.DateTime> Updated_at { get; set; }
        public string Updated_by { get; set; }
        public int Status { get; set; }
    }
}