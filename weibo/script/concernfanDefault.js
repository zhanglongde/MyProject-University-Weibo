
$("#personInfSet").click(function () {
    var url = document.URL;
    url = url.split("=");
    var userName = decodeURI(url[1]);
    window.location.href = "personInfSet.aspx?username=" + userName;

});
$(".comcernfan").click(function () {
    var url = document.URL;
    url = url.split("=");
    var userName = decodeURI(url[1]);
    window.location.href = "comcernfan.aspx?username=" + userName;

});
$("#exit").click(function () {
    window.location.href = 'weiboLoginPage.aspx';

});
$("#superfisnHome").click(function () {
    var userName = getUserName();
    window.location.href = "weiHomepage.htm?username=" + userName;

});
$("#fansLink").click(function () {
    $("#pl_relation_fans").css("display", "block");
    $("#pl_relation_follow").css("display", "none");

});
$("#concernsLink").click(function () {
    $("#pl_relation_fans").css("display", "none");
    $("#pl_relation_follow").css("display", "block");
});
$("#allConcernsLink").click(function () {
    $("#pl_relation_fans").css("display", "none");
    $("#pl_relation_follow").css("display", "block");
    var userName = getUserName();


});
$(document).ready(function () {
    $("#pl_relation_fans").css("display", "none");
    menu();
    var userName = getUserName();
    loadUserInf(userName);
    load4fans(userName);
    loadAllConcernsInf(userName);
});
function menu() {
    $("ul.sf-vertical").superfish({
        animation: { opacity: 'show', height: 'show' },
        speed: 'fast'
    });
}

function getUserName(){
         var url = document.URL;
            url = url.split("=");
            var userName = decodeURI(url[1]);
            return userName;
        }

 function loadUserInf(userName) {
//            alert("loadUserInf");
            $.post("getUserMessage.ashx", { userName: userName },
      function (data, status) {
          if (status != "success") {
              alert("发表评论失败，请重试！");
              return;
          }
          var arrs = data.split("|");
          if (arrs[0] == "OK") {
              var us = arrs[1];
              var pa = arrs[2];
              var ca = arrs[3];
              var cq = arrs[4];
              var fq = arrs[5];
              var wbq = arrs[6];
              var pp = arrs[7];;
              $("#concernsQuantity").append(cq);
              $("#fansQuantity").append(fq);
              $("#concernsQuantityTitle").text(cq);
              $("#fansQuantityTitle").text(fq);
          }
          else {
              alert(arrs[0]);
              alert("评论发表内容有问题！");

          }
      });
        }

