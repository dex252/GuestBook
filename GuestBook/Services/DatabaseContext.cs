using System.Collections.Generic;
using System.Data;
using System.Linq;
using MySql.Data.MySqlClient;
using SolerORM;
using SolerORM.Models;

namespace GuestBook.Services
{
    public class DatabaseContext: IDatabaseService
    {
        private string ConnectionString { get; }
        public DatabaseContext(string connectionString)
        {
            this.ConnectionString = connectionString;
        }

        public List<T> Read<T>()
        {
            using MySqlConnection conn = GetConnection();

            conn.Open();

            var items = conn.Get<T>();

            return items.ToList();
        }

        public T Read<T>(long id)
        {
            using MySqlConnection conn = GetConnection();

            conn.Open();
          
            var item = conn.Get<T>(id);

            return item;
        }
        public List<T> ReadSortLimit<T>(Column column, Sort sort, ulong startIndex, ulong length)
        {
            using MySqlConnection conn = GetConnection();

            conn.Open();

            var items = conn.GetSortLimit<T>(column.ToString(), sort.ToString(),  startIndex, length);

            return items.ToList();
        }
        public long? Count<T>()
        {
            using MySqlConnection conn = GetConnection();

            conn.Open();

            var count = conn.Count<T>();
            
            return count;
        }

        public ulong? Create<T>(T model)
        {
            using MySqlConnection conn = GetConnection();

            conn.Open();

            using MySqlTransaction transaction = conn.BeginTransaction(IsolationLevel.Serializable);

            var id = conn.Insert(model, transaction);

            if (id!= null) transaction.Commit(); 
                else transaction.Rollback();

            return id;
        }

        public bool Update<T>(T model)
        {
            using MySqlConnection conn = GetConnection();

            conn.Open();

            using MySqlTransaction transaction = conn.BeginTransaction(IsolationLevel.Serializable);

            var success = conn.Update(model);

            if (success) transaction.Commit();
                else transaction.Rollback();

            return success;
        }

        public bool Delete<T>(ulong id)
        {
            using MySqlConnection conn = GetConnection();

            conn.Open();

            using MySqlTransaction transaction = conn.BeginTransaction(IsolationLevel.Serializable);

            var success = conn.Delete<T>(id, transaction);

            if (success) transaction.Commit();
            else transaction.Rollback();

            return success;
        }

        private MySqlConnection GetConnection()
        {
            return new MySqlConnection(ConnectionString);
        }

    }
}