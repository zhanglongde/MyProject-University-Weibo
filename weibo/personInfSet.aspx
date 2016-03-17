<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="personInfSet.aspx.cs" Inherits="weibo.personInfSet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>设置基本信息</title>
    <link href="themes/default/personInfSet.css" rel="stylesheet" type="text/css" />
    <link href="themes/default/superfish/superfish.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="W_miniblog">
        <div id="pl_content_top">
            <div class="global_header">
               <div class="header clearfix">
                    <div class="logo">
                          <img src="themes/default/images/main-images/weibo_logo.jpg" />
                    </div>
                   <ul class="sf-menu list">
                    <li class="current_page">
                        <a id="superfisnHome" class="link" tabindex="4" >首页</a>
                    </li>
                    <li class=" ">
                        <a class="link" tabindex="4"  href="http://plaza.weibo.com?topnav=1&wvr=3.6">
                          广场»
                        </a>
                         <ul>
                            <li>   
                                <a href="http://weibo.com/jx/pic.php?topnav=1&wvr=3.6">广场    微博精选</a>
                            </li>
                            <li><a href="#">名人堂</a></li>
                            <li><a href="http://club.weibo.com/">微博达人</a></li>
                            <li><a href="#">风云榜</a></li>
                            <li><a href="#">微话题</a></li>
                            <li><a href="#">微博精选</a></li>
                            <li><a href="#">随便看看</a></li>
                            <li><a href="#">同城微博</a></li>
                            <li><a href="#">微访谈</a></li>
                            <li><a href="#">微直播</a></li>
                            <li><a href="#">大屏幕</a></li>
                            <li><a href="http://weibo.com/pub/topmblog?type=re&act=day&topnav=1&wvr=4&wvr=3.6">热门微博</a></li>
                            <li><a href="#">查看更多有趣内容</a></li>
                         </ul>
                     
                    </li>
                    <li >
                       <ul>
                           <li> <a class="link" href="http://q.weibo.com?topnav=1&wvr=3.6" tabindex="4">微群»</a></li>
                           <li><a class="more" href="http://q.weibo.com?topnav=1">发现微群</a></li>
                        </ul>
                        <div class="layer_topmenu_list layer_topmenu_list_yy" style="width: 135px; display: none;" node-type="layerGroup">
                            <div class="func">
                                <span>
                                
                                </span>
                                我的微群
                            </div>
                            <div >
                                <div class="border">
                                    <div class="zero">
                                        你还没有加入任何微群，现在就去
                                        <a href="http://q.weibo.com?topnav=1&wvr=3.6">发现微群</a>
                                        吧!
                                    </div>
                                </div>
                            </div>
                            <div class="func func_up">
                                <span>
                                    <a class="more" href="http://q.weibo.com/profile?topnav=1">管理/查看更多微群</a>
                                </span>
                            </div>
                        </div>
                    </li>
                    <li  class=" ">
                        <a class="link W_no_outline"  tabindex="4">
                            应用»</a>     
                           <ul>
                            <li><a href="#">相册</a></li>
                            <li><a href="#">微音乐</a></li>
                            <li><a href="#">微活动</a></li>
                            <li><a href="#">投票</a></li>
                            <li><a href="#">微电台</a></li>
                            <li><a href="#">微盘</a></li>
                             <li><a href="#">微数据</a></li>
                            <li><a href="#">微女郎</a></li>
                            <li><a href="#">微秀</a></li>
                            <li><a href="#">微博桌面</a></li>
                          </ul>
                         
                    </li>
                    <li  class=" ">
                        <a class="link W_no_outline" href="http://game.weibo.com?origin=2303&topnav=1&wvr=3.6" tabindex="4">
                            游戏» </a>
                         <ul>
                            <li><a href="#">Q将三国</a></li>
                            <li><a href="#">夜店大话骰</a></li>
                            <li><a href="#">咖啡恋人</a></li>
                            <li><a href="#">夜三国</a></li>
                            <li><a href="#">浏览热门游戏</a></li>
                            <li><a href="#">查看我的游戏</a></li>
                          </ul>
                    </li>
                </ul>
                   <div  class="search ">
                         <input class="input W_no_outline" type="text" maxlength="40" placeholder="搜索微博、找人"  title="搜索文本框" tabindex="4" />
                         <a class="btn" onclick=""  title="搜索按钮" tabindex="4">
                             <img src="themes/default/images/main-images/search_img.jpg" />
                         </a>                
                   </div>
                   <div class="right">
                        <ul class="person sf-menu">
                            <li  class=" "> 
                                   <a class="sf-with-ul link W_no_outline" href="#">帐号»</a> 
                                 <ul>
                                     <li id="personInfSet"><a href="#">帐号设置</a></li>
                                     <li><a href="#">模板设置</a></li>
                                     <li><a href="#">版本选择</a></li>
                                     <li><a href="#">我的微币</a></li>
                                     <li><a href="#">我的微号</a></li>
                                     <li ><a href="#">我的工具</a></li>
                                     <li id="exit"><a href="#">退出</a></li>
                          
                                 </ul>
                            </li>
                            <li  class=" "> 
                            <a class="sf-with-ul link W_no_outline" href="#">消息»</a> 
                                 <ul>
                                     <li><a href="#">查看评论</a></li>
                                     <li><a href="#">查看粉丝</a></li>
                                     <li><a href="#">查看私信</a></li>
                                     <li><a href="#">查看@我</a></li>
                                     <li><a href="#">查看群内消息</a></li>
                                     <li><a href="#">查看相册消息</a></li>
                                     <li><a href="#">查看通知</a></li>
                                     <li><a href="#">查看邀请</a></li>
                                 </ul>
                           </li>
                            <li>
                                <a class="link" href="" tabindex="4">找人</a>
                            </li>
                            <li>
                                <a class="link" href="" tabindex="4">手机</a>
                            </li>
                            <li>
                                <a class="link" href="" tabindex="4">雨水明镜落彩虹</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="W_main">
                <div class="W_main_bg clearfix">
                    <div class="W_main_l">
                        <div id="pl_leftNav_relation" class="left_nav">
                            <div>
                                 <h3>帐号设置</h3>
                                <dl>
                            
                                    <dd class="title" id="allConcernsLink">
                                        <a  class="title" >个人资料</a>
                                    </dd>

                                    <dt>
                                        <a class="title"id="fansLink" >
                                        修改头像
                                        </a>
                                    </dt>
                                    <dt>
                                        <a class="title" href="http://weibo.com/f/invite">
                                      绑定手机
                                        </a>
                                    </dt>
                      
                                </dl>
                            </div>
                        </div>
                    </div>
                    <div id="plc_relation_follow">
                        <div class="W_main_c">
                            <div id="pl_relation_follow">
                                   
                            </div>
                            <div id="pl_relation_fans">
                                            <div class="MIB_blogbody">
                                            <div class="MIB_column">
                                                <div class="MIB_main_cont">
                                                   <div class="MIB_setup">
                                                      <div class="setup_main">
                                                           <div class="index_title rightreviseheadpic">
                                                              修改头像
                                                            </div>
                                                            <div id="div1" class="up">
                                                                <asp:FileUpload ID="FileUpload1" runat="server"  />
                                                                <asp:Button ID="Button1" runat="server" Text="上传" 
                                                                    onclick="localUpLoadImg_Click" />
                                                            </div>
                                                            <div >
                                                                <asp:Label ID="LabelHint" runat="server" ForeColor="#FF3300"></asp:Label>
                                                               <%-- <img id="headImg"src="themes/default/face/1.gif" />--%>
                                                            </div>
                                                        </div>
                                                   </div>
                
                                                </div>
            
                                            </div>
                                        </div>
  
                            </div>
                        </div>
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
  
    </form>
     <script src="script/lib/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="script/lib/superfish/superfish.js" type="text/javascript"></script>
    <script src="script/personInfSet.js" type="text/javascript"></script>
</body>
</html>
