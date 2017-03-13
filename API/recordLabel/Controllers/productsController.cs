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
    public class productsController : ApiController
    {
        private Model1Container db = new Model1Container();

        // GET: api/products
        public IQueryable<product> Getproducts()
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.products;
        }

        // GET: api/products/5
        [ResponseType(typeof(product))]
        public IHttpActionResult Getproduct(int id)
        {
            db.Configuration.ProxyCreationEnabled = false;
            product product = db.products.Find(id);
            if (product == null)
            {
                return NotFound();
            }

            return Ok(product);
        }

        // PUT: api/products/5
        [ResponseType(typeof(void))]
        public IHttpActionResult Putproduct(int id, product product)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != product.Id)
            {
                return BadRequest();
            }

            db.Entry(product).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!productExists(id))
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

        // POST: api/products
        [ResponseType(typeof(product))]
        public IHttpActionResult Postproduct(product product)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.products.Add(product);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = product.Id }, product);
        }

        // DELETE: api/products/5
        [ResponseType(typeof(product))]
        public IHttpActionResult Deleteproduct(int id)
        {
            product product = db.products.Find(id);
            if (product == null)
            {
                return NotFound();
            }

            db.products.Remove(product);
            db.SaveChanges();

            return Ok(product);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool productExists(int id)
        {
            return db.products.Count(e => e.Id == id) > 0;
        }
    }
}