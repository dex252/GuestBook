using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Reflection;

namespace SolerORM
{
    public static class Extensions
    {
        public static object GetValue<T>(this T target, string propertyName)
        {
            if (target == null) return null;
            var type = target.GetType();
            var property = type.GetProperties().FirstOrDefault(f => f.Name.Equals(propertyName));
            if (property != null)
            {
                return property.GetValue(target);
            }

            return null;
        }

        public static void SetValue<T>(this T target, string propertyName, object value)
        {
            if (target == null) return;
            var type = target.GetType();
            var property = type.GetProperties().FirstOrDefault(f => f.Name.Equals(propertyName));
            if (property != null)
            {
                property.SetValue(target, value, null);
            }
        }

        public static string TableName(this Type type)
        {
            var tableName = type.GetCustomAttribute<TableAttribute>()?.Name ?? type.Name;
            return tableName;
        }
    }
}