using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using SolerORM.Models;

namespace SolerORM
{
    public class WriteIgnore : Attribute { }
    public class ReadIgnore : Attribute { }
    public static class Soler
    {
        /// <summary>
        /// Get by id
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="connection"></param>
        /// <param name="id"></param>
        /// <param name="transaction"></param>
        /// <returns></returns>
        public static T Get<T>(this IDbConnection connection, long id, IDbTransaction transaction = null)
        {
            using var command = connection.CreateCommand();
            var sql = $"select * from {typeof(T).TableName()} where id=@id";

            var commandParameter = command.CreateParameter();
            commandParameter.ParameterName = "id";
            commandParameter.Value = id;
            command.Parameters.Add(commandParameter);

            command.CommandText = sql;
            command.Transaction = transaction;
            command.CommandType = CommandType.Text;

            using var reader = command.ExecuteReader();
            while (reader.Read())
            {
                var row = (T) Activator.CreateInstance(typeof(T));
                foreach (var prop in typeof(T).GetProperties().Where(prop => prop.GetCustomAttribute<ReadIgnore>() == null))
                {
                    var value = reader[prop.Name];
                    if (value is DBNull) value = null;
                    row.SetValue(prop.Name, value);
                }

                return row;
            }

            return default;
        }

        /// <summary>
        /// Get all rows by table
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="connection"></param>
        /// <param name="transaction"></param>
        /// <returns></returns>
        public static IEnumerable<T> Get<T>(this IDbConnection connection, IDbTransaction transaction = null)
        {
            using var command = connection.CreateCommand();
            var sql = $"select * from {typeof(T).TableName()}";
            command.CommandText = sql;
            command.Transaction = transaction;
            command.CommandType = CommandType.Text;

            using var reader = command.ExecuteReader();
            while (reader.Read())
            {
                var row = (T) Activator.CreateInstance(typeof(T));
                foreach (var prop in typeof(T).GetProperties().Where(prop => prop.GetCustomAttribute<ReadIgnore>() == null))
                {
                    var value = reader[prop.Name];
                    if (value is DBNull) value = null;
                    row.SetValue(prop.Name, value);
                }

                yield return row;
            }
        }

        /// <summary>
        /// Get limit rows by table
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="connection"></param>
        /// <param name="startIndex"></param>
        /// <param name="length"></param>
        /// <param name="transaction"></param>
        /// <returns></returns>
        public static IEnumerable<T> GetSortLimit<T>(this IDbConnection connection, string columnName, Sort sort,
            ulong startIndex, ulong length, IDbTransaction transaction = null)
        {
            using var command = connection.CreateCommand();
         
            if (!typeof(T).GetProperties().Select(e => e.Name).Contains(columnName)) yield break;

            var sql =
                $"select * from {typeof(T).TableName()} order by {columnName} {sort} limit {startIndex}, {length}";

            command.CommandText = sql;
            command.Transaction = transaction;
            command.CommandType = CommandType.Text;

            using var reader = command.ExecuteReader();
            while (reader.Read())
            {
                var row = (T)Activator.CreateInstance(typeof(T));
                foreach (var prop in typeof(T).GetProperties().Where(prop => prop.GetCustomAttribute<ReadIgnore>() == null))
                {
                    var value = reader[prop.Name];
                    if (value is DBNull) value = null;
                    row.SetValue(prop.Name, value);
                }

                yield return row;
            }

        }

        /// <summary>
        /// Insert row and return id
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="connection"></param>
        /// <param name="model"></param>
        /// <param name="transaction"></param>
        /// <returns></returns>
        public static ulong? Insert<T>(this IDbConnection connection, T model, IDbTransaction transaction = null)
        {
            using var command = connection.CreateCommand();
            var properties = typeof(T).GetProperties().Where(prop => prop.GetCustomAttribute<WriteIgnore>() == null)
                .Select(s => s.Name).ToArray();

            var sql = $@"insert into {typeof(T).TableName()} 
                        ({string.Join(", ", properties)}) 
                        values 
                        ({string.Join(", ", properties.Select(s => $"@{s}"))})";

            command.CommandText = sql;
            command.Transaction = transaction;
            command.CommandType = CommandType.Text;

            foreach (var prop in model.GetType().GetProperties()
                .Where(prop => prop.GetCustomAttribute<WriteIgnore>() == null))
            {
                var commandParameter = command.CreateParameter();
                commandParameter.ParameterName = prop.Name;
                commandParameter.Value = model.GetValue(prop.Name);
                command.Parameters.Add(commandParameter);
            }

            var affectedRows = command.ExecuteNonQuery();
            if (affectedRows == 0) return null;

            return LastInsertedId(connection, transaction);
        }

