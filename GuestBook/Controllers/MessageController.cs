using System.Collections.Generic;
using GuestBook.Services;
using GuestBook.Validation;
using Microsoft.AspNetCore.Mvc;
using SolerORM.Models;

namespace GuestBook.Controllers
{
    [Route("api/message")]
    public class MessageController : AController
    {
        private IDatabaseService DatabaseService { get; }

        public MessageController(IDatabaseService databaseService)
        {
            DatabaseService = databaseService;
        }

        [HttpGet]
        public ActionResult<IEnumerable<Message>> Get()
        {
            var result = DatabaseService?.Read<Message>();

            if (result == null) return NoContent();
            return Ok(result);
        }

        [HttpGet("{id}")]
        public ActionResult<Message> Get(int id)
        {
            var item = DatabaseService?.Read<Message>(id);

            return Ok(item);
        }

        [HttpGet("{column}/{sort}/{page}")]
        public ActionResult<ulong> Get(Column column, Sort sort, ulong page)
        {
            var startIndex = (page - 1) * Params.MessagesCount;
            var items = DatabaseService?.ReadSortLimit<Message>(column, sort, startIndex, Params.MessagesCount);

            return Ok(items);
        }

        [HttpGet("count")]
        public ActionResult<ulong> Count()
        {
            var count = DatabaseService?.Count<Message>();
            if (count == null) return BadRequest();
            if (count % Params.MessagesCount == 0) return Ok(count / 25);
            else return Ok(count / 25 + 1);
        }

        [HttpPost]
        public ActionResult<ulong> Post([FromBody] Message item)
        {
            item.Id = 0;
            item.Browser = HttpContext.Request.Headers["User-Agent"].ToString();
            item.Ip = HttpContext.Connection.RemoteIpAddress.ToString();

            if (!new Validator<Message>((new MessageRule())).Validate(item)) return BadRequest();

            var count = DatabaseService?.Create(item);

            return Ok(count);
        }

        [HttpPut]
        public ActionResult Put([FromBody] Message item)
        {
            return BadRequest();
        }

        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            return BadRequest();
        }
    }
}