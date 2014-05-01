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
    public class TreatmentTypeController : Controller
    {
        private SalonEntities db = new SalonEntities();

        // GET: /TreatmentType/
        [Authorize(Roles = "Admin")]
        public ActionResult Index()
        {
            return View(db.TreatmentTypes.ToList());
        }

        // GET: /TreatmentType/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TreatmentType treatmenttype = db.TreatmentTypes.Find(id);
            if (treatmenttype == null)
            {
                return HttpNotFound();
            }
            return View(treatmenttype);
        }

        // GET: /TreatmentType/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /TreatmentType/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="TreatmentTypeID,Category")] TreatmentType treatmenttype)
        {
            if (ModelState.IsValid)
            {
                db.TreatmentTypes.Add(treatmenttype);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(treatmenttype);
        }

        // GET: /TreatmentType/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TreatmentType treatmenttype = db.TreatmentTypes.Find(id);
            if (treatmenttype == null)
            {
                return HttpNotFound();
            }
            return View(treatmenttype);
        }

        // POST: /TreatmentType/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="TreatmentTypeID,Category")] TreatmentType treatmenttype)
        {
            if (ModelState.IsValid)
            {
                db.Entry(treatmenttype).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(treatmenttype);
        }

        // GET: /TreatmentType/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TreatmentType treatmenttype = db.TreatmentTypes.Find(id);
            if (treatmenttype == null)
            {
                return HttpNotFound();
            }
            return View(treatmenttype);
        }

        // POST: /TreatmentType/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TreatmentType treatmenttype = db.TreatmentTypes.Find(id);
            db.TreatmentTypes.Remove(treatmenttype);
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
