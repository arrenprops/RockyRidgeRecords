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
    public class albumsController : ApiController
    {
        private Model1Container db = new Model1Container();

        // GET: api/albums
        public IQueryable<album> Getalbums()
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.albums.Include("songs");
        }

        // GET: api/albums/5
        [ResponseType(typeof(album))]
        public IHttpActionResult Getalbum(int id)
        {
            db.Configuration.ProxyCreationEnabled = false;
            album album = db.albums.Find(id);
            if (album == null)
            {
                return NotFound();
            }

            return Ok(album);
            
        }

        // PUT: api/albums/5
        [ResponseType(typeof(void))]
        public IHttpActionResult Putalbum(int id, album album)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != album.Id)
            {
                return BadRequest();
            }

            db.Entry(album).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!albumExists(id))
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

        // POST: api/albums
        [ResponseType(typeof(album))]
        public IHttpActionResult Postalbum(album album)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.albums.Add(album);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = album.Id }, album);
        }

        // DELETE: api/albums/5
        [ResponseType(typeof(album))]
        public IHttpActionResult Deletealbum(int id)
        {
            album album = db.albums.Find(id);
            if (album == null)
            {
                return NotFound();
            }

            db.albums.Remove(album);
            db.SaveChanges();

            return Ok(album);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool albumExists(int id)
        {
            return db.albums.Count(e => e.Id == id) > 0;
        }
    }
}