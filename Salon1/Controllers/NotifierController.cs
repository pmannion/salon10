using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Salon1.Models;

namespace Salon1.Controllers
{
    public class NotifierController : Controller
    {
        private SalonEntities db = new SalonEntities();

        // GET: /Notifier/
        public ActionResult Index()
        {
            var notifiers = db.Notifiers.Include(n => n.Booking).Include(n => n.Customer);
            return View(notifiers.ToList());
        }

        // GET: /Notifier/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Notifier notifier = db.Notifiers.Find(id);
            if (notifier == null)
            {
                return HttpNotFound();
            }
            return View(notifier);
        }

        // GET: /Notifier/Create
        public ActionResult Create()
        {
            ViewBag.BookingID = new SelectList(db.Bookings, "BookingID", "BookingID");
            ViewBag.CustomerID = new SelectList(db.Customers, "CustomerID", "LastName");
            return View();
        }

        // POST: /Notifier/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="NotifierID,CustomerID,BookingID")] Notifier notifier)
        {
            if (ModelState.IsValid)
            {
                db.Notifiers.Add(notifier);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.BookingID = new SelectList(db.Bookings, "BookingID", "BookingID", notifier.BookingID);
            ViewBag.CustomerID = new SelectList(db.Customers, "CustomerID", "LastName", notifier.CustomerID);
            return View(notifier);
        }

        // GET: /Notifier/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Notifier notifier = db.Notifiers.Find(id);
            if (notifier == null)
            {
                return HttpNotFound();
            }
            ViewBag.BookingID = new SelectList(db.Bookings, "BookingID", "BookingID", notifier.BookingID);
            ViewBag.CustomerID = new SelectList(db.Customers, "CustomerID", "LastName", notifier.CustomerID);
            return View(notifier);
        }

        // POST: /Notifier/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="NotifierID,CustomerID,BookingID")] Notifier notifier)
        {
            if (ModelState.IsValid)
            {
                db.Entry(notifier).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.BookingID = new SelectList(db.Bookings, "BookingID", "BookingID", notifier.BookingID);
            ViewBag.CustomerID = new SelectList(db.Customers, "CustomerID", "LastName", notifier.CustomerID);
            return View(notifier);
        }

        // GET: /Notifier/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Notifier notifier = db.Notifiers.Find(id);
            if (notifier == null)
            {
                return HttpNotFound();
            }
            return View(notifier);
        }

        // POST: /Notifier/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Notifier notifier = db.Notifiers.Find(id);
            db.Notifiers.Remove(notifier);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
