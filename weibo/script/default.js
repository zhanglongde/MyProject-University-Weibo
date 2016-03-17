
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
$("#tansferImgLogo").click(function () {
//    $("post").prepend(html("#facebox1"))
    initfaceTransfer();
}); 
$("#btnIssue").click(function () {
    var url = document.URL;
    url = url.split("=");
    var userName = decodeURI(url[1]);
    issuePassage(userName);

});

$("#btnTransfer").click(function () {
    var url = document.URL;
    url = url.split("=");
    var userName = decodeURI(url[1]);
    transferPassage(userName);

}); 
//$(".face").click(function () { $(".detail").emotions(); });
//$(".tansmitlink").click(function () {  });


//$(".btn-comment").click(function () {
//    issueComment();
//});
//$(".btn-comment").click(function () {
//    issueComment(weibo.PassageNo);
//});

//查看结果
function viewFace(str) {
    str = str.replace(/\</g, '&lt;');
    str = str.replace(/\>/g, '&gt;');
    str = str.replace(/\n/g, '<br/>');
    str = str.replace(/\[\/表情([0-9]*)\]/g, '<img src="themes/default/face/$1.gif" border="0" />');
    return str;
}

$(document).ready(function () {
    $(".layer_faces").hide(); //隐藏表情下拉框

    var url = document.URL;
    url = url.split("=");
    var userName = decodeURI(url[1]);

    loadUserInf(userName);
    loadAllWeibos(userName);
    menu();
    advertise();
    initface();
   

});
//实例化表情插件
function initface() {
    $('#face1').qqFace({
        id: 'facebox1', //表情盒子的ID
        assign: 'weiboInputContent', //给那个控件赋值
        path: 'themes/default/face/'	//表情存放的路径
    });
}
function initfaceTransfer() {
    $('#faceTransfer').qqFace({
        id: 'facebox1', //表情盒子的ID
        assign: 'weiboInputContent0', //给那个控件赋值
        path: 'themes/default/face/'	//表情存放的路径
    });
}
function menu(){ 
            $("ul.sf-vertical").superfish({
                animation: { opacity: 'show', height: 'show' },
                speed: 'fast'
            });
        }
function advertise() {
    $('#slider').nivoSlider();
}