function load4fans(userName) {

    $.post("get4fans.ashx", { userName: userName },
     function (datas, status) {

         if (status != "success") { alert("显示粉丝信息失败"); return; }
         else {
             for (var i = 0; i < datas.length; i++) {
                 var fan = datas[i];
                 prependSingleFan(fan);
             }

         }
     }, "json");
 }
 function loadAllConcernsInf(userName) {
     $.post("getAllConcernsInf.ashx", { userName: userName },
     function (datas, status) {
         if (status != "success") { alert("显示关注信息失败"); return; }
         else {

             for (var i = 0; i < datas.length; i++) {
                 var concern = datas[i];
                 prependSingleConcern(concern);
             }
         }
     }, "json");
 }
 function prependSingleFan(fan){
     //     var commentLink = weibo.PassageNo + "1";
//     alert(fan.UserName1);
//     alert(fan.ProvinceAddress1);
//     alert(fan.FansQuantity);
//     alert(fan.ConcernsQuantity);
     //     alert(fan.WeiboPassageQuantity);PhotoPath1
     var addConcernLink = fan.UserName1 + "0";
     var delFanLink = fan.UserName1 + "1";
     $("#fansul").prepend(
       '<li class="clearfix W_linecolor">'+
        '<div class="left">'+
            '<p class="face mbspace">'+
            '<a  title=' + fan.UserName1 + ' >' +
            '<img width="50" height="50" src=' + fan.PhotoPath1 + ' alt=' + fan.UserName1 + ' >' +
            '</a>'+
            '</p>'+
        '</div>'+
        '<div class="con clearfix">'+
                '<div class="con_right">'+
                    '<p class="addbtn mbspace"> </p>'+
                    '<p class="txt mbspace">'+
                   ' <a  id=' + addConcernLink + ' class="W_addbtn">' +
                    '加关注'+
                    '</a>'+
                    '</p>'+
                   '<p class="txt mbspace">'+
                    '<a id=' + delFanLink + '>移除粉丝</a>' +
                    '</p>'+
                '</div>'+
              '<div class="con_left">'+
                   '<p class="name mbspace">'+
                    '<a class="W_f14"target="_blank">' + fan.UserName1 + '</a>' +
                    '<span class="addr"> &nbsp ' + fan.ProvinceAddress1 + '</span><span class="addOptName">' +
                    '(<a class="W_linkb">设置备注</a>)</span>'+
                    '</p>'+
                    '<p class="connect mbspace">'+
                   ' 关注'+
                   '<a  target="_blank">' + fan.ConcernsQuantity + '</a>' +
                    '|'+
                    '粉丝'+
                    '<a  target="_blank">' + fan.FansQuantity + '</a>'+
                   ' |'+
                    '微博'+
                    '<a  target="_blank">' + fan.WeiboPassageQuantity + '</a>' +
                    '</p>'+
                   '<p class="info mbspace">'+
                   ' 简介：'+ fan.SelfIntroduction +
                   '</p>'+
                    '<p class="weibo mbspace">'+
                    '<a class="W_linkb" >'+
                      '  我给应用【开心交友猜猜看】打了5分 http://weibo.com/app/detail/4L8hIo (2011-6-29 14:08)'+
                   ' </a>'+
                   ' </p>'+
                    '<p class="from W_textb"> 通过'+
                    '<a class="W_linkb" href="http://s.weibo.com">微博搜索</a> 关注'+
                    '</p>'+
                    '<p class="more_info">'+
                    '<a class="W_moreup" title="更多资料" >'+
                   '更多资料'+
                    '<span class="more"></span>'+
                   ' </a>'+
                    '</p></div>'+
         '</div><div class="detail"></div>' +
        '</li>'
     );

     $('#' + addConcernLink).click(function () {
         var userName = getUserName();
         addConcern(userName, fan.UserName1);
       
     });
     function addConcern(userName, concern) {
         $.post("addConcern.ashx", { userName: userName, concern: concern },
      function (data, status) {
          if (status != "success") {
              alert("添加关注失败，请重试！");
              return;
          }
          if (data != "OK") {
              alert("添加关注失败，请重试！");
          }
          else {
              alert("添加关注成功！");
              $('#' + addConcernLink).text("已互相关注");
              var wb = $("#concernsQuantity").text();
              var remain = parseInt(wb) + 1;
              $("#concernsQuantity").text(remain);
              $("#concernsQuantityTitle").text(remain);
              var ceoq = $("#concernEachOtherQuantity").text();
              var remain2 = parseInt(ceoq) + 1;
              $("#concernEachOtherQuantity").text(remain2);
          }
      });
     }


 }

 function prependSingleConcern(fan) {
     //     var commentLink = weibo.PassageNo + "1";
     //     alert(fan.UserName1);
     //     alert(fan.ProvinceAddress1);
     //     alert(fan.FansQuantity);
     //     alert(fan.ConcernsQuantity);
     //     alert(fan.WeiboPassageQuantity);PhotoPath1
     

     var delConcernLink = fan.UserName1 + "0";
     var delConcernli= fan.UserName1 + "1";
     $("#concernsul").prepend(
       '<li id=' + delConcernli + ' class="clearfix W_linecolor">' +
        '<div class="left">' +
            '<p class="face mbspace">' +
            '<a  title=' + fan.UserName1 + ' >' +
            '<img width="50" height="50" src=' + fan.PhotoPath1 + ' alt=' + fan.UserName1 + ' >' +
            '</a>' +
            '</p>' +
        '</div>' +
        '<div class="con clearfix">' +
                '<div class="con_right">' +
                    '<p class="addbtn mbspace"> </p>' +
                    '<p class="txt mbspace">' +
                   ' <a  id=' + delConcernLink + ' class="W_addbtn">' +
                    '取消关注' +
                    '</a>' +
                    '</p>' +
                   '<p class="txt mbspace">' +
                    '<a >举报</a>' +
                    '</p>' +
                '</div>' +
              '<div class="con_left">' +
                   '<p class="name mbspace">' +
                    '<a class="W_f14"target="_blank">' + fan.UserName1 + '</a>' +
                    '<span class="addr"> &nbsp ' + fan.ProvinceAddress1 + '</span><span class="addOptName">' +
                    '(<a class="W_linkb">设置备注</a>)</span>' +
                    '</p>' +
                    '<p class="connect mbspace">' +
                   ' 关注' +
                   '<a  target="_blank">' + fan.ConcernsQuantity + '</a>' +
                    '|' +
                    '粉丝' +
                    '<a  target="_blank">' + fan.FansQuantity + '</a>' +
                   ' |' +
                    '微博' +
                    '<a  target="_blank">' + fan.WeiboPassageQuantity + '</a>' +
                    '</p>' +
                   '<p class="info mbspace">' +
                   ' 简介：' + fan.SelfIntroduction +
                   '</p>' +
                    '<p class="weibo mbspace">' +
                    '<a class="W_linkb" >' +
                      '  我给应用【开心交友猜猜看】打了5分 http://weibo.com/app/detail/4L8hIo (2011-6-29 14:08)' +
                   ' </a>' +
                   ' </p>' +
                    '<p class="from W_textb"> 通过' +
                    '<a class="W_linkb" href="http://s.weibo.com">微博搜索</a> 关注' +
                    '</p>' +
                    '<p class="more_info">' +
                    '<a class="W_moreup" title="更多资料" >' +
                   '更多资料' +
                    '<span class="more"></span>' +
                   ' </a>' +
                    '</p></div>' +
         '</div><div class="detail"></div>' +
        '</li>'
     );

     $('#' + delConcernLink).click(function () {
         var userName = getUserName();
         delConcern(userName, fan.UserName1);
      
     });
     function delConcern(userName, concern) {
         $.post("delConcern.ashx", { userName: userName, concern: concern },
      function (data, status) {
          if (status != "success") {
              alert("取消关注失败，请重试！");
              return;
          }
          if (data != "OK") {
              alert("取消关注失败，请重试！");
          }
          else {
              $('#' + delConcernli).remove();
              var wb = $("#concernsQuantity").text();
              var remain = parseInt(wb) - 1;
              $("#concernsQuantity").text(remain);
              $("#concernsQuantityTitle").text(remain);
          }
      });
     }


 }
