# Bar Project
---
- [Bar Project](#bar-project)
  * [[TOC]](#-toc-)
  * [1. 설정](#1---)
    + [1) 프로젝트를 진행하기 전에 해놓을 설정들](#1-----------------------)
    + [2) 지속적으로 바꿔 나갈 설정들](#2-----------------)
    + [3) 추가 설정](#3-------)
  * [2. 진행상황](#2-----)
    + [0319](#0319)
    + [0326](#0326)
      - [MADEIT_1 :: 로그인 로그아웃 세션상태확인](#madeit-1-------------------)
      - [MADEIT_2 :: 비밀번호 암호화](#madeit-2------------)
      - [TODO_3 :: 회원가입 중복처리( 이메일, 닉네임 )](#todo-3-------------------------)
    + [0402](#0402)
      - [TODO_1 :: 중복처리](#todo-1--------)
      - [TODO_2 :: 생년월일 - 시작년도 주기](#todo-2------------------)
      - [TODO_3 :: 리스트 페이지 만들기(맥주등록, 글쓰기, 마이페이지)](#todo-3---------------------------------)
  * [WEB](#web)
  * [DB확인](#db--)
---
## 1. 설정
### 1) 프로젝트를 진행하기 전에 해놓을 설정들
- STS 설정
- DYNAMIC WEB PROJECT 생성
- CONVERT TO MAVEN
- pom.xml 에 dependency 추가
- rootContext.xml 변경사항 고치기
### 2) 지속적으로 바꿔 나갈 설정들
- pom.xml
  - **dependency** 추가
- web.xml
- dao / sql / * .xml
  - **SQL Query**
- mybatis.xml
  - typeAlias
  - mapper
- applicationContext.xml
  - interceptor
- dao, daoimplfororacle, service, serviceimpl, controller
### 3) 추가 설정
- SourceTree 사용
  - STS & GIT 연동

---
## 2. 진행상황
### 0319
 - 구현부분 : 회원가입 완료
 - 추가사항 : 로그인과 연결

**++**
 1. pom.xml
- spring-webmvc, jstl, standard
- hibernate-validator
- mybatis-spring, mybatis, spring-jdbc, aspectweaver, commons-dbcp
 2. web.xml
- dispatcherServlet, characterEncoding, contextLoaderListener(설정파일 분리)
 3. userDao.xml
- insertUser 쿼리 추가
 4. mybatis.xml
```
<typeAlias type="com.bar.user.vo.UserVO" alias="UserVO"/>
<mapper resource="com/bar/user/dao/sql/userDao.xml"/>
```
 5. applicationContext.xml
- <mvc:annitation-driven
- <mvc:resources
- validator
- viewResolver

- **의존성 추가**
  - userController
    - UserService
  - UserService
      - userDao
  - userDao
    - SqlSessionTemplate

 6. dao, daoimplfororacle, service, serviceimpl, controller
```
**DAO
public interface UserDAO {
  //회원가입
  public int insertUser(UserVO userVO);
}

**DAOIMPLFORORACLE
public class UserDaoImplForOracle extends SqlSessionDaoSupport implements UserDAO {
  @Override
  public int insertUser(UserVO userVO) {
    return getSqlSession().insert("UserDAO.insertUser", userVO);
  }
}

**USERSERVICE
public interface UserService {
  public boolean createUser(UserVO user);
}

**USERSERVICEIMPL
public class UserServiceImpl implements UserService{
  private UserDAO userDao;
  public void setUserDao(UserDAO userDao) {
    this.userDao = userDao;
  }
  @Override
  public boolean createUser(UserVO userVO) {
    return userDao.insertUser(userVO)>0;
  }
}

**USERCONTROLLER
@Controller
public class UserController {
  private UserService userService;
  public void setUserService(UserService userService) {
    this.userService = userService;
  }
  @RequestMapping(value = "/main", method = RequestMethod.GET)
  public String viewMainPage() {
    return "bar/main";
  }
  @RequestMapping(value="/login", method = RequestMethod.GET)
  public String viewLoginPage() {
    return "user/login";
  }
  //회원가입
  @RequestMapping(value = "/join", method = RequestMethod.GET)
  public String viewJoinPage() {
    return "user/join";
  }

  @RequestMapping(value = "/join", method = RequestMethod.POST)
  public ModelAndView doJoinAction(@ModelAttribute("joinForm")
	   @Valid UserVO userVO, Errors errors) {
       if ( userService.createUser(userVO)) {
         return new ModelAndView("redirect:/login");
       }
       return new ModelAndView("redirect:/join");
     }
}
```

### 0326
#### MADEIT_1 :: 로그인 로그아웃 세션상태확인
 1. UserDAO
```
//로그인 한 사람 정보 가져오기
public UserVO selectUser(UserVO userVO);
```
 2. UserDaoImplForOracle
```
@Override
public UserVO selectUser(UserVO userVO) {
  return getSqlSession().selectOne("UserDAO.selectUser", userVO);
}
```
 3. UserService
```
public UserVO readUser(UserVO userVO);
```
 4. UserServiceImpl
```
@Override
public UserVO readUser(UserVO userVO) {
  return userDao.selectUser(userVO);
  }
```
 5. Contstants
```
USER = " __USER__ "
```

 6. UserController
```
//로그인
@RequestMapping(value = "/login", method = RequestMethod.GET)
public String viewLoginPage(HttpSession session) {
  if (session.getAttribute(User.USER) != null) {
    return "redirect:/main";
  }
  return "user/login";
}

@RequestMapping(value = "/login", method = RequestMethod.POST)
public String doLoginAction(@ModelAttribute("loginForm")
  @Valid UserVO userVO, Errors errors, HttpServletRequest req) {
    HttpSession session = req.getSession();
    UserVO loginUser = userService.readUser(userVO);
    if (loginUser != null) {
      session.setAttribute(User.USER, loginUser);
      return "redirect:/main";
    }
    return "redirect:/login";
  }
//로그아웃
@RequestMapping("/logout")
public String doLogoutAction(HttpSession session) {
  session.invalidate();
  return "redirect:/login";
}
```
7. userDao.xml
```
<select id="selectUser" parameterType="UserVO" resultType="UserVO">
  SELECT  ID
        , EMAIL
        , NICKNAME
        , PASSWORD
  FROM	BAR_USER
  WHERE	EMAIL = #{email}
  AND	PASSWORD = #{password}
</select>
```
8. jsp
8.1 join.jsp & login.jsp
- html form 태그를 spring form:form 형식으로 변환
8.2 main.jsp
- 현재 회원의 상태 확인
```
<c:if test="${empty sessionScope.__USER__}">
  <a href="<c:url value="/login"/>">login</a>
</c:if>
<c:if test="${not empty sessionScope.__USER__ }">
  <a href="<c:url value="/logout"/>">logout</a>
</c:if>
```
9. Session
9.1 SessionInterceptor
```
public class SessionInterceptors extends HandlerInterceptorAdapter{
  @Override
  public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler)
			throws Exception {
        String contextPath = request.getContextPath();
        if(request.getSession().getAttribute(User.USER) == null) {
          System.out.println("되는거냐고");
          response.sendRedirect(contextPath + "/login");
          return false;
        }
        return true;
      }			
    }
```
10. applicationContext.xml
```
<mvc:interceptors>
  <mvc:interceptor>
  <mvc:mapping path="/**"/>
  <mvc:exclude-mapping path="/login"/>
  <mvc:exclude-mapping path="/main"/>
  <mvc:exclude-mapping path="/join"/>
  <mvc:exclude-mapping path="/static/**"/>
  <bean id ="sessionInterceptor" class ="com.bar.interceptors.SessionInterceptors"/>
  </mvc:interceptor>
</mvc:interceptors>
```
#### MADEIT_2 :: 비밀번호 암호화
1. SHA256Util
- 다운받아서 프로젝트 내에 넣기
2. UserVO
```
private String salt;
```
- Getter Setter
3. UserDAO
```
public String selectSalt(String email);
```
4. UserDaoImplForOracle
```
@Override
public String selectSalt(String email) {
  return getSqlSession().selectOne("UserDAO.selectSalt", email);
}
```
5. UserServiceImpl
```
@Override
public boolean createUser(UserVO userVO) {
// 회원가입을 진행하면서 비밀번호를 암호화 시킬꺼임
  String salt = SHA256Util.generateSalt();
  userVO.setSalt(salt);
// 입력한 비밀번호
  String password = userVO.getPassword();
// 암호화시켜서 재할당
  password = SHA256Util.getEncrypt(password, salt);
// 암호화된 비밀번호 부여
  userVO.setPassword(password);
  return userDao.insertUser(userVO) > 0;
  }

@Override
public UserVO readUser(UserVO userVO) {
// 사용자의 email로 salt된 값을 가져옮
  String salt = userDao.selectSalt(userVO.getEmail());
  if (salt == null) {
    salt = "";
  }
// salt로 암호화
  String password = userVO.getPassword();
  password = SHA256Util.getEncrypt(password, salt);
  userVO.setPassword(password);
  return userDao.selectUser(userVO);
}
```
6. userDao.xml
6.1 **BAR_USER** 테이블에 **SALT** 추가
6.2 insertUser, selectUser - salt 추가
6.3 selectSalt
```
<select id="selectSalt" parameterType="string" resultType="string">
  SELECT  NVL(SALT,'')
  FROM    BAR_USER
  WHERE	  EMAIL = #{email}
</select>
```
#### TODO_3 :: 회원가입 중복처리( 이메일, 닉네임 )
1. UserDAO
```
public int selectDuplicateEmail(String email);
public int selectDuplicateNickname(String nickname);
```
2. UserDaoImplForOracle
```
//이메일 중복확인
@Override
  public int selectDuplicateEmail(String email) {
    return getSqlSession().selectOne("UserDAO.selectDuplicateEmail", email);
  }
//닉네임 중복확인
@Override
  public int selectDuplicateNickname(String nickname) {
    return getSqlSession().selectOne("UserDAO.selectDuplicateNickname", nickname);
  }
```
3. UserService
```
public boolean readDuplicateEmail(String email);
public boolean readDuplicateNickname(String nickname);
```
4. UserServiceImpl
```
//이메일 중복확인
@Override
public boolean readDuplicateEmail(String email) {
  return userDao.selectDuplicateEmail(email) > 0;
  }
//닉네임 중복확인
@Override
public boolean readDuplicateNickname(String nickname) {
  return userDao.selectDuplicateNickname(nickname) > 0;
  }
```
5. UserController
```
@RequestMapping("/api/duplicate/email")
  ...
  ...
  ...
//아직 기능 구현이 제대로 안됨.......
```
6. applicationContext.xml
* exclude-mapping 추가
* ** : email & nickname
```
<mvc:exclude-mapping path="/api/duplicate/**" />
```
7. userDao.xml
```
<select id="selectDuplicateEmail" parameterType="string" resultType ="_int">
  SELECT  COUNT(ID)
  FROM    BAR_USER
  WHERE	  EMAIL = #{email}
</select>
//닉네임 추가해야 됨
```

8. pom.xml
```
** json dependency
<dependency>
  <groupId>com.fasterxml.jackson.core</groupId>
  <artifactId>jackson-databind</artifactId>
  <version>2.9.4</version>
</dependency>
```
9. join.jsp
```
** form 수행 전 이벤트 처리
$("#email").keyup(function(){
  var inputEmail = $(this).val();
  if (inputEmail != ""){
    ...
    ...
    ...
//아직 기능 구현이 제대로 안됨.......
```
### 0402
#### TODO_1 :: 중복처리 
#### TODO_2 :: 생년월일 - 시작년도 주기
#### TODO_3 :: 리스트 페이지 만들기(맥주등록, 글쓰기, 마이페이지)

## WEB
http://192.168.201.17:8080/jb/main

## DB확인
https://goo.gl/FHTFGo
