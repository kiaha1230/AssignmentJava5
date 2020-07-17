package controllers;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.StoredProcedureQuery;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.transaction.BeforeTransaction;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.microsoft.sqlserver.jdbc.SQLServerException;

import entity.DepartEntity;
import entity.StaffEntity;

@Controller
@Transactional
@RequestMapping("/depart/")
public class DepartController {
	@Autowired
	SessionFactory sessionFactory;

	@RequestMapping("list")
	public String Depart(ModelMap model) {
		List<DepartEntity> list = new ArrayList<>();
		String hql = "FROM DepartEntity";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		list = query.list();
		model.addAttribute("DepartList", list);
		return "depart/tableDepart";
	}

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(ModelMap model) {
		model.addAttribute("DepartEntity", new DepartEntity());
		return "depart/AddForm";
	}

// add new depart

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(ModelMap model, @ModelAttribute(value = "DepartEntity") DepartEntity departEntity) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.save(departEntity);
			transaction.commit();
			return "redirect:/depart/list.htm";
		} catch (Exception e) {
			transaction.rollback();
			model.addAttribute("message", "Thêm mới thất bại !");
			return "depart/AddForm";
		} finally {
			session.close();
		}

	}

	@RequestMapping(value = "edit", method = RequestMethod.GET)
	public String edit(ModelMap model, @RequestParam("Id") String Id) {
		Session session = sessionFactory.getCurrentSession();
		DepartEntity departEntity = (DepartEntity) session.get(DepartEntity.class, Id);
		model.addAttribute("DepartEntity", departEntity);
		return "depart/EditForm";
	}

// edit depart

	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String edit(ModelMap model, @ModelAttribute(value = "DepartEntity") DepartEntity departEntity) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.update(departEntity);
			transaction.commit();
			return "redirect:/depart/list.htm";
		} catch (Exception e) {
			transaction.rollback();
			model.addAttribute("message", "Sửa thất bại !");
			return "depart/AddForm";
		} finally {
			session.close();
		}

	}

	@ModelAttribute("DepartEntities")
	public List<DepartEntity> getDeparts() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM DepartEntity";
		Query query = session.createQuery(hql);
		List<DepartEntity> list = query.list();
		return list;

	}

	@RequestMapping("delete")
	public String delete(@RequestParam("Id") String Id, ModelMap model) throws SQLServerException {
		Session session = sessionFactory.getCurrentSession();
		DepartEntity departEntity = (DepartEntity) session.get(DepartEntity.class, Id);
		if (checkStaff(Id)) {
			session.delete(departEntity);
			return "redirect:/depart/list.htm";
		} else {
			model.addAttribute("departEntity", departEntity);
			return "depart/sure";
		}

	}

	@RequestMapping(params = "yes")
	public String delete2(@RequestParam("Id") String Id) {
		Session session = sessionFactory.getCurrentSession();
		DepartEntity departEntity = (DepartEntity) session.get(DepartEntity.class, Id);
		session.delete(departEntity);
		return "redirect:/depart/list.htm";
	}

	@RequestMapping(params = "no")
	public String toDepart() {
		return "redirect:/depart/list.htm";
	}

	// depart statistic

	@RequestMapping("DepartStatistic")
	public String staffstatistic(ModelMap model) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "SELECT  r.staffEntity.departEntity.Name, SUM(case when r.Type=1 then 1 else 0 end),   SUM(case when r.Type=0 then 1 else 0 end) FROM RecordEntity r   GROUP BY r.staffEntity.departEntity.Name order by (SUM(case when r.Type=1 then 1 else 0 end) - SUM(case when r.Type=0 then 1 else 0 end)) desc";
		Query query = session.createQuery(hql);
		List<Object[]> list = query.list();
		model.addAttribute("arrays", list);
		return "statistic/DepartStatistic";
	}

	public boolean checkStaff(String DepartID) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM StaffEntity s where s.departEntity.Id = :id  ";
		Query query = session.createQuery(hql);
		query.setParameter("id", DepartID);
		List<StaffEntity> list = query.list();
		if (list.isEmpty()) {
			return true;
		} else {
			return false;
		}

	}

}