        /// <summary>
        /// Update row by id
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="connection"></param>
        /// <param name="model"></param>
        /// <param name="transaction"></param>
        /// <returns></returns>
        public static bool Update<T>(this IDbConnection connection, T model, IDbTransaction transaction = null)
        {
            using var command = connection.CreateCommand();
            var properties = typeof(T).GetProperties().Select(s => s.Name).ToArray();

            var sql = $@"update {typeof(T).TableName()} set
                        {string.Join(", ", properties.Where(s => s != "Id" && s != "id").Select(s => $"{s}=@{s}"))} where 
                        {string.Join(", ", properties.Where(s => s == "Id" || s == "id").Select(s => $"{s}=@{s}"))};";

            command.CommandText = sql;
            command.Transaction = transaction;
            command.CommandType = CommandType.Text;

            foreach (var prop in model.GetType().GetProperties())
            {
                var commandParameter = command.CreateParameter();
                commandParameter.ParameterName = prop.Name;
                commandParameter.Value = model.GetValue(prop.Name);
                command.Parameters.Add(commandParameter);
            }

            var affectedRows = command.ExecuteNonQuery();
            if (affectedRows == 0) return false;

            return true;
        }

        /// <summary>
        /// Delete row by id
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="connection"></param>
        /// <param name="id"></param>
        /// <param name="transaction"></param>
        /// <returns></returns>
        public static bool Delete<T>(this IDbConnection connection, ulong id, IDbTransaction transaction = null)
        {
            using var command = connection.CreateCommand();

            var sql = $@"delete from {typeof(T).TableName()} where id=@id";
            command.CommandText = sql;
            command.Transaction = transaction;
            command.CommandType = CommandType.Text;

            var commandParameter = command.CreateParameter();
            commandParameter.ParameterName = "id";
            commandParameter.Value = id;
            command.Parameters.Add(commandParameter);

            var affectedRows = command.ExecuteNonQuery();
            if (affectedRows == 0) return false;

            return true;
        }

        /// <summary>
        /// Get count rows by table
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="connection"></param>
        /// <param name="transaction"></param>
        /// <returns></returns>
        public static long? Count<T>(this IDbConnection connection, IDbTransaction transaction = null)
        {
            using var command = connection.CreateCommand();

            var sql = $@"select count(*) from {typeof(T).TableName()}";
            command.CommandText = sql;
            command.Transaction = transaction;
            command.CommandType = CommandType.Text;

            var count = command.ExecuteScalar() as long?;
            return count;
        }

        /// <summary>
        /// Common query with params
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="connection"></param>
        /// <param name="sql"></param>
        /// <param name="parameters"></param>
        /// <param name="transaction"></param>
        /// <returns></returns>
        public static IEnumerable<T> Query<T>(this IDbConnection connection, string sql, object parameters = null,
            IDbTransaction transaction = null)
        {
            using var command = connection.CreateCommand();

            command.CommandText = sql;
            command.Transaction = transaction;
            command.CommandType = CommandType.Text;

            if (parameters != null)
                foreach (var prop in parameters.GetType().GetProperties())
                {
                    var commandParameter = command.CreateParameter();
                    commandParameter.ParameterName = prop.Name;
                    commandParameter.Value = parameters.GetValue(prop.Name);
                    command.Parameters.Add(commandParameter);
                }

            using var reader = command.ExecuteReader();
            while (reader.Read())
            {
                var row = (T) Activator.CreateInstance(typeof(T));
                foreach (var prop in typeof(T).GetProperties())
                {
                    var value = reader[prop.Name];
                    if (value is DBNull) value = null;
                    row.SetValue(prop.Name, value);
                }

                yield return row;
            }
        }

        private static ulong? LastInsertedId(this IDbConnection connection, IDbTransaction transaction)
        {
            using var command = connection.CreateCommand();
            command.CommandText = "SELECT LAST_INSERT_ID()";
            command.Transaction = transaction;
            command.CommandType = CommandType.Text;

            var value = command.ExecuteScalar();
            if (value is DBNull) return null;
            return (ulong?) value;
        }
    }
}