function loadAllWeibos(userName) {
    $.post("getAllWeibos.ashx", { userName: userName },
     function (datas, status) {
         if (status != "success") { alert("显示微博信息失败"); return; }
         else {
             for (var i = 0; i < datas.length; i++) {
                 var weibo = datas[i];
                 prependSingleWeibo(weibo);
             }
         }
     }, "json");
 }
 //                    '<img src='+weibo.PhotoPath1+'/>' +
 function prependSingleWeibo(weibo) {
     var commentLink = weibo.PassageNo + "1";
     var commentBtn = weibo.PassageNo + "2";
     var commentInput = weibo.PassageNo + "3";
     var commentDiv = weibo.PassageNo + "4";
     var passageNo= weibo.PassageNo + "5";
     var commentList = weibo.PassageNo + "6";
     var tansferLink = weibo.PassageNo + "4";
     var facestring = viewFace(weibo.Passage);
     //     alert(commentLink + commentBtn);
     //     prependCommentDiv(commentDiv, commentInput, commentBtn);
     $("#weiboContent").prepend(
         '<li >' +
            '<div class="head">' +
                         ' <img src=' + weibo.PhotoPath1 + '/>' +
               '</div>' +
                '<div class="content" id=' + passageNo + '>' +
                    '<p><a href="#">' + weibo.Issuer + '</a> ' +
                   facestring + '</p>' +
                    '<div class="pic">' +
     //                        '<img src="http://ww4.sinaimg.cn/thumbnail/69632a7cjw1dnag33emd8j.jpg" />' +
                    '</div>' +
                    '<p>' +
                        '<span class="time"><a href="#">' + weibo.IssueTime + '</a></span>' +
                        '来自' +
                        '<span class="time"><a href="#">新浪微博</a></span>' +
                        '<span class="f-r">' +
                        '<a href="#inline" id=' + tansferLink + '>转发</a>' +
                       ' |' +
                        '<a href="#">收藏</a>' +
                        '|' +
                        '<a id=' + commentLink + ' >评论</a>' +
                        '</span>' +
                    '</p>' +
               ' </div>' +
               ' <div class="clear"></div>' +
            '</li>'
);
     $('#' + tansferLink).fancybox({
      'centerOnScroll': true,
       'width':80,
       'height':1000
      });
//     $('#' + tansferLink).click(function () {
//    
//     });
   

     $('#' + commentLink).click(function () {
         if ($('#' + commentDiv).css("display") == "none") {
             $('#' + commentDiv).css("display", "block");
         }
         else if ($('#' + commentDiv).css("display") == "block") {
             $('#' + commentDiv).css("display", "none");
         }
         else {
             appendCommentDiv(passageNo, commentDiv, commentInput, commentBtn, commentList);
         }
     });
     function appendCommentDiv(passageNo, commentDiv, commentInput, commentBtn, commentList) {
         var faceId = passageNo + "0";
         $('#' + passageNo).append(
     '<div  id=' + commentDiv + 'class="commentdiv repeat W_textc W_linecolor W_bgcolor">' +
        '<div class="input clearfix">' +
                '<div>' +
            '<textarea id=' + commentInput + ' class="commentInputContent" rows="" cols=""  style="margin: 0px 0px 3px; padding: 4px 4px 0px; border-color: rgb(198, 198, 198); border-style: solid; border-width: 0.916667px; font-size: 12px; font-family: Tahoma,宋体; line-height: 18px; overflow: hidden; outline: medium none; width:478px;height: 20px;">' +
            '</textarea>' +
            '</div>' +
            '<div class="action clearfix" >' +
                '<span class="faces" title="表情"></span>' +
                ' <ul class="commoned_list">' +
                    '<li>' +
                     '<a id=' + faceId + ' class="face faceBtn" title="表情">表情</a>' +
                    '<label>' +
                    '<input class="W_checkbox" type="checkbox" name="forward"/>' +
                    ' 同时转发到我的微博' +
                    ' </label>' +
                    '</li>' +
                ' </ul>' +
            '</div>' +
            ' <p class="btn">' +
                    '<a id=' + commentBtn + ' class="btn-comment"  title="微博评论框">评论</a>' +
            '</p>' +
        ' </div>' +
    ' </div>' +
        '<div id='+ commentList + ' class="comment_lists">' +
        '</div>'
   );
         initface();
         //实例化表情插件
         function initface() {
            
             $('#' + faceId).qqFace({
                 id: 'facebox1', //表情盒子的ID
                 assign: commentInput, //给那个控件赋值
                 path: 'themes/default/face/'	//表情存放的路径
             });
         }

    $('#' + commentBtn).click(function () {
        appendComment(passageNo, commentList, commentInput);
    });
    }

    function appendComment(passageNo, commentList, commentInput) {
        var date = new Date();
        var pn = passageNo.substring(0,passageNo.length - 1);
        $.post("PostComment.ashx", { "comment": $('#' + commentInput).val(), "passageNo": pn },
      function (data, status) {
          if (status != "success") {
              alert("评论失败，请重试！");
              return;
          }
          if (data == "评论成功") {
              var str = $('#' + commentInput).val();
              var faceStr = viewFace(str);
              $('#' + commentList).append(
                '<dl class="comment_list W_linecolor">' +
                    '<dt>' +
                    '<a >' +
                    '<img width="30" height="30"  src=' + $("#headpicture").attr("src") + ' alt="雨水明镜落彩虹"/>' +
                    '</a>' +
                    '</dt>' +
                    '<dd>' +
                        '<a >' + $("#username").text() + '：</a>' + faceStr +
                          '&nbsp &nbsp &nbsp  &nbsp  &nbsp<a  class="time">' + date + ';</a>' +
                        '<p class="info W_textb">' +
                            '<span class="W_linkb">' +
                            '<a>删除</a>' +
                            '<i class="W_vline">|</i>' +
                            '<a>回复</a>' +
                            '</span>' +
                        '</p>' +
                    '</dd>' +
                    '<dd class="clear"></dd>' +
                '</dl>'
                   );
          }
          else {
              alert(data);
              alert("评论内容有问题！");

          }
      });

     }
 }

