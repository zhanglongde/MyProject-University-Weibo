<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="weiboRegister.aspx.cs" Inherits="weibo.weiboRegister" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>新浪微博注册 新浪微博-随时随地分享身边的新鲜事儿</title>
    <link href="themes/default/weiboRegister.css" rel="stylesheet" type="text/css" />
    <script src="script/lib/jquery-1.4.1.min.js" type="text/javascript"></script>
     <script language="javascript" type="text/javascript">
              function checkInput() {
                  var userName = document.getElementById("txtUserName").value;
                  var pwd = document.getElementById("txtPassword").value;
                  var pwdCnf = document.getElementById("txtPwdConfirm").value;
                  var checkCode = document.getElementById("txtCheckCode").value;
                  if (userName == "") {
                      $("#userNameCheckDiv").css("display", "inline");
                      $("#userNameCheckSpan").text("用户名不能为空！");
                      return false;
                  }
                  if (pwd == "") {
                      $("#pwdCheckDiv").css("display", "inline");
                      $("#pwdCheckSpan").text("密码不能为空！");
                      return false;
                  }
                  if (pwdCnf == "") {
                      $("#pwdCfgCheckDiv").css("display", "inline");
                      $("#pwdCfgCheckSpan").text("确认密码不能为空！");
                      return false;
                  }
                  if (checkCode == "") {
//                      alert("验证码不能为空！");
//                      return false;
                  }
                  return true;
              }

              $(document).ready(function () {
                  $(".errormt").css("display","none");
              });
             function emailInputClick() {
                 $("#emailCheckDiv").css("display", "inline");
//                 $("#emailCheckLink").css("display", "none");
                 $("#emailCheckSpan").text("请输入你的常用邮箱，如：example@example.com它将成为你未来的登入帐号");
              }
              function emailInputOnBlur() {
                  $("#emailCheckDiv").css("display", "inline");
//                  $("#emailCheckLink").css("display", "block");
                  $("#emailCheckSpan").text("请输入你的常用邮箱，没有邮箱？");
//                   $("#emailCheckSpan").prepend(function(){
//                       ' <a id="emailCheckLink" href="http://mail.sina.com.cn/cnmail/index.html" >没有邮箱？</a>'
//                   }); 
              }

              function userNameInputClick() {
                  $("#userNameCheckDiv").css("display", "inline");
                  $("#userNameCheckSpan").text("可输入4-30位，包含英文、数字和中文");
              }
              function userNameInputOnBlur() {
                  $("#userNameCheckDiv").css("display", "inline");
                  var userName = $("#txtUserName").val();
                  if (userName.length == 0) {
                      $("#userNameCheckSpan").text("支持中英文、数字或者“_”。");

                  }
                  else {
                      if (userName.length < 4) {
                          $("#userNameCheckSpan").text("请输入4个字符以上的昵称。");
                      }
                      else {
                          checkUserExistence(userName);

                      }
                  }

              }


              function checkUserExistence(userName) {
                  $.post("checkUserExistence.ashx", { userName: userName },
      function (data, status) {
          if (status != "success") {
              alert("验证失败");
              return;
          }
          if (data != "OK") {
              $("#userNameCheckSpan").text("此昵称太受欢迎，已有人抢了。");
          }
          else {
              $("#userNameCheckSpan").text("此昵称可以注册。");
          }
      });
              }
              //              
              function pwdInputClick() {
                  $("#pwdCheckDiv").css("display", "inline");
                  $("#pwdCheckSpan").text("密码由6-16位半角字符组成，区分大小写");
              }
              function pwdInputOnBlur() {
                  $("#pwdCheckDiv").css("display", "inline");
                  var pwd = $("#txtPassword").val();
                  if (pwd.length < 6) {
                      $("#pwdCheckSpan").text("密码太短了，最少6位。");
                  }
                  else {
                      $("#pwdCheckSpan").text("密码符合要求");
                  }
              }
              function pwdCfgInputOnBlur() {
                  var pwd = document.getElementById("txtPassword").value;
                  var pwdCnf = document.getElementById("txtPwdConfirm").value;

                  if (pwd != pwdCnf) {
                      $("#pwdCfgCheckDiv").css("display", "inline");
                      $("#pwdCfgCheckSpan").text("两次输入密码不一致,请重输");
                  }
                
              }
              function userNameCheckInput() {
                   var userName=$("#txtUserName").val();
                   if (userName == "") {
                       alert("用户名不能为空！");
                       $("#emailCheckDiv").css("display", "inline");
                       $("#emailCheckLink").hide();
                       $("#emailCheckSpan").val("用户名不能为空！");
                   }
                  var pwd = document.getElementById("txtPassword").value;
                  var pwdCnf = document.getElementById("txtPwdConfirm").value;
                  var checkCode = document.getElementById("txtCheckCode").value;
              }
     </script>
    <style type="text/css">
        .style1
        {
            width: 143px;
        }
        .style2
        {
            width: 177px;
        }
        .style3
        {
            width: 325px;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
    <div id="bodyDiv">
      <div id="headPictureDiv">  
          <img src="themes/default/imageRegister/body_div_head.jpg" /></div>
       <div id="logoDiv"> </div>
       <div id="weiboBiaoyuDiv"> </div>
       <div id="information_box" class="reg_conbg">
            <div id="leftDiv ">
               <div class="reg_tab bg">
                    <span class="tab1">
                       <a class="reg_tab_a" href="http://weibo.com/signup/mobile.php?lang=zh-cn">电子邮箱注册</a>
                    </span>
                    <span class="tab2">
                       <a class="reg_tab_a" href="http://weibo.com/signup/mobile.php?lang=zh-cn">手机号码注册</a>
                    </span>
                    <span class="tab3">
                       <a class="reg_tab_a" href="http://weibo.com/signup/students.php?lang=zh-cn">校园用户注册</a>
                    </span>
               </div>
               <div  class="new_construct bg">
                   <table class="tb-form">
                        <tr>
                            <th class="style1">
                               我的邮箱：
                            </th>
                            <td class="style2">
                                <span class="noticeStar">*</span>
                                <asp:TextBox ID="txtEmail" runat="server" Width="120px" onClick="emailInputClick()" onBlur="emailInputOnBlur()" />
                            </td>
                            <td class="style3">
                               <div id="emailCheckDiv" class="errormt" style="">
                                    <strong>
                                    <span id="emailCheckSpan">
                                    请输入常用邮箱，
                                    </span>
                                    </strong>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th class="style1">
                            创建密码：
                            </th>
                            <td class="style2">
                             <span class="noticeStar">*</span>
                             <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Width="120px" onClick="pwdInputClick()" onBlur="pwdInputOnBlur()"/>
                             </td>
                             <td class="style3">
                                   <div id="pwdCheckDiv" class="errormt" style="">
                                    <strong>
                                    <span id="pwdCheckSpan">密码太短了，最少6位。</span>
                                    </strong>
                                </div>
                             </td>               
                        </tr>
                          <tr>
                            <th class="style1">
                            确认密码：
                            </th>
                            <td class="style2">
                             <span class="noticeStar">*</span>
                             <asp:TextBox ID="txtPwdConfirm" TextMode="Password" runat="server" Width="120px" onClick="" onBlur="pwdCfgInputOnBlur()" />
                             </td>  
                             <td class="style3">
                                 <div id="pwdCfgCheckDiv" class="errormt" style="">
                                    <strong>
                                    <span id="pwdCfgCheckSpan">两次输入密码不一致</span>
                                    </strong>
                                </div>
                             </td>             
                        </tr>
                        <tr>
                            <th class="style1" rowspan="1">
                            昵称：
                            </th>
                            <td class="style2">
                             <span class="noticeStar">*</span>
                             <asp:TextBox ID="txtUserName" runat="server" Width="120px" onClick="userNameInputClick()" onBlur="userNameInputOnBlur()" />
                             </td> 
                             <td class="style3">
                                <div id="userNameCheckDiv" class="errormt" style="">
                                    <strong >
                                    <span id="userNameCheckSpan">此昵称太受欢迎，已有人抢了</span>
                                    </strong>
                                </div>
                             </td>              
                        </tr>
                        <tr>
                            <th class="style1">
                                性别:
                            </th>
                            <td class="style2">
                                <span class="noticeStar">*</span>
                                <asp:RadioButton ID="rbMan" runat="server" Text="男" Checked="True" 
                                    GroupName="sex"/>
                                <asp:RadioButton ID="rbWoman" runat="server" Text="女" GroupName="sex"/>
                                
                            </td>
                        </tr>
                        <tr>
                            <th class="style1">
                                所在地
                            </th>
                            <td class="style2">
                                <span class="noticeStar">*</span>
                                    <asp:DropDownList ID="ddlProvinceAddress" runat="server" Height="16px" 
                                    Width="76px">
                                    <asp:ListItem Selected="True">福建</asp:ListItem>
                                        <asp:ListItem>北京</asp:ListItem>
                                        <asp:ListItem>上海</asp:ListItem>
                                        <asp:ListItem>广东</asp:ListItem>
                                        <asp:ListItem>湖北</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="ddlCityAddress" runat="server" Height="16px" 
                                    Width="76px">
                                        <asp:ListItem Selected="True">福州</asp:ListItem>
                                        <asp:ListItem>厦门</asp:ListItem>
                                        <asp:ListItem>泉州</asp:ListItem>
                                        <asp:ListItem>广州</asp:ListItem>
                                        <asp:ListItem>武汉</asp:ListItem>
                                        <asp:ListItem>北京</asp:ListItem>
                                        <asp:ListItem>上海</asp:ListItem>
                                        <asp:ListItem>深圳</asp:ListItem>
                                    </asp:DropDownList>
                            </td>         
                        </tr>
                        <tr>
                            <th class="style1">
                                验证码:
                            </th>  
                            <td class="style2">
                               <span class="noticeStar">*</span>
                                <asp:TextBox ID="txtCheckCode" runat="server" Width="72px"></asp:TextBox>
                                <img src="themes/default/images/验证码.jpg" style="height:40px;width: 88px " />
                                 <a href="">换一张</a>
                            </td>        
                        </tr>          
                  </table>
               </div>
               <div  class="reg_bt bg" >              
                   <asp:Button ID="submitNewUser" OnClientClick="return checkInput()" runat="server" 
                    Text="" onclick="submitNewUser_Click"  />
                    <asp:Label ID="LabelHint" runat="server" ForeColor="#FF3300"></asp:Label>
                    <p>
                     <a href="http://login.sina.com.cn/regagreement.html" target="_blank">《新浪网络使用协议》</a>
                  </p>
               </div>
            </div>
            <div id="rightDiv"></div>
       </div>
       <div id="bottomDiv">
           <img src="themes/default/imageRegister/reg_bottom-picture.jpg" />
        </div>
    </div>
    </form>
</body>
</html>
