using FluentValidation;

namespace GuestBook.Validation
{
    public class Validator<T>
    {
        private protected AbstractValidator<T> rule;

        public Validator(AbstractValidator<T> rule)
        {
            this.rule = rule;
        }
        public virtual string ValidateWithMessage(T obj)
        {
            var validationResult = rule.Validate(obj);

            if (!validationResult.IsValid)
            {
                return string.Join("\n", validationResult.Errors);
            }

            return null;
        }
        public virtual bool Validate(T obj)
        {
            return rule.Validate(obj).IsValid;
        }
    }
}