using System.Collections.Generic;
using SolerORM.Models;

namespace GuestBook.Services
{
    public interface IDatabaseService
    {
        List<T> Read<T>();
        T Read<T>(long id);
        List<T> ReadSortLimit<T>(Column column, Sort sort, ulong startIndex, ulong length);
        long? Count<T>();
        ulong? Create<T>(T model);
        bool Update<T>(T model);
        bool Delete<T>(ulong id);
    }
}