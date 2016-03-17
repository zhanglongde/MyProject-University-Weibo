window.onload = function () {



    var bigImageBox = 'bigImage_box',
		thumbnailBox = 'thumbnail',
		right = 'rotRight',
		left = 'rotLeft',
		img = 'rotImg',
		imgBox = 'image_box',
		cv = 'canvas',
		rot = 0;
    $$('.rot_box').each(function (elt) {
        elt.observe('click', function (e) {
            e.stop();
            var clickedElt = e.element();
            if (clickedElt.hasClassName(thumbnailBox)) {
                elt.down("." + bigImageBox).toggle();
                elt.down("." + thumbnailBox).toggle();
            } else if (clickedElt.hasClassName(img) || clickedElt.hasClassName(cv)) {
                rot = 0;
                setImg(elt, rot);
                elt.down("." + bigImageBox).toggle();
                elt.down("." + thumbnailBox).toggle();
            } else if (clickedElt.hasClassName(left)) {
                rot -= 90;
                if (rot == -90)
                    rot = 270;
                setImg(elt, rot);
            } else if (clickedElt.hasClassName(right)) {
                rot += 90;
                if (rot == 360)
                    rot = 0;
                setImg(elt, rot);
            }
        })
    })
    var setImg = function (elt, rot) {
        var imgElt = elt.down('.' + img);
        if (Prototype.Browser.IE) {
            imgBoxElt = elt.down('.' + imgBox);
            rotateForIE(imgBoxElt, imgElt, rot);
        } else {
            var cvElt = elt.down('.' + cv);
            rotate(cvElt, imgElt, rot);
        }
    }
    var rotateForIE = function (imgBoxElt, img, rot) {
        switch (rot) {
            case 90:
                img.hasClassName('rot_180') ? img.removeClassName('rot_180') : img.removeClassName('rot_0');
                img.addClassName('rot_90');
                break;
            case 180:
                img.hasClassName('rot_90') ? img.removeClassName('rot_90') : img.removeClassName('rot_270');
                img.addClassName('rot_180');
                break;
            case 270:
                img.hasClassName('rot_180') ? img.removeClassName('rot_180') : img.removeClassName('rot_0');
                img.addClassName('rot_270');
                break;
            case 0:
                img.hasClassName('rot_90') ? img.removeClassName('rot_90') : img.removeClassName('rot_270');
                break;
        }
        //ie8撑开容器元素
        imgBoxElt.setStyle({ height: img.getHeight() });

    }
    var rotate = function (canvas, img, rot) {
        var w = img.getWidth();
        var h = img.getHeight();
        //角度转为弧度
        if (!rot) {
            rot = 0;
        }
        var rotation = Math.PI * rot / 180;
        var c = Math.round(Math.cos(rotation) * 1000) / 1000;
        var s = Math.round(Math.sin(rotation) * 1000) / 1000;
        //旋转后canvas标签的大小
        canvas.height = Math.abs(c * h) + Math.abs(s * w);
        canvas.width = Math.abs(c * w) + Math.abs(s * h);
        //绘图开始
        var context = canvas.getContext("2d");
        context.save();
        //改变中心点
        if (rotation <= Math.PI / 2) {
            context.translate(s * h, 0);
        } else if (rotation <= Math.PI) {
            context.translate(canvas.width, -c * h);
        } else if (rotation <= 1.5 * Math.PI) {
            context.translate(-c * w, canvas.height);
        } else {
            context.translate(0, -s * w);
        }
        //旋转90°
        context.rotate(rotation);
        //绘制
        context.drawImage(img, 0, 0, w, h);
        context.restore();
        img.style.display = "none";
    }
};