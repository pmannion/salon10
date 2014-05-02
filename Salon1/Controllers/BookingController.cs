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
    public class BookingController : Controller
    {
        private SalonEntities db = new SalonEntities();

        // GET: /Booking/
        public ActionResult Index()
        {
            var bookings = db.Bookings.Include(b => b.Customer).Include(b => b.Staff).Include(b => b.Status);
            //var sorted = bookings.OrderBy(order => order.Customer.LastName); 
            return View(bookings.ToList());
            
        }

        // GET: /Booking/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Booking booking = db.Bookings.Find(id);
            if (booking == null)
            {
                return HttpNotFound();
            }
            return View(booking);
        }

        // GET: /Booking/Create
        public ActionResult Create()
        {
            ViewBag.CustomerID = new SelectList(db.Customers, "CustomerID", "LastName");
            ViewBag.StaffID = new SelectList(db.Staffs, "StaffID", "FirstName");
            ViewBag.StatusID = new SelectList(db.Status, "StatusID", "Description");
            ViewBag.TreatmentID = new SelectList(db.Treatments, "TreatmentID", "Name");
            return View();
        }

        // POST: /Booking/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "BookingID,TimeStart,EndTime,CustomerID,LastName,FirstName,Gender,DOB,Phone,email,AddressLine1,AddressLine2,StaffID,StatusID,TreatmentId")] Customer customer, Booking booking)
        {
            if (ModelState.IsValid)
            {
                db.Customers.Add(customer);
                db.SaveChanges();
                db.Bookings.Add(booking);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            //return View(customer);
        {
            ViewBag.CustomerID = new SelectList(db.Customers, "CustomerID", "LastName", booking.CustomerID);
            ViewBag.StaffID = new SelectList(db.Staffs, "StaffID", "FirstName", booking.StaffID);
            ViewBag.StatusID = new SelectList(db.Status, "StatusID", "Description", booking.StatusID);
            return View(booking);
        }
    }




        // GET: /Booking/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Booking booking = db.Bookings.Find(id);
            if (booking == null)
            {
                return HttpNotFound();
            }
            ViewBag.CustomerID = new SelectList(db.Customers, "CustomerID", "LastName", booking.CustomerID);
            ViewBag.StaffID = new SelectList(db.Staffs, "StaffID", "FirstName", booking.StaffID);
            ViewBag.StatusID = new SelectList(db.Status, "StatusID", "Description", booking.StatusID);
            return View(booking);
        }

        // POST: /Booking/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "BookingID,TimeStart,EndTime,CustomerID,LastName,FirstName,Gender,DOB,Phone,email,AddressLine1,AddressLine2,StaffID,StatusID,TreatmentId")] Booking booking)
        {
            if (ModelState.IsValid)
            {
                db.Entry(booking).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CustomerID = new SelectList(db.Customers, "CustomerID", "LastName", booking.CustomerID);
            ViewBag.StaffID = new SelectList(db.Staffs, "StaffID", "FirstName", booking.StaffID);
            ViewBag.StatusID = new SelectList(db.Status, "StatusID", "Description", booking.StatusID);
            return View(booking);
        }

        // GET: /Booking/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Booking booking = db.Bookings.Find(id);
            if (booking == null)
            {
                return HttpNotFound();
            }
            return View(booking);
        }

        // POST: /Booking/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Booking booking = db.Bookings.Find(id);
            db.Bookings.Remove(booking);
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
