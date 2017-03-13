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
    public class tourDatesController : ApiController
    {
        private Model1Container db = new Model1Container();

        // GET: api/tourDates
        public IQueryable<tourDates> GettourDates()
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.tourDates;
        }

        // GET: api/tourDates/5
        [ResponseType(typeof(tourDates))]
        public IHttpActionResult GettourDates(int id)
        {
            db.Configuration.ProxyCreationEnabled = false;
            tourDates tourDates = db.tourDates.Find(id);
            if (tourDates == null)
            {
                return NotFound();
            }

            return Ok(tourDates);
        }

        // PUT: api/tourDates/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PuttourDates(int id, tourDates tourDates)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != tourDates.Id)
            {
                return BadRequest();
            }

            db.Entry(tourDates).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!tourDatesExists(id))
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

        // POST: api/tourDates
        [ResponseType(typeof(tourDates))]
        public IHttpActionResult PosttourDates(tourDates tourDates)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.tourDates.Add(tourDates);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = tourDates.Id }, tourDates);
        }

        // DELETE: api/tourDates/5
        [ResponseType(typeof(tourDates))]
        public IHttpActionResult DeletetourDates(int id)
        {
            tourDates tourDates = db.tourDates.Find(id);
            if (tourDates == null)
            {
                return NotFound();
            }

            db.tourDates.Remove(tourDates);
            db.SaveChanges();

            return Ok(tourDates);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool tourDatesExists(int id)
        {
            return db.tourDates.Count(e => e.Id == id) > 0;
        }
    }
}