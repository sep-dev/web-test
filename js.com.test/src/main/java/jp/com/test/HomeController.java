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

	@RequestMapping(value = "/E" ,  method = RequestMethod.GET)
	public String entry(Model model){
	    return "home";
	}
	@RequestMapping(value = "/Q", method = RequestMethod.GET)
	 public String home( Model model) {
		FormModel fm = new FormModel();

		model.addAttribute("formModel",fm);
		List<Map<String,Object>>list = jdbcTemplate.queryForList("select * from entrytbl");
		model.addAttribute("list",list);

		return "question";
	}
	@RequestMapping(value = "/Q", method = RequestMethod.POST)
	 public String home(FormModel fm, Model model) {

	return "answer";
	 }

	@RequestMapping(value = "/A", method = RequestMethod.GET)
	public String end( FormModel fm,Model model){
		int id = fm.getId();
		List<Map<String,Object>>list = jdbcTemplate.queryForList("select * from entrytbl");
		List<Map<String,Object>>ans = jdbcTemplate.queryForList("select * from entrytbl where id="+id);
		model.addAttribute("list",list);
		model.addAttribute("ans",ans);


		return "answer";
	}
}
