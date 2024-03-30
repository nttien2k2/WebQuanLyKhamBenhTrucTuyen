using DACN_Quan_Ly_Kham_Chua_Benh.Data;
using DACN_Quan_Ly_Kham_Chua_Benh.ViewModel;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Linq;

namespace DACN_Quan_Ly_Kham_Chua_Benh.Controllers
{
    public class ThongKeController : Controller
    {
        private readonly DBContext _context;
        public ThongKeController(DBContext context)
        {
            _context = context;
        }
        [HttpGet]
        //public IActionResult Index(DateTime? ngayBatDau, DateTime? ngayKetThuc)
        //{
        //    var query = _context.LichKham
        //    .Where(lk => lk.ThoiGianBatDau >= ngayBatDau && lk.ThoiGianBatDau <= ngayKetThuc)
        //    .GroupBy(lk => new { lk.ThoiGianBatDau, lk.ThoiGianKetThuc, lk.TrangThai })
        //    .Select(group => new ThongKeViewModel
        //    {
        //        ThoiGianBatDau = group.Key.ThoiGianBatDau,
        //        ThoiGianKetThuc = group.Key.ThoiGianKetThuc,
        //        TrangThai = group.Key.TrangThai,
        //        SoLuong = group.Count()
        //    })
        //    .ToList();
        //    ViewBag.Length1 = query.Count(lk => lk.TrangThai == 1);
        //    ViewBag.Length2 = query.Count(lk => lk.TrangThai == 2);
        //    ViewBag.Length3 = query.Count(lk => lk.TrangThai == 3);

        //    if(ngayBatDau != null && ngayKetThuc != null)
        //    {
        //        ViewBag.check = query.Count;
        //    }                      
        //    return View(query);
        //}

