<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="comcernfan.aspx.cs" Inherits="weibo.comcernfan" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>我关注的人</title>
    <link href="themes/default/concernfan.css" rel="stylesheet" type="text/css" />
    <link href="themes/default/superfish/superfish.css" rel="stylesheet" type="text/css" />
</head>
<body class="B_fans_myconn">
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
                            <h3>关注/粉丝</h3>
                            <dl>
                                <dt class="current">
                                    <a class="title" id="concernsLink" >
                                    关注
                                    </a>
                                </dt>
                                <dd class="current" id="allConcernsLink">
                                    <a  class="title" >全部关注( <strong id="concernsQuantity"></strong> )</a>
                                </dd>
                                <dd>
                                <a class="title" >互相关注( <strong id="concernEachOtherQuantity">5</strong> )</a>
                                </dd>
                                <dt>
                                    <a class="title"id="fansLink" >
                                    粉丝( <strong id="fansQuantity"></strong> )
                                    </a>
                                </dt>
                                <dt>
                                    <a class="title" href="http://weibo.com/f/invite">
                                    邀请站外好友
                                    </a>
                                </dt>
                                <dt>
                                    <a class="title" href="http://weibo.com/f/find">
                                    找人
                                    </a>
                                    </dt>
                                <dt>
                                    <a class="title" href="http://weibo.com/f/find/guess">
                                    猜你喜欢
                                    </a>
                                </dt>
                            </dl>
                            </div>
                        </div>
                    </div>
                    <div id="plc_relation_follow">
                        <div class="W_main_c">
                            <div id="pl_relation_follow">
                                <div class="index_title">
                                    <h3> 我关注了 <strong id="concernsQuantityTitle">3</strong> 人</h3>
                                    <div class="search" >
                                        <input class="input input_default" type="text" name="nicksearch" placeholder="输入昵称或备注"  />
                                        <a class="btn">
                                           <%--<img src="themes/default/concernfan/searchUserImg.jpg" />--%>
                                        </a>
                                    </div>
                                </div>
                                <div class="tab_e clearfix">
                                    <div class="right">
                                        <a class="W_btn_b">
                                        <span>
                                        <img class="icon_add addbtn_b" src="http://img.t.sinajs.cn/t4/style/images/common/transparent.gif" title="创建分组"/>
                                        创建分组
                                        </span>
                                        </a>
                                    </div>
                                    <div class="tabs">
                                        <a class="current W_bgcolor W_texta" >全部</a>
                                        <a >|互相关注</a>
                                        <a >|未分组</a> 
                                        <a title="特别关注" >|特别关注</a>
                                        <a title="名人明星" >|名人明星</a>
                                        <a title="同事" > |同事</a>
                                        <a class="W_moredown" >
                                        <span class="txt"></span>
                                        <span class="more"></span>
                                        </a>
                                    </div>
                                </div>
                                <div class="tab_below W_bgcolor">
                                    <div class="tab_e clearfix">
                                        <div class="tabs">
                                            <span class="label">排序方式：</span>
                                            <a class="current W_texta" >关注时间</a>
                                            <a >|最近更新</a>
                                            <a>|昵称首字母</a>
                                            <a class="" >|最近联系</a>
                                            <a>|粉丝数</a>
                                        </div>
                                    </div>
                                </div>
                                <ul id="concernsul" class="cnfList"style="width:540px;">
                                   <li class="clearfix W_linecolor">
                                    <div class="left">
                                        <p class="face mbspace">
                                        <a  title="PatrickLee李云涛" target="_blank">
                                        <img width="50" height="50" src="http://tp4.sinaimg.cn/1249570203/50/5619413871/1" alt="PatrickLee李云涛" usercard="id=1249570203">
                                        </a>
                                        </p>
                                        <a class="webim_leave" >私信</a>
                                    </div>
                                    <div class="con clearfix">
                                            <div class="con_right">
                                                <p class="addbtn mbspace"> </p>
                                                <p class="txt mbspace">
                                                <a href="javascript:;">
                                                取消关注
                                                </a>
                                                </p>
                                                <p class="txt mbspace">
                                                <a onclick="javascript:window.open('/reportspam?rid=1249570203&type=3&url=http%3A%2F%2Fweibo.com%2F1660806900%2Ffollow', 'newwindow', 'height=700, width=550, toolbar =yes, menubar=no, scrollbars=no, resizable=yes, location=no, status=no');" href="javascript:void(0);">举报</a>
                                                </p>
                                            </div>
                                            <div class="con_left">
                                                <p class="name mbspace">
                                                <a class="W_f14"target="_blank">PatrickLee李云涛</a>
                                                <span class="addr">
                                                北京
                                                </span>
                                                <span class="addOptName">
                                                (
                                                <a class="W_linkb">设置备注</a>
                                                )
                                                </span>
                                                </p>
                                                <p class="connect mbspace">
                                                关注
                                                <a  target="_blank">496</a>
                                                |
                                                粉丝
                                                <a  target="_blank">608090</a>
                                                |
                                                微博
                                                <a  target="_blank">2833</a>
                                                </p>
                                                <p class="info mbspace">简介：意大利科菲亚高级时装及造型艺术国际学院http://www.koefiainternational.com/ Professor</p>
                                                <p class="weibo mbspace">
                                                <a class="W_linkb" >感谢服装支持 //@科菲亚: #意大利设计# @PatrickLee李云涛 科菲亚华服与李老师的妆容完美结合。成为盛典一大亮点，新生的主题也让人们在新的一年有所感悟。(55分钟前)</a>
                                                </p>
                                                <p class="from W_textb">
                                                通过
                                                <a class="W_linkb" href="http://s.weibo.com">微博搜索</a>
                                                关注
                                                </p>
                                                <p class="more_info">
                                                <a class="W_moreup" title="更多资料" >
                                                更多资料
                                                <span class="more"></span>
                                                </a>
                                                </p>
                                                <p class="groupBtn">
                                                <a class="W_btn_e"  title="名人明星">
                                                <span>
                                                名人明星
                                                <em class="W_moredown_txt"></em>
                                                </span>
                                                </a>
                                                </p>
                                            </div>
                                    </div>
                                    <div class="detail">
                                        <div class="W_bubtips clearfix">
                                            <div class="W_bgcolor_arrow">
                                            <em class="W_arrline_mini"></em>
                                            <span></span>
                                            </div>
                                            <div class="W_bgcolor W_linecolor">
                                            
                                             </div>
                                          </div>
                                      </div>
                                   </li>
                                </ul>
                            </div>
                            <div id="pl_relation_fans">
                                <div class="index_title">
                                    <h3> 已有 <strong id="fansQuantityTitle">3</strong> 人关注你 </h3>
                                    <div class="search" >
                                        <input class="input input_default" type="text" name="nicksearch" placeholder="输入昵称或备注"  />
                                        <a class="btn">
                                           <%--<img src="themes/default/concernfan/searchUserImg.jpg" />--%>
                                        </a>
                                    </div>
                                </div>
                                <div class="tab_below W_bgcolor">
                                    <div class="tab_e clearfix">
                                        <div class="tabs arrangeWays">
                                            <span class="label">排序方式：</span>
                                            <a class="current W_texta" >关注时间</a>
                                            <a class="" >|最近联系</a>
                                            <a>|粉丝数</a>
                                        </div>
                                    </div>
                                </div>
                                <ul id="fansul" class="cnfList"style="width:540px;">
                                   <li class="clearfix W_linecolor">
                                    <div class="left">
                                        <p class="face mbspace">
                                        <a  title="娜特莉" >
                                        <img width="50" height="50" src="http://tp1.sinaimg.cn/1894872604/50/0/0" alt="娜特莉5" >
                                        </a>
                                        </p>
                                    </div>
                                    <div class="con clearfix">
                                            <div class="con_right">
                                                <p class="addbtn mbspace"> </p>
                                                <p class="txt mbspace">
                                                <a class="W_addbtn">
                                                加关注
                                                </a>
                                                </p>
                                                <p class="txt mbspace">
                                                <a>移除粉丝</a>
                                                <a>举报</a>
                                                </p>
                                            </div>
                                            <div class="con_left">
                                                <p class="name mbspace">
                                                <a class="W_f14"target="_blank">娜特莉</a>
                                                <span class="addr">
                                                山西
                                                </span>
                                                <span class="addOptName">
                                                (
                                                <a class="W_linkb">设置备注</a>
                                                )
                                                </span>
                                                </p>
                                                <p class="connect mbspace">
                                                关注
                                                <a  target="_blank">1496</a>
                                                |
                                                粉丝
                                                <a  target="_blank">608090</a>
                                                |
                                                微博
                                                <a  target="_blank">833</a>
                                                </p>
                                                <p class="info mbspace">
                                                简介：没什么过不去，只是再也回不去。
                                                </p>
                                                <p class="weibo mbspace">
                                                <a class="W_linkb" >
                                                 我给应用【开心交友猜猜看】打了5分 http://weibo.com/app/detail/4L8hIo (2011-6-29 14:08)
                                                </a>
                                                </p>
                                                <p class="from W_textb">
                                                通过
                                                <a class="W_linkb" href="http://s.weibo.com">微博搜索</a>
                                                关注
                                                </p>
                                                <p class="more_info">
                                                <a class="W_moreup" title="更多资料" >
                                                更多资料
                                                <span class="more"></span>
                                                </a>
                                                </p>
                                            </div>
                                    </div>
                                    <div class="detail">
                                     </div>
                                   </li>
                                </ul>
                            </div>
                        </div>
                        <div class="W_main_r">
                            <div id="pl_content_homeInterest">
                                <div class="W_rightModule">
                                    <div class="title">
                                        <a class="right W_linkb"  node-type="changeBtn" suda-data="key=tblog_interested_v4&value=change" href="javascript:;">换一换</a>
                                        <a href="/f/find/guess">可能感兴趣的人</a>
                                    </div>
                                    <div>
                                    <asp:Repeater ID="repList" runat="server" >
                                        <HeaderTemplate>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                             <dl class="interPer clearfix" >
                                                <dt>
                                                    <a title="<%# DataBinder.Eval(Container.DataItem, "UserName")%>" >
                                                    <img width="50" height="50" src="<%# DataBinder.Eval(Container.DataItem, "PhotoPath")%>">
                                                    </a>
                                                &nbsp;&nbsp;</dt>
                                                <dd>
                                                    <p class="name">
                                                        <a  title="<%# DataBinder.Eval(Container.DataItem, "UserName")%>"> <%# DataBinder.Eval(Container.DataItem, "UserName")%></a>
                                                    </p>
                                                    <p class="fllow clearfix">
                                                        <a class="W_addbtn" id="<%# DataBinder.Eval(Container.DataItem, "UserName")%>" >
                                                          加关注
                                                        </a>
                                                        <a>共<%# DataBinder.Eval(Container.DataItem, "concernsQuantity")%>人关注他</a>
                                                    </p>
                                                    <p class="info W_linkb W_textb">
                                                        <a class="W_moreup" title="2个间接关注人" >
                                                     </p>
                                                </dd>
                                                <dd class="pop_users">
                                                    <div class="W_bubtips clearfix">
                                                        <div class="W_bgcolor_arrow">
                                                            <em class="W_arrline_mini"></em>
                                                            <span></span>
                                                        </div>
                                                        <div class="W_bgcolor W_linecolor W_textb W_linkb">
                                                            <ul class="pop_list">
                                                                <li>
                                                                我关注的人中 ：
                                                                <a  href="">甘源</a>
                                                                、
                                                                <a  href="">俞敏洪</a>
                                                                共 2人也关注了他
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </dd>
                                            </dl> 
                                         </ItemTemplate>
                                        <AlternatingItemTemplate>
                                          <dl class="interPer clearfix" >
                                                <dt>
                                                    <a title="<%# DataBinder.Eval(Container.DataItem, "UserName")%>" >
                                                    <img width="50" height="50" src="<%# DataBinder.Eval(Container.DataItem, "PhotoPath")%>">
                                                    </a>
                                                &nbsp;&nbsp;</dt>
                                                <dd>
                                                    <p class="name">
                                                        <a  title="<%# DataBinder.Eval(Container.DataItem, "UserName")%>" id="<%# DataBinder.Eval(Container.DataItem, "UserName")%>"> <%# DataBinder.Eval(Container.DataItem, "UserName")%></a>
                                                    </p>
                                                    <p class="fllow clearfix">
                                                        <a class="W_addbtn" id="<%# DataBinder.Eval(Container.DataItem, "UserName")%>">
                                                        加关注
                                                        </a>
                                                        <a>共<%# DataBinder.Eval(Container.DataItem, "concernsQuantity")%>人关注他</a>
                                                    </p>
                                                    <p class="info W_linkb W_textb">
                                                        <a class="W_moreup" title="2个间接关注人" >
                                                     </p>
                                                </dd>
                                                <dd class="pop_users">
                                                    <div class="W_bubtips clearfix">
                                                        <div class="W_bgcolor_arrow">
                                                            <em class="W_arrline_mini"></em>
                                                            <span></span>
                                                        </div>
                                                        <div class="W_bgcolor W_linecolor W_textb W_linkb">
                                                            <ul class="pop_list">
                                                                <li>
                                                                我关注的人中 ：
                                                                <a  href="">甘源</a>
                                                                、
                                                                <a  href="">俞敏洪</a>
                                                                共 2人也关注了他
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </dd>
                                            </dl> 
                                        </AlternatingItemTemplate>
                                        <SeparatorTemplate>
                                        </SeparatorTemplate>
                                        <FooterTemplate></FooterTemplate>            
                                    </asp:Repeater>   
                                    </div>
                                    <div class="more clearfix">
                                        <span class="fl">
                                           <a href="http://account.weibo.com/settings/privacy">推荐/隐私设置                                                                       <span class="fr">
                                        <a  href="">更多»</a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div id="pl_relation_recommendPopularUsers">
                            </div>
                            <div id="pl_relation_blacklist">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
    <script src="script/lib/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="script/concernfanDefault.js" type="text/javascript"></script>
    <script src="script/lib/superfish/superfish.js" type="text/javascript"></script>
     <script language="javascript" type="text/javascript">
        
     </script>
</body>
</html>
