using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using recordLabel;

namespace recordLabel.Controllers
{
    public class songsController : ApiController
    {
        private Model1Container db = new Model1Container();

        // GET: api/songs
        public IQueryable<song> Getsongs()
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.songs;
        }

        // GET: api/songs/5
        [ResponseType(typeof(song))]
        public IHttpActionResult Getsong(int id)
        {
            db.Configuration.ProxyCreationEnabled = false;
            song song = db.songs.Find(id);
            if (song == null)
            {
                return NotFound();
            }

            return Ok(song);
        }

        // PUT: api/songs/5
        [ResponseType(typeof(void))]
        public IHttpActionResult Putsong(int id, song song)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != song.Id)
            {
                return BadRequest();
            }

            db.Entry(song).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!songExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/songs
        [ResponseType(typeof(song))]
        public IHttpActionResult Postsong(song song)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.songs.Add(song);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = song.Id }, song);
        }

        // DELETE: api/songs/5
        [ResponseType(typeof(song))]
        public IHttpActionResult Deletesong(int id)
        {
            song song = db.songs.Find(id);
            if (song == null)
            {
                return NotFound();
            }

            db.songs.Remove(song);
            db.SaveChanges();

            return Ok(song);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool songExists(int id)
        {
            return db.songs.Count(e => e.Id == id) > 0;
        }
    }
}