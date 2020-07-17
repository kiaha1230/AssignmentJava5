package controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import bean.Mailer;
import entity.DepartEntity;
import entity.RecordEntity;
import entity.StaffEntity;
import entity.UserEntity;

@Controller
@Transactional
@RequestMapping("/record/")
public class RecordController {
	@Autowired
	SessionFactory sessionFactory;
	@Autowired
	Mailer mailer;

	@RequestMapping("list")
	public String list(ModelMap model) {
		List<Object[]> list = new ArrayList<>();
		String hql = "FROM RecordEntity";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		list = query.list();
		model.addAttribute("RecordList", list);
		return "record/tableRecord";
	}

	@ModelAttribute("staffEntities")
	public List<StaffEntity> getStaffs() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM StaffEntity";
		Query query = session.createQuery(hql);
		List<StaffEntity> list = query.list();
		return list;
	}

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(ModelMap model) {
		model.addAttribute("RecordEntity", new RecordEntity());
		return "record/AddForm";
	}

// add new record

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(ModelMap model, @ModelAttribute(value = "RecordEntity") RecordEntity recordEntity) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		StaffEntity staff = (StaffEntity) session.get(StaffEntity.class, recordEntity.getStaffEntity().getId());
		sendMail(recordEntity.getType(), recordEntity.getReason(), recordEntity.getDate(), staff.getEmail());
		try {
			session.save(recordEntity);
			transaction.commit();
			return "redirect:/record/list.htm";
		} catch (Exception e) {
			transaction.rollback();
			model.addAttribute("message", "Thêm mới thất bại !");
			return "record/AddForm";
		} finally {
			session.close();
		}

	}

	@RequestMapping(value = "edit", method = RequestMethod.GET)
	public String edit(ModelMap model, @RequestParam("Id") int Id) {
		Session session = sessionFactory.getCurrentSession();
		RecordEntity recordEntity = (RecordEntity) session.get(RecordEntity.class, Id);
		model.addAttribute("RecordEntity", recordEntity);
		return "record/EditForm";
	}

// add new record

	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String edit(ModelMap model, @ModelAttribute(value = "RecordEntity") RecordEntity recordEntity) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.update(recordEntity);
			transaction.commit();
			return "redirect:/record/list.htm";
		} catch (Exception e) {
			transaction.rollback();
			model.addAttribute("message", "Sửa thất bại !");
			return "record/AddForm";
		} finally {
			session.close();
		}

	}

	@RequestMapping("delete")
	public String delete(@RequestParam("Id") int Id) {
		Session session = sessionFactory.getCurrentSession();
		RecordEntity recordEntity = (RecordEntity) session.get(RecordEntity.class, Id);
		session.delete(recordEntity);
		return "redirect:/record/list.htm";
	}

	@InitBinder
	public void initBinder1(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}

	public void sendMail(int Type, String reason, String date, String to) {
		String from = "SRTDash";
		String subject = "Khen thưởng và kỉ luật";
		String loai = "";
		if (Type == 1) {
			loai = "Khen thưởng";
		} else {
			loai = "Kỉ luật";
		}

		String body = "Bạn có một " + loai + " vào ngày " + date + "\n" + " Lí do : " + reason;
		mailer.send(from, to, subject, body);

	}
}
