<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="weiboLoginPage.aspx.cs" Inherits="weibo.weiboLoginPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="script/lib/jquery-1.4.1.min.js" type="text/javascript"></script>
    <link href="themes/default/weiboLoginPage.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">

        function userNameClick() {
            $("#txtUserName").attr("value","");
        } 
        function userPasswordClick() {
            $("#txtPassword").attr("value", "");
        }
        function userPasswordOnChange(){

            var ss = $("#txtPassword").attr("type")
           
            $("#txtPassword").attr("type", ps);
        }
        function userNameOnBlur(){
            var userNameValue = $("#txtUserName").attr("value");
            if (userNameValue == "" ) {
                $("#txtUserName").attr("value", "邮箱/会员帐号/手机号");
            }
        }
        function userPwdOnBlur() {
            var userPwdValue = $("#txtPassword").attr("value");
            if (userPwdValue == "") {
                $("#txtPassword").attr("value", "请输入密码");
            }
        }
        $(
        function () {
            var scrtime;
            $(".feed").hover(function () {
                clearInterval(scrtime);

            }, function () {

                scrtime = setInterval(function () {
                    var $ul = $(".feed ul"); //搜索ul标签
                    var liHeight = $ul.find("li:last").height();
                    $ul.animate({ marginTop: liHeight + 40 + "px" }, 1000, function () {

                        $ul.find("li:last").prependTo($ul)//将最后一个li标签添加到ul容器的首部
                        $ul.find("li:first").hide(); //淡出最后一个li标签
                        $ul.css({ marginTop: 0 });
                        $ul.find("li:first").fadeIn(3500);
                    });
                }, 4000);

            }).trigger("mouseleave"); //当鼠标移开时，触发动画效果
//            var passage = $(".content");
            
        }

        );

        $(document).ready(function () {
            addTitle();
        });
        function addTitle() {

            $("#txtUserName").attr("title", "邮箱/会员帐号/手机号");
            $("#txtPassword").attr("title", "密码");
        }
    </script>
