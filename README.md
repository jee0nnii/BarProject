# BarProject
----
## 1. 현재 진행 상황 
* 변경사항 : 첫 페이지에서 로그인을 해야만 메인페이지로 접근가능 --> 메인 페이지에서 로그인 하도록
### 1.1 프로젝트 생성 및 설정
* Spring Web project 생성
  * com.bar.main
    * dao
    * service
    * vo
      * DrinkVO
    * web
      * MainController
  * com.bar.member
    * vo
      * MemberVO
    * web
      * MemberController
  * src.main.webapp.WEB-INF
    * spring
      * ***aplicationContext.xml*** 계속 변경해야 됨!!
    * static
    * view
      * bar
        * main.jsp
        * login.jsp

* web.xml / pom.xml 설정
### 1.2 vo
#### 1.2.1 MemberVO
```
public class MemberVO{
 private int id;
 private String name;
 private String account;
 private String password;
 private String nickname;
 private String email;
 private Date birthday;
}

```
#### 1.2.2 DrinkVO
```
public class DrinkVO{
 private int drinkId;
 private String drinkName;
 private float volume;
 private String country;
 private String type;
 private String desc;
 private String drinkImg;
 private int likePoint;
 private int hatePoint;
}
```

* 내가 보유한 제품 리스트와 원하는 제품에 대한 리스트를 표현할 때 VO를 다르게 가져야 될까??
* 업데이트 될 경우를 고려해야되니까

### 1.3 WEB 띄우기
http://192.168.201.17:8080/jb/main
        
### 1.4 TODO TIL 0319
* 로그인(ADMIN/1234) 완성시키기
* Drink List 보여주기
* Wish List 글쓰기
