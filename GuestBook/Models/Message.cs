using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.RegularExpressions;
using FluentValidation;

namespace SolerORM.Models
{
    [Table("messages")]
    public class Message
    {
        public int Id { get; set; }
        public string UserName { get; set; }
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

    public class MessageRule : AbstractValidator<Message>
    {
        public MessageRule()
        {
            RuleFor(t => t.UserName).NotEmpty().WithMessage("Имя пользователя не может быть пустым")
                .NotNull().WithMessage("Имя пользователя не должно равняться null")
                .Length(3, 50).WithMessage("Длина имени пользователя должна быть в диапозоне от 3х до 50 символов")
                .Must(BeAValidName).WithMessage("Имя пользователя должно состоять из цифр и латинских букв");
            
            RuleFor(t => t.Email).MaximumLength(100).NotEmpty().WithMessage("email не может быть пустым")
                .NotNull().WithMessage("email не должен равняться null")
                .MaximumLength(50).WithMessage("Длина email не должна превышать 50 символов")
                .Must(BeAValidEmail).WithMessage("email не соответствует шаблону");

            RuleFor(t => t.HomePage).MaximumLength(100).WithMessage("Длина url не должна превышать 100 символов");

            RuleFor(t => t.Text).NotEmpty().WithMessage("Текст не может быть пустым")
                .NotNull().WithMessage("Текст не может быть null")
                .Length(1, 300).WithMessage("Длина текста должна быть в диапозоне от 1 до 300 символов")
                .Must(BeAValidTextHtmlTags).WithMessage("В тексте не должно быть html тегов");
        }

        private bool BeAValidName(string name)
        {
            string pattern = "[A-Za-z0-9\\s]{3,}";
            Match isMatch = Regex.Match(name, pattern, RegexOptions.IgnoreCase);
            return isMatch.Success;
        }

        private bool BeAValidEmail(string email)
        {
            string pattern = "[.\\-_a-z0-9]+@([a-z0-9][\\-a-z0-9]+\\.)+[a-z]{2,6}";
            Match isMatch = Regex.Match(email, pattern, RegexOptions.IgnoreCase);
            return isMatch.Success;
        }

        private bool BeAValidTextHtmlTags(string email)
        {
            string pattern = @"^((?!\/\>).)*$";
            Match isMatch = Regex.Match(email, pattern, RegexOptions.IgnoreCase);
            return isMatch.Success;
        }
    }
}