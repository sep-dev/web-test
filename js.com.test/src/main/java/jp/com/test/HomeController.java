package jp.com.test;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	//データベース接続
	@Autowired
	   private JdbcTemplate jdbcTemplate;

	@RequestMapping(value = "/" ,  method = RequestMethod.GET)
	public String entry(Model model){
	    return "home";
	}
   @RequestMapping(value = "/" ,  method = RequestMethod.POST)
    public String entry_form(@ModelAttribute FormModel fm,Model model){
       jdbcTemplate.update("insert into Entrytbl (title,text,select1,select2,select3,select4) VALUE (\"aaa\",\"aaa\",\"a\",\"a\",\"a\",\"a\");");
       return "home";
    }
	@RequestMapping(value = "/Q", method = RequestMethod.GET)
	 public String home( Model model) {
		FormModel fm = new FormModel();
		model.addAttribute("formModel",fm);
		List<Map<String,Object>> entrylist = jdbcTemplate.queryForList("select * from entrytbl");
		List<Map<String,Object>> checklist = jdbcTemplate.queryForList("select * from checktbl");
		model.addAttribute("list",entrylist);

		//entrylistの数を参考に、順番に変数numに数値を代入
		for(int num=0;num<entrylist.size();num++){
			System.out.print(num);
			int check1 = (Integer) checklist.get(num).get("check1");
			int check2 = (Integer) checklist.get(num).get("check2");
			int check3 = (Integer) checklist.get(num).get("check3");
			int check4 = (Integer) checklist.get(num).get("check4");

		//if文でそれぞれの成否確認
			int set = 0;
		if(check1==1){set+=1;}

		if(check2==1){set+=1;}

		if(check3==1){set+=1;}

		if(check4==1){set+=1;}

		//正解が1つのとき
		if(set==1){
			model.addAttribute("button","radio");
		//正解が複数のとき
		}else{
			model.addAttribute("button","checkbox");
			}
		}
		return "question";
	}
	@RequestMapping(value = "/Q", method = RequestMethod.POST)
	public String home(FormModel fm, Model model) {

	return "question";
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
