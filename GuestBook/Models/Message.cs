using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace SolerORM.Models
{
    [Table("messages")]
    public class Message
    {
        public int Id { get; set; }
        public string  UserName { get; set; }
        public string Email { get; set; }
        public string HomePage { get; set; }
        public string Text { get; set; }
        [ReadIgnore]
        public string Ip { get; set; }
        [ReadIgnore]
        public string Browser { get; set; }
        [WriteIgnore]
        public DateTime Created { get; set; }
    }
}