package jp.com.test;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
	    FormModel fm  = new FormModel();
	    model.addAttribute("FormModel", fm);
	    model.addAttribute("delete", "<input type = \"button\" value =\"問題の全削除\" onClick = \"location.href='http://localhost:8080/test/Alldelete'\" >");
	    return "home";
	}
   @RequestMapping(value = "/" ,  method = RequestMethod.POST)
    public String entry_form(@Valid  @ModelAttribute FormModel fm,BindingResult result,Model model){
       model.addAttribute("delete", "<input type = \"button\" value =\"問題の全削除\" onClick = \"location.href='http://localhost:8080/test/Alldelete'\" >");
       if(result.hasErrors()){
           return "home";
       }else if (fm.isCheck1() == false & fm.isCheck2()== false & fm.isCheck3() == false &
               fm.isCheck4() == false){
           model.addAttribute("message1", "正解を設定してください。");
           return "home";
       }
       else{
           jdbcTemplate.update("insert into Entrytbl (title,text,select1,select2,select3,select4) VALUE (?,?,?,?,?,?);"
                   ,fm.getTitle(),fm.getText(),fm.getSelect1(),fm.getSelect2(),fm.getSelect3(),fm.getSelect4());
           jdbcTemplate.update("insert into Checktbl (check1,check2,check3,check4) VALUE (?,?,?,?)"
                   ,fm.isCheck1(),fm.isCheck2(),fm.isCheck3(),fm.isCheck4());
           return "home";
       }
    }
   @RequestMapping(value = "/Alldelete" , method = RequestMethod.GET)
     public String delete (Model model){
       model.addAttribute("message1", "本当に削除してもよろしかったでしょうか？");
       model.addAttribute("message2", "データを全て消去します。");
       model.addAttribute("message3", "<input type =submit value =\"実行\">");
       return "kakunin";
   }
   @RequestMapping(value = "/Alldelete" , method = RequestMethod.POST)
   public String delete (FormModel fm,Model model){
       jdbcTemplate.update("delete from Entrytbl");
       jdbcTemplate.update("delete from Checktbl");
       jdbcTemplate.update("ALTER TABLE Entrytbl AUTO_INCREMENT = 1");
       jdbcTemplate.update("ALTER TABLE Checktbl AUTO_INCREMENT = 1");
     return "redirect:/";
 }
	@RequestMapping(value = "/Q", method = RequestMethod.GET)
	 public String home( Model model) {
		FormModel fm = new FormModel();
		model.addAttribute("formModel",fm);
		//新しい配列の作成(checkradio)
		List<String> checkradio= new ArrayList<String>();
		List<Map<String,Object>> entrylist = jdbcTemplate.queryForList("select * from entrytbl");
		List<Map<String,Object>> checklist = jdbcTemplate.queryForList("select * from checktbl");
		model.addAttribute("entrylist",entrylist);
		model.addAttribute("checklist",checklist);

		//entrylistのlist数を参考に、変数numに数値を代入
		for(int num=0;num<entrylist.size();num++){
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

		//正解が1つのとき、配列に"radio"を入れる
		if(set==1){
		    checkradio.add("radio");

		//正解が複数のとき、配列に"checkbox"を入れる
		}else{
		    checkradio.add("checkbox");
			}
		}
		model.addAttribute("button", checkradio);
		model.addAttribute("delete", "<input type = \"button\" value =\"問題の全削除\" "
				+ "onClick = \"location.href='http://localhost:8080/test/Alldelete'\" >");
		return "question";
	}
	@RequestMapping(value = "/Q", method = RequestMethod.POST)
	public String home(FormModel fm, Model model) {
	return "question";
	 }
	@RequestMapping(value = "/A", method = RequestMethod.GET)
	public String end( FormModel fm,Model model){
		List<Map<String,Object>>entrylist = jdbcTemplate.queryForList("select * from entrytbl");
		List<Map<String,Object>>checklist = jdbcTemplate.queryForList("select * from checktbl");
		model.addAttribute("entrylist",entrylist);
		model.addAttribute("checklist",checklist);
		return "answer";
	}

}
