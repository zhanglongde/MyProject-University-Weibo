function checkPassageNo() {
    var passage = $("#weiboInputContent").val();
    var passageLength = passage.length;
    var remain = 140 - passageLength;   
    $("#passageNo").text(remain);
}

function checkPassageNo0() {
    var passage = $("#weiboInputContent0").val();
    var passageLength = passage.length;
    var remain = 140 - passageLength;
    $("#passageNo0").text(remain);
}