function loadUserInf(userName) {
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
              var pp = arrs[7];
              $("#username").append(us);
              $("#provinceAddress").append(pa);
              $("#cityAddress").append(ca);
              $("#concernsQuantity").append(cq);
              $("#fansQuantity").append(fq);
              $("#weiboPassageQuantity").text(wbq);
              $("#headpicture").attr({ src: pp, title: us, alt:us });
          }
          else {
              alert(arrs[0]);
              alert("评论发表内容有问题！");

          }
      });
  }
  function issuePassage(userName) {
      $.post("PostPassage.ashx", { "passage": $("#weiboInputContent").val(), "userName": userName },
      function (data, status) {
          if (status != "success") {
              alert("发布微博失败，请重试！");
              return;
          }
          var arrs = data.split("|");
          if (arrs[0] == "OK") {
              //       view('content');
              //              view('weiboInputContent');
              var commentLink = arrs[1] + "1";
              var commentBtn = arrs[1] + "2";
              var commentInput = arrs[1] + "3";
              var commentDiv = arrs[1] + "4";
              var passageNo = arrs[1] + "5";
              var commentList = arrs[1] + "6";
              var wb = $("#weiboPassageQuantity").text();
              var remain = parseInt(wb) + 1;
              $("#weiboPassageQuantity").text(remain);
              var facestr = viewFace(arrs[2]);
              $("#weiboContent").prepend(
                     '<li>' +
                        '<div class="head">' +
                            '<img src=' + arrs[5] + ' />' +
                        '</div>' +
                        '<div class="content">' +
                            '<p><a href="#">' + arrs[3] + '</a>' + facestr + '</p>' +
                            '<div class="pic">' +
              //                               ' <img src="http://ww4.sinaimg.cn/thumbnail/69632a7cjw1dnag33emd8j.jpg" />' +
                            '</div>' +
                            '<p>' +
                                '<span class="time"><a href="#">' + arrs[4] + '</a></span>' +
                                '来自' +
                                '<span class="time"><a href="#">新浪微博</a></span> ' +
                               ' <span class="f-r">' +
                                '<a href="#">转发</a>' +
                               ' |' +
                                '<a href="#">收藏</a>' +
                                '|' +
                                '<a id=' + commentLink + '>评论</a>' +
                                '</span>' +
                            '</p>' +
                        '</div>' +
                        '<div class="clear"></div>' +
                    '</li>'
                   );
          }
          else {
              alert(arrs[0]);
              alert("微博内容有问题！");

          }
      });   
  }


  function transferPassage(userName) {
      var passage = $("#weiboInputContent0").val() + "       "+$("#weiboInputContent1").text();
      $.post("PostPassage.ashx", { "passage": passage, "userName": userName },
      function (data, status) {
          if (status != "success") {
              alert("发布微博失败，请重试！");
              return;
          }
          var arrs = data.split("|");
          if (arrs[0] == "OK") {
              //       view('content');
              //              view('weiboInputContent');
              var commentLink = arrs[1] + "1";
              var commentBtn = arrs[1] + "2";
              var commentInput = arrs[1] + "3";
              var commentDiv = arrs[1] + "4";
              var passageNo = arrs[1] + "5";
              var commentList = arrs[1] + "6";
              var wb = $("#weiboPassageQuantity").text();
              var remain = parseInt(wb) + 1;
              $("#weiboPassageQuantity").text(remain);
              var facestr0 = viewFace($("#weiboInputContent0").val());
              var facestr1 = viewFace($("#weiboInputContent1").text());
              var bytransfer = $("#bytransfer").text();
              $("#weiboContent").prepend(
                     '<li>' +
                        '<div class="head">' +
                            '<img src=' + arrs[5] + ' />' +
                        '</div>' +
                        '<div class="content">' +
                            '<p><a href="#">' + arrs[3] + '</a>' + facestr0 + '</p>' +
                             '<p><a href="#">' + bytransfer + '</a>' + facestr1 + '</p>' +
                            '<div class="pic">' +
              //                               ' <img src="http://ww4.sinaimg.cn/thumbnail/69632a7cjw1dnag33emd8j.jpg" />' +
                            '</div>' +
                            '<p>' +
                                '<span class="time"><a href="#">' + arrs[4] + '</a></span>' +
                                '来自' +
                                '<span class="time"><a href="#">新浪微博</a></span> ' +
                               ' <span class="f-r">' +
                                '<a href="#">转发</a>' +
                               ' |' +
                                '<a href="#">收藏</a>' +
                                '|' +
                                '<a id=' + commentLink + '>评论</a>' +
                                '</span>' +
                            '</p>' +
                        '</div>' +
                        '<div class="clear"></div>' +
                    '</li>'
                   );
          }
          else {
              alert(arrs[0]);
              alert("微博内容有问题！");

          }
      });
  }







