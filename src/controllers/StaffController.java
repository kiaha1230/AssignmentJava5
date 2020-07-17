package controllers;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.StringMultipartFileEditor;

import entity.DepartEntity;
import entity.StaffEntity;

@Controller
@Transactional
@RequestMapping("/staffs/")
public class StaffController {
	@Autowired
	SessionFactory sessionFactory;
	@Autowired
	ServletContext context;

	@RequestMapping("list")
	public String Staff(ModelMap model) {
		List<StaffEntity> list = new ArrayList<>();
		String hql = "FROM StaffEntity";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		list = query.list();
		model.addAttribute("StaffList", list);
		return "staff/tableStaff";
	}

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(ModelMap model) {
		model.addAttribute("StaffEntity", new StaffEntity());
		return "staff/AddForm";
	}

// add new staff

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(ModelMap model, @ModelAttribute(value = "StaffEntity") StaffEntity staffEntity,

			@RequestParam("Photo") MultipartFile photo, @RequestParam("Birthday") String Birthday) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			String photoPath = context.getRealPath("/images/" + photo.getOriginalFilename());
			photo.transferTo(new File(photoPath));
		} catch (Exception e) {
			model.addAttribute("message", "Lỗi lưu file !");
		}
		staffEntity.setPhoto(photo.getOriginalFilename());

		try {
			session.save(staffEntity);
			transaction.commit();
			return "redirect:/staffs/list.htm";
		} catch (Exception e) {
			transaction.rollback();
			model.addAttribute("message", "Thêm mới thất bại !");
			return "staff/AddForm";
		} finally {
			session.close();
		}

	}

// model attribute
	@ModelAttribute("departEntities")
	public List<DepartEntity> getDeparts() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM DepartEntity";
		Query query = session.createQuery(hql);
		List<DepartEntity> list = query.list();
		return list;

	}

	// show u where the error coming from
	@ExceptionHandler
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	public void handle(Exception e) {
		e.printStackTrace();
	}

	// bind the multipartfile, i still dont get it
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(String.class, new StringMultipartFileEditor());
	}

// bind the date from form
	@InitBinder
	public void initBinder1(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}

	// edit staff here
	@RequestMapping(value = "edit", method = RequestMethod.GET)
	public String edit(ModelMap model, @RequestParam("Id") String Id) {
		Session session = sessionFactory.getCurrentSession();
		StaffEntity staffEntity = (StaffEntity) session.get(StaffEntity.class, Id);
		model.addAttribute("StaffEntity", staffEntity);
		return "staff/EditForm";
	}

	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String edit(ModelMap model, @ModelAttribute(value = "StaffEntity") StaffEntity staffEntity,
			@RequestParam(value = "Photo", required = false) MultipartFile photo,
			@RequestParam("Birthday") String Birthday, @RequestParam(value = "here", required = false) String current) {
		model.addAttribute("StaffEntity", new StaffEntity());
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		String img = "";
		if (!photo.getOriginalFilename().equals("")) {
			try {
				String photoPath = context.getRealPath("/images/" + photo.getOriginalFilename());
				photo.transferTo(new File(photoPath));
				img = photo.getOriginalFilename();
			} catch (Exception e) {
				model.addAttribute("message", "Lỗi lưu file !");
			}
		} else {
			img = current;
		}
		staffEntity.setPhoto(img);
		try {
			session.update(staffEntity);
			transaction.commit();
			return "redirect:/staffs/list.htm";
		} catch (Exception e) {
			transaction.rollback();
			model.addAttribute("message", "Sửa thất bại !");
			return "staff/EditForm";
		} finally {
			session.close();
		}
	}

	@ModelAttribute("staffEntities")
	public List<StaffEntity> getStaffs() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM StaffEntity";
		Query query = session.createQuery(hql);
		List<StaffEntity> list = query.list();
		return list;
	}

	@RequestMapping("delete")
	public String delete(@RequestParam("Id") String Id, ModelMap model) {
		Session session = sessionFactory.getCurrentSession();
		StaffEntity staffEntity = (StaffEntity) session.get(StaffEntity.class, Id);
		if (checkRecord(Id)) {
			session.delete(staffEntity);
			return "redirect:/staffs/list.htm";
		} else {
			model.addAttribute("staffEntity", staffEntity);
			return "staff/sure";
		}

	}

	@RequestMapping(params = "yes")
	public String delete2(@RequestParam("Id") String Id) {
		Session session = sessionFactory.getCurrentSession();
		StaffEntity staffEntity = (StaffEntity) session.get(StaffEntity.class, Id);
		session.delete(staffEntity);
		return "redirect:/staffs/list.htm";
	}

	@RequestMapping(params = "no")
	public String toStaff() {
		return "redirect:/staffs/list.htm";
	}

	// thong ke nhan vien nhan vien
	@RequestMapping("StaffStatistic")
	public String staffstatistic(ModelMap model) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "SELECT  r.staffEntity.Name, " + " SUM(case when r.Type=1 then 1 else 0 end), "
				+ " SUM(case when r.Type=0 then 1 else 0 end) " + " FROM RecordEntity r "
				+ " GROUP BY r.staffEntity.Name order by (SUM(case when r.Type=1 then 1 else 0 end) - SUM(case when r.Type=0 then 1 else 0 end)) desc";
		Query query = session.createQuery(hql);
		List<Object[]> list = query.list();
		model.addAttribute("arrays", list);
		return "statistic/StaffStatistic";
	}

	@RequestMapping("top10")
	public String top10(ModelMap model) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "SELECT   r.staffEntity.Name, r.staffEntity.Photo, r.staffEntity.departEntity.Name ,SUM(case when r.Type=1 then 1 else 0 end), SUM(case when r.Type=0 then 1 else 0 end) FROM RecordEntity r "
				+ " GROUP BY r.staffEntity.Name,r.staffEntity.Photo, r.staffEntity.departEntity.Name order by (SUM(case when r.Type=1 then 1 else 0 end) - SUM(case when r.Type=0 then 1 else 0 end)) desc";
		Query query = session.createQuery(hql);
		query.setMaxResults(10);
		List<Object[]> list = query.list();
		model.addAttribute("arrays", list);
		return "main/start";
	}

	public boolean checkRecord(String StaffID) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM RecordEntity r where r.staffEntity.Id = :id  ";
		Query query = session.createQuery(hql);
		query.setParameter("id", StaffID);
		List<StaffEntity> list = query.list();
		if (list.isEmpty()) {
			return true;
		} else {
			return false;
		}

	}

}
