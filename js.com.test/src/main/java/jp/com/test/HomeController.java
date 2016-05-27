package jp.com.test;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
           model.addAttribute("message1", "真実はいつもひとつ。");
           return "home";
       }else if (fm.isCheck1() == true & fm.isCheck2()== true & fm.isCheck3() == true &
               fm.isCheck4() == true){
           model.addAttribute("message1", "真実は１つから３つまで。");
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
	 public String home( Model model , HttpServletRequest request,HttpServletResponse response) throws Exception  {

	    FormModel fm = new FormModel();
		model.addAttribute("formModel",fm);
		List<String> checkradio= new ArrayList<String>();
		List<Map<String,Object>> entrylist = jdbcTemplate.queryForList("select * from entrytbl");
		List<Map<String,Object>> checklist = jdbcTemplate.queryForList("select * from checktbl");
		model.addAttribute("entrylist",entrylist);
		model.addAttribute("checklist",checklist);
		//entrylistの数を参考に、順番に変数numに数値を代入
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
    		//正解が1つのとき
    		if(set==1){
    		    checkradio.add("radio");
    		//正解が複数のとき
    		}else{
    		    checkradio.add("checkbox");
    		}
    	}
		model.addAttribute("button", checkradio);
		model.addAttribute("delete", "<input type = \"button\" value =\"問題の全削除\" onClick = \"location.href='http://localhost:8080/test/Alldelete'\" >");
		response.getWriter();
		return "question";
	}
	@RequestMapping(value = "/Q", method = RequestMethod.POST)
	public String home(FormModel fm, Model model, HttpServletRequest request,HttpServletResponse response)
	        throws Exception {
	    List<Map<String,Object>> entrylist = jdbcTemplate.queryForList("select * from entrytbl");
	    List<Map<String,Object>>checklist = jdbcTemplate.queryForList("select * from checktbl");
        model.addAttribute("entrylist",entrylist);
        model.addAttribute("checklist",checklist);
	    List<Integer> ans1 = new ArrayList<Integer>();
	    List<Integer> ans2 = new ArrayList<Integer>();
	    List<Integer> ans3 = new ArrayList<Integer>();
	    List<Integer> ans4 = new ArrayList<Integer>();

	    for(Integer i=0;i<checklist.size();i++){
	        String s1 = request.getParameter("ans"+i+"-1");
	        String s2 = request.getParameter("ans"+i+"-2");
	        String s3 = request.getParameter("ans"+i+"-3");
	        String s4 = request.getParameter("ans"+i+"-4");
             if(s1!=null&&s2==null&&s3==null&&s4==null){ //ラジオボタンの判定
                 if("check1".equals(s1)){
                     ans1.add(1);
                     ans2.add(0);
                     ans3.add(0);
                     ans4.add(0);
                 }else if("check2".equals(s1)){
                     ans1.add(0);
                     ans2.add(1);
                     ans3.add(0);
                     ans4.add(0);
                 }else if("check3".equals(s1)){
                     ans1.add(0);
                     ans2.add(0);
                     ans3.add(1);
                     ans4.add(0);
                 }else if("check4".equals(s1)){
                     ans1.add(0);
                     ans2.add(0);
                     ans3.add(0);
                     ans4.add(1);
                 }
             }else{
                 if("check1".equals(s1)){
                     ans1.add(1);
                 }else{
                     ans1.add(0);
                 }
                 if("check2".equals(s2)){
                     ans2.add(1);
                 }else{
                     ans2.add(0);
                 }
                 if("check3".equals(s3)){
                     ans3.add(1);
                 }else{
                     ans3.add(0);
                 }
                 if("check4".equals(s4)){
                     ans4.add(1);
                 }else{
                     ans4.add(0);
                 }
             }

            model.addAttribute("ans1", ans1);
            model.addAttribute("ans2", ans2);
            model.addAttribute("ans3", ans3);
            model.addAttribute("ans4", ans4);
	    }
	    model.addAttribute("delete", "<input type = \"button\" value =\"問題の全削除\" onClick = \"location.href='http://localhost:8080/test/Alldelete'\" >");

	return "answer";
	 }
	@RequestMapping(value = "/A", method = RequestMethod.GET)
	public String answer( FormModel fm,Model model, HttpServletRequest request,HttpServletResponse response)
            throws Exception {


        return "answer";
	}

   @RequestMapping(value = "/A", method = RequestMethod.POST)
    public String answer_form(FormModel fm, Model model) {
    return "question";
     }

}
