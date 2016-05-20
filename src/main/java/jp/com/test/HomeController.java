package jp.com.test;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	//データベース接続
	@Autowired
	   private JdbcTemplate jdbcTemplate;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	 public String home( Model model) {
		FormModel fm = new FormModel();
		int id = fm.getId();

		model.addAttribute("formModel",fm);
		List<Map<String,Object>>list = jdbcTemplate.queryForList("select * from entrytbl");
		List<Map<String,Object>> check = jdbcTemplate.queryForList("select * from checktbl where id="+id);
		model.addAttribute("list",list);
		int set = 0;
		int check1 = (Integer) check.get(0).get("check1");
		int check2 = (Integer) check.get(0).get("check2");
		int check3 = (Integer) check.get(0).get("check3");
		int check4 = (Integer) check.get(0).get("check4");

		return "question";
	}
	@RequestMapping(value = "/", method = RequestMethod.POST)
	 public String home(FormModel fm, Model model) {

	return "kotae";
	 }

	@RequestMapping(value = "ans/", method = RequestMethod.GET)
	public String end( FormModel fm,Model model){
		int id = fm.getId();
		List<Map<String,Object>>list = jdbcTemplate.queryForList("select * from entrytbl");
		List<Map<String,Object>>ans = jdbcTemplate.queryForList("select * from entrytbl where id="+id);
		model.addAttribute("list",list);
		model.addAttribute("ans",ans);


		return "kotae";
	}
}
