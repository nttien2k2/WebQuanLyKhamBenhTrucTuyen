﻿using DACN_Quan_Ly_Kham_Chua_Benh.Data;
using DACN_Quan_Ly_Kham_Chua_Benh.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using NuGet.Protocol;
using Newtonsoft.Json;
using System.Text.Json;
using System.Text.Json.Nodes;

namespace DACN_Quan_Ly_Kham_Chua_Benh.Controllers
{
    public class BacSiController : Controller
    {
        private readonly DBContext _dbcontext;
        public BacSiController(DBContext dbcontext)
        {
            _dbcontext = dbcontext;
        }
        public IActionResult Index(int tt)
        {
            var trangThaiList = new List<SelectListItem>
                {
                    new SelectListItem { Value = "1", Text = "Hồ sơ duyệt hoàn toàn" },
                    new SelectListItem { Value = "2", Text = "Hồ sơ duyệt bổ sung" },
                    new SelectListItem { Value = "3", Text = "Hồ sơ mới" },
                    new SelectListItem { Value = "4", Text = "Hồ sơ từ chối" }
                };
            ViewBag.dsTT = trangThaiList;
            //var bs = _dbcontext.bacSiTemp.Where(a => a.TrangThai == tt).ToList();
            var query = from bs in _dbcontext.bacSiTemp.Where(a => a.TrangThai == tt)
                        select new BacSiViewModel()
                        {
                            idBacsiTemp = bs.idBacSiTemp,
                            MaBS = bs.MaBS,
                            TenBS = bs.TenBS,
                            SDT = bs.SDT,
                            DiaChi = bs.DiaChi,
                            Email = bs.Email,
                            GioiTinh = bs.GioiTinh,
                            NgaySinh = bs.NgaySinh,
                            QuocTich = bs.QuocTich,
                        };
            var result = query.ToList();
            if (tt > 0)
            {
                if (result.Count > 0)
                {
                    ViewBag.kt = tt;
                    return View(result);
                }
                else if (tt == 1)
                {
                    ViewBag.Message = "Hiện không có bác sĩ nào trong hệ thống!!.";
                    return View();
                }
                else if (tt == 2)
                {
                    ViewBag.Message = "Hiện không có Profile nào cần bổ sung trong hệ thống!!.";
                    return View();
                }
                if (tt == 3)
                {
                    ViewBag.Message = "Hiện không có Profile nào mới trong hệ thống!!.";
                    return View();
                }
                if (tt == 4)
                {
                    ViewBag.Message = "Hiện không có Profile nào đã từ chối trong hệ thống!!.";
                    return View();
                }
            }
            else
            {
                ViewBag.kt = 3;
                var query1 = from bs in _dbcontext.bacSiTemp.Where(a => a.TrangThai == 3)
                             select new BacSiViewModel()
                             {
                                 idBacsiTemp = bs.idBacSiTemp,
                                 MaBS = bs.MaBS,
                                 TenBS = bs.TenBS,
                                 SDT = bs.SDT,
                                 DiaChi = bs.DiaChi,
                                 Email = bs.Email,
                                 GioiTinh = bs.GioiTinh,
                                 NgaySinh = bs.NgaySinh,
                                 QuocTich = bs.QuocTich,
                             };
                var result1 = query1.ToList();
                return View(result1);
            }
            return View(result);

        }
        public IActionResult DetailsBacSi(int? id)
        {
            int ktAccept = 0;

            var result = _dbcontext.bacSiTemp.Where(a => a.idBacSiTemp == id).Select(a => a.TrangThai).FirstOrDefault();
            if (result == 1)
            {
                ktAccept = 1;
                ViewBag.ktaccepts = ktAccept;
            }
            else if (result == 2)
            {
                ktAccept = 2;
                ViewBag.ktaccepts = ktAccept;
            }
            else if (result == 3)
            {
                ktAccept = 3;
                ViewBag.ktaccepts = ktAccept;
            }else
            {
                    ktAccept = 4;
                    ViewBag.ktaccepts = ktAccept;
            }    
            var query = from bs in _dbcontext.bacSiTemp.Where(a => a.idBacSiTemp == id)
                        select new BacSiViewModel()
                        {
                            idBacsiTemp = bs.idBacSiTemp,
                            MaBS = bs.MaBS,
                            TenBS = bs.TenBS,
                            SDT = bs.SDT,
                            DiaChi = bs.DiaChi,
                            Email = bs.Email,
                            GioiThieu = bs.GioiThieu,
                            GioiTinh = bs.GioiTinh,
                            NgaySinh = bs.NgaySinh,
                            QuocTich = bs.QuocTich,
                        };
            var bacSi = _dbcontext.bacSiTemp.FirstOrDefault(a => a.idBacSiTemp == id);
            if (bacSi != null)
            {
                ViewBag.KinhNghiemJson = bacSi.KinhNghiem;
                ViewBag.KyNangJson = bacSi.KyNangChuyenMon;
            }
            var maxBangBoSung = (from kqd in _dbcontext.ketQuaDuyet
                                 join bst in _dbcontext.bacSiTemp on kqd.idBacSiTemp equals bst.idBacSiTemp
                                 where bst.idBacSiTemp == id
                                 select kqd.BangBoSung).Max();
            ViewBag.BangBoSung = maxBangBoSung;
            ViewBag.dsBangCap = _dbcontext.bangCap.Where(a => a.idBacSiTemp == id && a.idProfileBoSung == null  ).ToList();
            ViewBag.dsChungChi = _dbcontext.chungChi.Where(a => a.idBacSiTemp == id && a.idProfileBoSung == null).ToList();

            var detailsbacsi = query.FirstOrDefault();
            return View(detailsbacsi);
        }
        public IActionResult Accept(int id)
        {
            var bst = _dbcontext.bacSiTemp.FirstOrDefault(a => a.idBacSiTemp == id);
            if (bst != null)
            {
                bst.TrangThai = 1;
                var bs = new BacSi
                {
                    MaBS = bst.MaBS,
                    TenBS = bst.TenBS,
                    TrangThai = 1,
                    KinhNghiem = bst.KinhNghiem,
                    KyNangChuyenMon = bst.KyNangChuyenMon,
                    SDT = bst.SDT,
                    DiaChi = bst.DiaChi,
                    Email = bst.Email,
                    GioiThieu = bst.GioiThieu,
                    GioiTinh = bst.GioiTinh,
                    NgaySinh = bst.NgaySinh,
                    QuocTich = bst.QuocTich
                };

                _dbcontext.BacSi.Add(bs);
                _dbcontext.SaveChanges();

                int idmax = _dbcontext.BacSi.Max(a => a.idBacSi);
                var bangCap = _dbcontext.bangCap.Where(a => a.idBacSiTemp == id);
                foreach (var BangCap in bangCap)
                {
                    BangCap.idBacSi = idmax;
                }
                var chungChi = _dbcontext.chungChi.Where(a => a.idBacSiTemp == id);
                foreach (var ChungChi in chungChi)
                {
                    ChungChi.idBacSi = idmax;
                }
                var ketqua = new KetQuaDuyet
                {
                    idBacSiTemp = id,
                    ThongBao = "Tài khoản của bạn đã được duyệt",
                    NgayDuyet = DateTime.Now
                };
                _dbcontext.ketQuaDuyet.Add(ketqua);
                _dbcontext.SaveChanges();
            }

            return RedirectToAction("Index");
        }
        public IActionResult Reject(int id)
        {
            var bs = _dbcontext.bacSiTemp.FirstOrDefault(a => a.idBacSiTemp == id);
            if (bs != null)
            {
                bs.TrangThai = 4;
                _dbcontext.SaveChanges();
                var ketqua = new KetQuaDuyet
                {
                    idBacSiTemp = id,
                    ThongBao = "Tài khoản của bạn đã bị từ chối",
                    NgayDuyet = DateTime.Now
                };
                _dbcontext.ketQuaDuyet.Add(ketqua);
                _dbcontext.SaveChanges();
            }
            return RedirectToAction("Index");
        }
        [HttpPost]
        public IActionResult AcceptAdditions(int id, string message)
        {
            string selectedItems = Request.Form["selectedItems[]"];
            if (!string.IsNullOrEmpty(selectedItems))
            {
                string[] selectedItemsArray = selectedItems.Split(',');
                string bangbosungJson = JsonConvert.SerializeObject(selectedItemsArray);
                var bst = _dbcontext.bacSiTemp.FirstOrDefault(a => a.idBacSiTemp == id);
                if (bst != null)
                {
                    bst.TrangThai = 2;
                    var ketqua = new KetQuaDuyet
                    {
                        idBacSiTemp = id,
                        BangBoSung = bangbosungJson,
                        ThongBao = message,
                        NgayDuyet = DateTime.Now
                    };
                    _dbcontext.ketQuaDuyet.Add(ketqua);
                    _dbcontext.SaveChanges();
                }
            }
            return RedirectToAction("Index");
        }
        public IActionResult DetailsBacSiBoSung(int? id)
        {
            int ktAccept = 0;

            var result = _dbcontext.proFileBoSung.Where(a => a.idBacSiTemp == id).Select(a => a.TrangThai).FirstOrDefault();
            if (result == 1)
            {
                ktAccept = 1;
                ViewBag.ktaccepts = ktAccept;
            }
            else if (result == 2)
            {
                ktAccept = 2;
                ViewBag.ktaccepts = ktAccept;
            }
            else if (result == 3)
            {
                ktAccept = 3;
                ViewBag.ktaccepts = ktAccept;
            }
            else
            {
                ktAccept = 4;
                ViewBag.ktaccepts = ktAccept;
            }
            var query = _dbcontext.proFileBoSung.Where(a => a.idBacSiTemp == id).ToList();
            var kqd = _dbcontext.ketQuaDuyet.Where(a => a.idBacSiTemp == id).OrderByDescending(a=>a.idKetQuaDuyet).Select(a => a.BangBoSung).FirstOrDefault();
            var kn = _dbcontext.proFileBoSung.FirstOrDefault(a => a.idBacSiTemp == id);

            ViewBag.kqd = kqd;
            if (kn != null)
            {
                ViewBag.KinhNghiemJson = kn.KinhNghiem;
                ViewBag.KyNangJson = kn.KyNangChuyenMon;
            }
            //var maxBangBoSung = (from kqd1 in _dbcontext.ketQuaDuyet
            //                     join bst in _dbcontext.bacSiTemp on kqd1.idBacSiTemp equals bst.idBacSiTemp
            //                     where bst.idBacSiTemp == id
            //                     select kqd1.BangBoSung).Max();
            //ViewBag.BangBoSung = maxBangBoSung;
            ViewBag.dsBangCap = _dbcontext.bangCap.Where(a => a.idBacSiTemp == id && a.idProfileBoSung == null).ToList();
            ViewBag.dsChungChi = _dbcontext.chungChi.Where(a => a.idBacSiTemp == id && a.idProfileBoSung == null).ToList();
            var bcBoSung = (from pr in _dbcontext.proFileBoSung
                                       join bc in _dbcontext.bangCap on pr.idProfileBoSung equals bc.idProfileBoSung
                                       where pr.idBacSiTemp == id
                                       select new { bc.idBangCap, bc.TenBangCap, bc.HinhAnh}).ToList();
            if (bcBoSung.Count > 0)
            {
                ViewBag.ktBC = 1;
                ViewBag.dsBangCapBoSung = bcBoSung;

            }
            //if (kqd != null)
            //{
            //    var kqdList = kqd.Trim('[', ']').Split(",");
            //    ViewBag.bbs = kqdList;
            //}    
           var ccBoSung = (from pr in _dbcontext.proFileBoSung
                                       join cc in _dbcontext.chungChi on pr.idProfileBoSung equals cc.idProfileBoSung
                                       where pr.idBacSiTemp == id
                                       select new { cc.idChungChi, cc.TenChungChi, cc.HinhAnh }).ToList();
            if (ccBoSung.Count > 0)
            {
                ViewBag.ktCC = 1;
                ViewBag.dsChungChiBoSung = ccBoSung;

            }
            var detailsbacsibosung = query.FirstOrDefault();
            return View(detailsbacsibosung);
        }
    }
}
