package jp.com.test;

import org.hibernate.validator.constraints.NotEmpty;

public class FormModel {
   //正否の判定
    private boolean check1;
    private boolean check2;
    private boolean check3;
    private boolean check4;

    public boolean isCheck1() {
        return check1;
    }
    public void setCheck1(boolean check1) {
        this.check1 = check1;
    }
    public boolean isCheck2() {
        return check2;
    }
    public void setCheck2(boolean check2) {
        this.check2 = check2;
    }
    public boolean isCheck3() {
        return check3;
    }
    public void setCheck3(boolean check3) {
        this.check3 = check3;
    }
    public boolean isCheck4() {
        return check4;
    }
    public void setCheck4(boolean check4) {
        this.check4 = check4;
    }
    //正否の判定


    //入力フォームの内容
    @NotEmpty(message  = "タイトルを入力してください。")
    private String title;
    @NotEmpty(message = "本文を入力してください。")
    private String text;
    @NotEmpty(message = "選択肢は全て入力してください。")
    private String select1;
    @NotEmpty(message = "選択肢は全て入力してください。")
    private String select2;
    @NotEmpty(message = "選択肢は全て入力してください。")
    private String select3;
    @NotEmpty(message = "選択肢は全て入力してください。")
    private String select4;

    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }

    public String getText() {
        return text;
    }
    public void setText(String text) {
        this.text = text;
    }

    public String getSelect1() {
        return select1;
    }
    public void setSelect1(String select1) {
        this.select1 = select1;
    }

    public String getSelect2() {
        return select2;
    }
    public void setSelect2(String select2) {
        this.select2 = select2;
    }

    public String getSelect3() {
        return select3;
    }
    public void setSelect3(String select3) {
        this.select3 = select3;
    }

    public String getSelect4() {
        return select4;
    }
    public void setSelect4(String select4) {
        this.select4 = select4;
    }
    //入力フォームの内容終わり

    //汎用
    private String delete;
    public String getDelete() {
        return delete;
    }
    public void setDelete(String delete) {
        this.delete = delete;
    }

    private String message1;
    public String getMessage1() {
        return message1;
    }
    public void setMessage1(String message1) {
        this.message1 = message1;
    }

    //汎用終わり
    //答え合わせで使う


}