        public IActionResult Index(DateTime? ngayBatDau, DateTime? ngayKetThuc, int? thongKeOption, string selectedBacSi)
        {
            List<ThongKeViewModel> query = new List<ThongKeViewModel>();

            if (thongKeOption.HasValue)
            {
                if (thongKeOption == null)
                {
                    ViewBag.Thongbao = $"Vui lòng chọn trạng thái thống kê";
                }
                else if (thongKeOption == 1)
                {
                    query = _context.LichKham
                        .Where(lk => lk.ThoiGianBatDau >= ngayBatDau && lk.ThoiGianBatDau <= ngayKetThuc)
                        .GroupBy(lk => new { lk.ThoiGianBatDau, lk.ThoiGianKetThuc, lk.TrangThai })
                        .Select(group => new ThongKeViewModel
                        {
                            ThoiGianBatDau = group.Key.ThoiGianBatDau,
                            ThoiGianKetThuc = group.Key.ThoiGianKetThuc,
                            TrangThai = group.Key.TrangThai,
                            SoLuong = group.Count()
                        })
                        .ToList();
                    ViewBag.ThongKeMessage1 = $"Thời gian từ {ngayBatDau} đến {ngayKetThuc}";
                }
                else if (thongKeOption == 2)
                {
                    var baseQuery = _context.LichKham
                        .Join(_context.BacSi, lk => lk.idBacSi, bs => bs.idBacSi,
                            (lichKham, bacSi) => new ThongKeViewModel
                            {
                                LichKhamId = lichKham.idLichKham,
                                TrangThai = lichKham.TrangThai,
                                ThoiGianBatDau = lichKham.ThoiGianBatDau,
                                ThoiGianKetThuc = lichKham.ThoiGianKetThuc,
                                TenBS = bacSi.TenBS ?? string.Empty,
                            });

                    if (!string.IsNullOrEmpty(selectedBacSi))
                    {
                        baseQuery = baseQuery
                            .Where(lk => (!ngayBatDau.HasValue || (lk.ThoiGianBatDau >= ngayBatDau && lk.ThoiGianBatDau <= ngayKetThuc)) &&
                                         (string.IsNullOrEmpty(selectedBacSi) || lk.TenBS == selectedBacSi));
                        ViewBag.ThongKeMessage = $"Thống kê lịch khám theo Bác Sĩ: {selectedBacSi}";
                        ViewBag.ThongKeMessage2 = $"Thời gian từ {ngayBatDau} đến {ngayKetThuc}";
                    }

                    query = baseQuery.ToList();
                }
                else if (thongKeOption == 3)
                {
                    var doanhThuNam = _context.LichKham
                        .GroupBy(lk => new { Nam = lk.ThoiGianBatDau.Year })
                        .Select(group => new ThongKeViewModel
                        {
                            Nam = group.Key.Nam,
                            TongDoanhThu = (float)group.Sum(l => l.ThanhTien)
                        })
                        .OrderBy(result => result.Nam)
                        .ToList();
                    query = doanhThuNam;
                    ViewBag.DoanhThuNam = doanhThuNam;
                }

                ViewBag.Length1 = query.Count(lk => lk.TrangThai == 1);
                ViewBag.Length2 = query.Count(lk => lk.TrangThai == 2);
                ViewBag.Length3 = query.Count(lk => lk.TrangThai == 3);
            }

            ViewBag.ThongKeOptions = new SelectList(new[]
            {
                new { ID = 0, Name = "Chọn Thống Kê" },
                new { ID = 1, Name = "Theo Lịch Khám" },
                new { ID = 2, Name = "Thống kê lịch khám theo bác sĩ" },
                new { ID = 3, Name = "Thống kê tổng doanh thu" },
                    }, "ID", "Name", thongKeOption);
            var dsBacSi = _context.BacSi.ToList();
            ViewBag.BacSiList = new SelectList(dsBacSi, "TenBS", "TenBS");
            return View(query);
        }
        //[HttpGet]
        //public IActionResult ThongKeBacSi(DateTime? ngayBatDau, DateTime? ngayKetThuc, string selectedBacSi)
        //{
        //    var query = from lk in _context.LichKham
        //                join bs in _context.BacSi on lk.idBacSi equals bs.idBacSi
        //                join bn in _context.BenhNhan on lk.idBenhNhan equals bn.idBenhNhan
        //                select new ThongKeViewModel
        //                {
        //                    LichKhamId = lk.idLichKham,
        //                    TrangThai = lk.TrangThai,
        //                    ThoiGianBatDau = lk.ThoiGianBatDau,
        //                    ThoiGianKetThuc = lk.ThoiGianKetThuc,
        //                    TenBS = bs.TenBS ?? string.Empty,
        //                    TenBN = bn.TenBN ?? string.Empty,
        //                };
        //    if (!string.IsNullOrEmpty(selectedBacSi))
        //    {
        //        query = query.Where(lk => (!ngayBatDau.HasValue || (lk.ThoiGianBatDau >= ngayBatDau && lk.ThoiGianBatDau <= ngayKetThuc)) &&
        //                                   (string.IsNullOrEmpty(selectedBacSi) || lk.TenBS == selectedBacSi));
        //        ViewBag.ThongKeMessage = $"Thống kê lịch khám theo Bác Sĩ: {selectedBacSi}";
        //    }
        //    ViewBag.Length1 = query.Count(lk => lk.TrangThai == 1);
        //    ViewBag.Length2 = query.Count(lk => lk.TrangThai == 2);
        //    ViewBag.Length3 = query.Count(lk => lk.TrangThai == 3);
        //    var lichKhamCount = query.ToList();
        //    ViewBag.Length = lichKhamCount.Count;
        //    var dsBacSi = _context.BacSi.ToList();
        //    ViewBag.BacSiList = new SelectList(dsBacSi, "TenBS", "TenBS");
        //    if (ngayBatDau != null && ngayKetThuc != null)
        //    {
        //        ViewBag.check = lichKhamCount.Count;
        //    }
        //    return View(lichKhamCount);
        //}
    }
}