</head>
<body>
  <form id="form1" runat="server">
  <div class="MB_wrap">
     <div class="login_top">
     
     </div>
     <div class="login_body"  style="background-image:url(../themes/default/weiboLoginPage/login_l.jpg); background-repeat:no-repeat;">
        <div class="login_l">
            <div id="usingAndFunnyPeople" style="font-size:small;font-weight:bolder;color:Black">
                       <h2 class="titleh2">这些人正在用微博</h2>
                        <table>
                         <tr>
                               <td> 
                               <img src="themes/default/imagesLogin/headPic/headPic01.jpg" />
                               <a class="homepageWeiboRen" href="http://weibo.com/1835435607"> Sammi</a>
                               </td>
                               <td> 
                                   <img src="themes/default/imagesLogin/headPic/headPic02.jpg" />
                                   <a class="homepageWeiboRen" href="http://weibo.com/1835435607"> 狮子座</a>
                               </td>
                               <td> 
                                   <img src="themes/default/imagesLogin/headPic/headPic03.jpg" />
                                   <a class="homepageWeiboRen" href="http://weibo.com/1835435607"> 落彩虹</a>
                               </td>
                         </tr>
                          <tr>
                               <td> 
                                   <img src="themes/default/imagesLogin/headPic/headPic04.jpg" />
                                   <a  class="homepageWeiboRen" href="http://weibo.com/1835435607">Jack</a>
                               </td>
                                <td> 
                                    <img src="themes/default/imagesLogin/headPic/headPic05.jpg" />
                                    <a  class="homepageWeiboRen" href="http://weibo.com/1835435607">雨水</a>
                               </td>
                                <td> 
                                    <img src="themes/default/imagesLogin/headPic/headPic06.jpg" />
                                    <a  class="homepageWeiboRen" href="http://weibo.com/1835435607"> 明镜</a>
                               </td>
                         </tr>
                          <tr>
                                <td> 
                                    <img src="themes/default/imagesLogin/headPic/headPic07.jpg" />
                                    <a class="homepageWeiboRen"  href="http://weibo.com/1835435607"> 美保</a>
                               </td>
                                <td> 
                                    <img src="themes/default/imagesLogin/headPic/headPic08.jpg" />
                                    <a class="homepageWeiboRen"  href="http://weibo.com/1835435607"> 韦雄</a>
                               </td>
                                <td> 
                                    <img src="themes/default/imagesLogin/headPic/headPic09.jpg" />
                                    <a class="homepageWeiboRen"  href="http://weibo.com/1835435607"> 丁丁</a>
                               </td>
                         </tr>
                        </table>
                        <h2 class="titleh2">有趣的人</h2>
                        <table>
                         <tr>
                               <td> 
                                   <img src="themes/default/imagesLogin/headPic/headPic10.jpg" />
                                    <a class="homepageWeiboRen"  href="http://weibo.com/1835435607"> 支持</a>
                               </td>
                               <td> 
                                   <img src="themes/default/imagesLogin/headPic/headPic11.jpg" />
                                    <a  class="homepageWeiboRen" href="http://weibo.com/1835435607"> Hope</a>
                               </td>
                               <td> 
                                   <img src="themes/default/imagesLogin/headPic/headPic12.jpg" />
                                    <a  class="homepageWeiboRen" href="http://weibo.com/1835435607"> 迷彩服</a>
                               </td>
                         </tr>
                          <tr>
                               <td> 
                                   <img src="themes/default/imagesLogin/headPic/headPic13.jpg" />
                                    <a class="homepageWeiboRen"  href="http://weibo.com/1835435607"> 快乐</a>
                               </td>
                                <td> 
                                    <img src="themes/default/imagesLogin/headPic/headPic14.jpg" />
                                     <a class="homepageWeiboRen"  href="http://weibo.com/1835435607"> 心境</a>
                               </td>
                                <td> 
                                    <img src="themes/default/imagesLogin/headPic/headPic15.jpg" />
                                     <a class="homepageWeiboRen"  href="http://weibo.com/1835435607"> 异说</a>
                               </td>
                         </tr>
                          <tr>
                                <td> 
                                    <img src="themes/default/imagesLogin/headPic/headPic16.jpg" />
                                     <a class="homepageWeiboRen"  href="http://weibo.com/1835435607"> 苗苗</a>
                               </td>
                                <td> 
                                    <img src="themes/default/imagesLogin/headPic/headPic17.jpg" />
                                     <a class="homepageWeiboRen"  href="http://weibo.com/1835435607"> 去印</a>
                               </td>
                                <td> 
                                    <img src="themes/default/imagesLogin/headPic/headPic18.jpg" />
                                     <a class="homepageWeiboRen"  href="http://weibo.com/1835435607"> 一对</a>
                                 </td>
                         </tr>
                        </table>
                    </div>
            <div class="feed"> 
                 <asp:Repeater ID="repList" runat="server" >
                     <HeaderTemplate>
                            <h2>大家正在说...</h2>
                            <ul >
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li>
                            <div class="head">
                                <img src="<%# DataBinder.Eval(Container.DataItem, "PhotoPath")%>" />
                            </div>
                            <div class="content">
                                <p class="passageAndUserName" style="text-align:left;"><a >
                                <%# DataBinder.Eval(Container.DataItem, "issuer")%>
                                </a> 
                                  <%# DataBinder.Eval(Container.DataItem, "passage")%>
                                </p>
                                <p>
                                    <span class="time"><a href="#">
                                    <%# DataBinder.Eval(Container.DataItem, "issueTime")%> 
                                     </a></span>                                                 
                                </p>                            
                            </div>
                            <div class="clear"></div>
                            </li>  
                            </ItemTemplate>
                          <AlternatingItemTemplate>
                        </AlternatingItemTemplate>
                        <SeparatorTemplate>
                        </SeparatorTemplate>
                        <FooterTemplate></ul></FooterTemplate>            
                    </asp:Repeater>   
            </div> 
            <div class="clear"></div>                   
        </div>
        <div class="login_r">
           <div class="login_item">
                <div class="regtop ">
                    <asp:Button ID="registerbtn" Class="regbtn" runat="server" Text="立即注册微博" 
                        onclick="registerbtn_Click" />

                </div>
                <div id="login_form" class="loginform">
                    <div class="input_bg">
                         <asp:TextBox ID="txtUserName" class="usnANDpwd" runat="server" value="邮箱/会员帐号/手机号" onClick="userNameClick()" onBlur="userNameOnBlur()"></asp:TextBox>
             <%--            <input id="loginname" type="text" placeholder="1039326495@qq.com"  tabindex="1" title="邮箱/会员帐号/手机号" style="color: rgb(153, 153, 153);" />
                        --%>
                         <a style="cursor: pointer;">
                        <img class="lgicon_del" src="http://img.t.sinajs.cn/t35/style/images/common/transparent.gif" title="删除登录名信息">
                        </a>
                    </div>
                    <div>
                        <div class="input_bg">
                   <%--     <input id="password" type="password" tabindex="2" title="密码" placeholder="请输入密码" style="color: rgb(153, 153, 153); "/>
                        <input id="password_text" type="text" style="color: rgb(153, 153, 153);display: none;"/>
                        --%>
                         <asp:TextBox  ID="txtPassword" TextMode="Password" class="usnANDpwd"  runat="server" value="请输入密码" onClick="userPasswordClick()" onBlur="userPwdOnBlur()" onKeyDown="userPasswordOnChange()" ></asp:TextBox>
                        </div>
                    </div>
                    <div class="setting">
                        <span class="lf">
                        <input id="remusrname" class="labelbox" type="checkbox" checked="" tabindex="3"/>
                        <label for="remusrname">下次自动登录</label>
                        </span>
                        <a class="rt" tabindex="4"  href="http://account.weibo.com/forgot/password?from=index">忘记密码</a>
                     </div>
                     <div class="signin">
                         <asp:Button ID="login_submit_btn" Class="sp" runat="server" Text="登入微博" 
                             onclick="login_submit_btn_Click" />
                        <asp:Label ID="LabelHint" Class="labelLogin" runat="server" Visible="True"></asp:Label>
                     </div>
                     <div class="hezuo_login">
                    <strong>使用其他帐号登录：</strong>
                        <span>
                            <i class="hezuo_login1"></i>
                            <a class="msnlink" tabindex="6" title="MSN" onclick="App.connectMSN();" href="javascript:void(0);">MSN</a>
                        </span>
                        <b>|</b>
                        <span>
                            <i class="hezuo_login3"></i>
                            <a href="http://weibo.com/bind/gotooauth.php?company=189.cn" target="_blank">天翼</a>
                        </span>
                        <b>|</b>
                        <span>
                            <i class="hezuo_login4"></i>
                            <a href="http://weibo.com/bind/gotooauth.php?company=wo.com.cn" target="_blank">联通</a>
                        </span>
                    </div>
                </div>

           </div>
           <div class="login_info ptless"></div>
        </div>
        <div class="clearit"></div>
     </div>
    
  </div>
  </form>
</body>
</html>
